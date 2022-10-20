'''
Very simple script to monitor the LiDAR temperature and status.
Can also toggle the LiDAR state to Run/Idle

Was a quick hack job... No guarantees are made about how well it all works

By Jasper Harvey - 17/10/2022
'''

import requests
from PyQt5.QtCore import Qt
from PyQt5.QtWidgets import QMainWindow, QPushButton, QVBoxLayout, QHBoxLayout, QLabel, QWidget, QApplication, QComboBox
from PyQt5.QtCore import QTimer
from PyQt5.QtGui import QFont

OFFLINE_DEBUG = False # For development when I dont have access to the LiDAR

class MainWindow(QMainWindow):

    def __init__(self, *args, **kwargs):
        super(MainWindow, self).__init__(*args, **kwargs)

        self.api_url = "http://192.168.9.10:8007/"

        # Link api call and scan name
        # Typical way to call the API is playtable=playtable-[name].txt
        self.scanOptions = (
            ("128 Point", self.api_url + "playtable/set?playtable=playtable-128_point.txt"),
            ("1000 Point", self.api_url + "playtable/set?playtable=playtable-1000_point.txt"),
            ("128 Point Uniform", self.api_url + "playtable/set?playtable=playtable-128_Uniform.txt"),
            ("96 Point Uniform", self.api_url + "playtable/set?playtable=playtable-96_Uniform.txt"),
        )

    
        self.toggleButton = QPushButton("Run/Idle")
        self.toggleButton.setFont(QFont("Arial", 20))
        self.toggleButton.pressed.connect(self.toggleMode)

        self.modeBox = QComboBox()
        for item in self.scanOptions:
            self.modeBox.addItem(item[0])

        self.modeOk = QPushButton("Change Mode")
        self.modeOk.clicked.connect(self.changeScanMode)
        self.currentModeLabel = QLabel("Current Mode: \n96 Point")
        self.currentModeLabel.setFont(QFont("Arial", 14))
        modeLabel = QLabel("Set scan mode:")
        modeLabel.setFont(QFont("Arial", 14))

        self.mode = QLabel()
        self.mode.setFont(QFont("Arial", 20))
        self.tx_temp = QLabel()
        self.tx_temp.setFont(QFont("Arial", 20))
        self.rx_temp = QLabel()
        self.rx_temp.setFont(QFont("Arial", 20))
        self.processor_temp = QLabel()
        self.processor_temp.setFont(QFont("Arial", 20))

        Vlayout = QVBoxLayout()
        Vlayout.setSpacing(15)
        Vlayout.addWidget(self.toggleButton, alignment=Qt.AlignTop)
        Vlayout.addWidget(self.mode)
        Vlayout.addWidget(self.tx_temp)
        Vlayout.addWidget(self.rx_temp)
        Vlayout.addWidget(self.processor_temp)

        leftPanel = QWidget()
        leftPanel.setLayout(Vlayout)

        Vlayout = QVBoxLayout()
        Vlayout.addWidget(modeLabel, alignment=Qt.AlignTop)
        Vlayout.addWidget(self.modeBox, alignment=Qt.AlignTop)
        Vlayout.addWidget(self.modeOk)
        Vlayout.addWidget(self.currentModeLabel)
        Vlayout.setSpacing(15)
        Vlayout.addStretch(1)
        rightPanel = QWidget()
        rightPanel.setLayout(Vlayout)
        
        Hlayout = QHBoxLayout()
        Hlayout.addWidget(leftPanel)
        Hlayout.addWidget(rightPanel)
        
        w = QWidget()
        w.setLayout(Hlayout)
        
        self.setCentralWidget(w)
        self.show()

        self.timer = QTimer()
        self.timer.setInterval(1000)
        self.timer.timeout.connect(self.update_stats)
        self.timer.start()

    def update_stats(self):
        temps = self.get_temperature()
        mode = self.get_mode()
        
        tx_temp = temps["stat_tx_temp"]
        rx_temp = temps["stat_rx_temp"]
        proc_temp = temps["stat_proc_temp"]


        self.tx_temp.setText("TX Temp: " + str(tx_temp/100) + " C")
        self.rx_temp.setText("RX Temp: " + str(rx_temp/100) + " C")
        self.processor_temp.setText("Processor Temp: " + str(proc_temp/100) + " C")

        if proc_temp/100 > 70:
            self.processor_temp.setStyleSheet("background-color: red")
        if proc_temp/100 < 70:
            self.processor_temp.setStyleSheet("background-color: green")

        if mode["Error"] == 0:
            self.mode.setText("Mode: " + mode["Mode"])
        else:
            self.mode.setText("Mode: error" + mode["Error"])

        if mode["Mode"] == "Idle":
            self.mode.setStyleSheet("background-color: green")
        if mode["Mode"] == "Running":
            self.mode.setStyleSheet("background-color: red")

    def get_temperature(self):
        if OFFLINE_DEBUG:
            return {"stat_tx_temp": 2033,
                    "stat_rx_temp": 2213,
                    "stat_proc_temp" : 5535}

        reply = requests.get(self.api_url + "DeviceStatus/Get?stat_tx_temp&stat_rx_temp&stat_proc_temp")
        return reply.json() 

    def get_mode(self):
        if OFFLINE_DEBUG:
            return {"Mode" : "Idle",
                    "Error" : 0}

        reply = requests.get(self.api_url + "Mode/Get")
        return reply.json()

    def toggleMode(self):
        current_mode = requests.get(self.api_url + "Mode/Get")

        if current_mode.json()["Mode"] == "Idle":
            change_mode = requests.get(self.api_url + "Mode/Set/Run")

        if current_mode.json()["Mode"] == "Running":
            change_mode = requests.get(self.api_url + "Mode/Set/Idle")

        # print(current_mode.json)        

    def changeScanMode(self):
        currentIdx = self.modeBox.currentIndex()
        print(self.scanOptions[currentIdx])
        if OFFLINE_DEBUG:
            return

    
        try:
            option = self.scanOptions[currentIdx]
            change_mode = requests.post(option[1]).json()
            print(change_mode)

            for items in self.scanOptions:
                if change_mode["result"] in items[1]:
                    self.currentModeLabel.setText("Current Mode: \n" + items[0])

        except IndexError:
            print("Not implemented yet.")
            return
        

########### Main #############
if __name__ == "__main__":
    app = QApplication([])
    window = MainWindow()
    app.exec_()