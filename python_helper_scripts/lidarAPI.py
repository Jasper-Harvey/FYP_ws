'''
Very simple script to monitor the LiDAR temperature and status.
Can also toggle the LiDAR state to Run/Idle

By Jasper Harvey - 17/10/2022
'''

import requests
from PyQt5.QtWidgets import QMainWindow, QPushButton, QVBoxLayout, QLabel, QWidget, QApplication
from PyQt5.QtCore import QTimer
from PyQt5.QtGui import QFont


class MainWindow(QMainWindow):

    def __init__(self, *args, **kwargs):
        super(MainWindow, self).__init__(*args, **kwargs)

        self.api_url = "http://192.168.9.10:8007/"

        self.toggleButton = QPushButton("Run/Idle")
        self.toggleButton.setFont(QFont("Arial", 20))
        self.toggleButton.pressed.connect(self.toggleMode)

        self.mode = QLabel()
        self.mode.setFont(QFont("Arial", 20))
        self.tx_temp = QLabel()
        self.tx_temp.setFont(QFont("Arial", 20))
        self.rx_temp = QLabel()
        self.rx_temp.setFont(QFont("Arial", 20))
        self.processor_temp = QLabel()
        self.processor_temp.setFont(QFont("Arial", 20))

        layout = QVBoxLayout()
        layout.setSpacing(15)
        layout.addWidget(self.toggleButton)
        layout.addWidget(self.mode)
        layout.addWidget(self.tx_temp)
        layout.addWidget(self.rx_temp)
        layout.addWidget(self.processor_temp)
        w = QWidget()
        w.setLayout(layout)
        
        self.setCentralWidget(w)
        self.show()

        self.timer = QTimer()
        self.timer.setInterval(1000)
        self.timer.timeout.connect(self.update_stats)
        self.timer.start()

    def update_stats(self):
        temps = self.get_temperature()
        mode = self.get_mode()

        # print(mode)
        
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
        reply = requests.get(self.api_url + "DeviceStatus/Get?stat_tx_temp&stat_rx_temp&stat_proc_temp")

        return reply.json()

    def get_mode(self):
        reply = requests.get(self.api_url + "Mode/Get")

        return reply.json()

    def toggleMode(self):
        current_mode = requests.get(self.api_url + "Mode/Get")

        if current_mode.json()["Mode"] == "Idle":
            change_mode = requests.get(self.api_url + "Mode/Set/Run")

        if current_mode.json()["Mode"] == "Running":
            change_mode = requests.get(self.api_url + "Mode/Set/Idle")

        print(current_mode.json)
        

########### Main #############
if __name__ == "__main__":
    app = QApplication([])
    window = MainWindow()
    app.exec_()