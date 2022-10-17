// Auto-generated. Do not edit!

// (in-package baraja.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class SetPlaytableRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.playtable = null;
    }
    else {
      if (initObj.hasOwnProperty('playtable')) {
        this.playtable = initObj.playtable
      }
      else {
        this.playtable = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetPlaytableRequest
    // Serialize message field [playtable]
    bufferOffset = _serializer.string(obj.playtable, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetPlaytableRequest
    let len;
    let data = new SetPlaytableRequest(null);
    // Deserialize message field [playtable]
    data.playtable = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.playtable.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'baraja/SetPlaytableRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '35d5e5d6241fd7567b70565e1f476490';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string playtable
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetPlaytableRequest(null);
    if (msg.playtable !== undefined) {
      resolved.playtable = msg.playtable;
    }
    else {
      resolved.playtable = ''
    }

    return resolved;
    }
};

class SetPlaytableResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetPlaytableResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetPlaytableResponse
    let len;
    let data = new SetPlaytableResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'baraja/SetPlaytableResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '358e233cde0c8a8bcfea4ce193f8fc15';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetPlaytableResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

module.exports = {
  Request: SetPlaytableRequest,
  Response: SetPlaytableResponse,
  md5sum() { return '9bf43e869557d516272a55c9c106e00b'; },
  datatype() { return 'baraja/SetPlaytable'; }
};
