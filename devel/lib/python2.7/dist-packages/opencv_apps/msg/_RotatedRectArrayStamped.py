# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from opencv_apps/RotatedRectArrayStamped.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import opencv_apps.msg
import std_msgs.msg

class RotatedRectArrayStamped(genpy.Message):
  _md5sum = "89a2d4a7db2d2945ca46c25a3bd8c7c5"
  _type = "opencv_apps/RotatedRectArrayStamped"
  _has_header = True #flag to mark the presence of a Header object
  _full_text = """Header header
RotatedRect[] rects


================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: opencv_apps/RotatedRect
float64 angle
Point2D center
Size size

================================================================================
MSG: opencv_apps/Point2D
float64 x
float64 y


================================================================================
MSG: opencv_apps/Size
float64 width
float64 height


"""
  __slots__ = ['header','rects']
  _slot_types = ['std_msgs/Header','opencv_apps/RotatedRect[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,rects

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(RotatedRectArrayStamped, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.rects is None:
        self.rects = []
    else:
      self.header = std_msgs.msg.Header()
      self.rects = []

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_struct_3I.pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      length = len(self.rects)
      buff.write(_struct_I.pack(length))
      for val1 in self.rects:
        buff.write(_struct_d.pack(val1.angle))
        _v1 = val1.center
        _x = _v1
        buff.write(_struct_2d.pack(_x.x, _x.y))
        _v2 = val1.size
        _x = _v2
        buff.write(_struct_2d.pack(_x.width, _x.height))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.rects is None:
        self.rects = None
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _struct_3I.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.rects = []
      for i in range(0, length):
        val1 = opencv_apps.msg.RotatedRect()
        start = end
        end += 8
        (val1.angle,) = _struct_d.unpack(str[start:end])
        _v3 = val1.center
        _x = _v3
        start = end
        end += 16
        (_x.x, _x.y,) = _struct_2d.unpack(str[start:end])
        _v4 = val1.size
        _x = _v4
        start = end
        end += 16
        (_x.width, _x.height,) = _struct_2d.unpack(str[start:end])
        self.rects.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_struct_3I.pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      length = len(self.rects)
      buff.write(_struct_I.pack(length))
      for val1 in self.rects:
        buff.write(_struct_d.pack(val1.angle))
        _v5 = val1.center
        _x = _v5
        buff.write(_struct_2d.pack(_x.x, _x.y))
        _v6 = val1.size
        _x = _v6
        buff.write(_struct_2d.pack(_x.width, _x.height))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.rects is None:
        self.rects = None
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _struct_3I.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.rects = []
      for i in range(0, length):
        val1 = opencv_apps.msg.RotatedRect()
        start = end
        end += 8
        (val1.angle,) = _struct_d.unpack(str[start:end])
        _v7 = val1.center
        _x = _v7
        start = end
        end += 16
        (_x.x, _x.y,) = _struct_2d.unpack(str[start:end])
        _v8 = val1.size
        _x = _v8
        start = end
        end += 16
        (_x.width, _x.height,) = _struct_2d.unpack(str[start:end])
        self.rects.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
_struct_2d = struct.Struct("<2d")
_struct_3I = struct.Struct("<3I")
_struct_d = struct.Struct("<d")