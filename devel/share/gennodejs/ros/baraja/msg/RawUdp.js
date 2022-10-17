// Auto-generated. Do not edit!

// (in-package baraja.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class RawUdp {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.engine_ip = null;
      this.udp_buffer = null;
    }
    else {
      if (initObj.hasOwnProperty('engine_ip')) {
        this.engine_ip = initObj.engine_ip
      }
      else {
        this.engine_ip = '';
      }
      if (initObj.hasOwnProperty('udp_buffer')) {
        this.udp_buffer = initObj.udp_buffer
      }
      else {
        this.udp_buffer = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RawUdp
    // Serialize message field [engine_ip]
    bufferOffset = _serializer.string(obj.engine_ip, buffer, bufferOffset);
    // Serialize message field [udp_buffer]
    bufferOffset = _arraySerializer.int8(obj.udp_buffer, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RawUdp
    let len;
    let data = new RawUdp(null);
    // Deserialize message field [engine_ip]
    data.engine_ip = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [udp_buffer]
    data.udp_buffer = _arrayDeserializer.int8(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.engine_ip.length;
    length += object.udp_buffer.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'baraja/RawUdp';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'eb94c58e0ae8bba1199cfb8b90a1cd25';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string engine_ip
    int8[] udp_buffer
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RawUdp(null);
    if (msg.engine_ip !== undefined) {
      resolved.engine_ip = msg.engine_ip;
    }
    else {
      resolved.engine_ip = ''
    }

    if (msg.udp_buffer !== undefined) {
      resolved.udp_buffer = msg.udp_buffer;
    }
    else {
      resolved.udp_buffer = []
    }

    return resolved;
    }
};

module.exports = RawUdp;
