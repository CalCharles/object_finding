# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from image_to_grid/toTarget.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import geometry_msgs.msg

class toTarget(genpy.Message):
  _md5sum = "54f6cde095f0ada672d5efcf4f2ed68b"
  _type = "image_to_grid/toTarget"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """geometry_msgs/Transform zumy
geometry_msgs/Transform target
================================================================================
MSG: geometry_msgs/Transform
# This represents the transform between two coordinate frames in free space.

Vector3 translation
Quaternion rotation

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 

float64 x
float64 y
float64 z
================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

"""
  __slots__ = ['zumy','target']
  _slot_types = ['geometry_msgs/Transform','geometry_msgs/Transform']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       zumy,target

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(toTarget, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.zumy is None:
        self.zumy = geometry_msgs.msg.Transform()
      if self.target is None:
        self.target = geometry_msgs.msg.Transform()
    else:
      self.zumy = geometry_msgs.msg.Transform()
      self.target = geometry_msgs.msg.Transform()

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
      buff.write(_struct_14d.pack(_x.zumy.translation.x, _x.zumy.translation.y, _x.zumy.translation.z, _x.zumy.rotation.x, _x.zumy.rotation.y, _x.zumy.rotation.z, _x.zumy.rotation.w, _x.target.translation.x, _x.target.translation.y, _x.target.translation.z, _x.target.rotation.x, _x.target.rotation.y, _x.target.rotation.z, _x.target.rotation.w))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.zumy is None:
        self.zumy = geometry_msgs.msg.Transform()
      if self.target is None:
        self.target = geometry_msgs.msg.Transform()
      end = 0
      _x = self
      start = end
      end += 112
      (_x.zumy.translation.x, _x.zumy.translation.y, _x.zumy.translation.z, _x.zumy.rotation.x, _x.zumy.rotation.y, _x.zumy.rotation.z, _x.zumy.rotation.w, _x.target.translation.x, _x.target.translation.y, _x.target.translation.z, _x.target.rotation.x, _x.target.rotation.y, _x.target.rotation.z, _x.target.rotation.w,) = _struct_14d.unpack(str[start:end])
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
      buff.write(_struct_14d.pack(_x.zumy.translation.x, _x.zumy.translation.y, _x.zumy.translation.z, _x.zumy.rotation.x, _x.zumy.rotation.y, _x.zumy.rotation.z, _x.zumy.rotation.w, _x.target.translation.x, _x.target.translation.y, _x.target.translation.z, _x.target.rotation.x, _x.target.rotation.y, _x.target.rotation.z, _x.target.rotation.w))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.zumy is None:
        self.zumy = geometry_msgs.msg.Transform()
      if self.target is None:
        self.target = geometry_msgs.msg.Transform()
      end = 0
      _x = self
      start = end
      end += 112
      (_x.zumy.translation.x, _x.zumy.translation.y, _x.zumy.translation.z, _x.zumy.rotation.x, _x.zumy.rotation.y, _x.zumy.rotation.z, _x.zumy.rotation.w, _x.target.translation.x, _x.target.translation.y, _x.target.translation.z, _x.target.rotation.x, _x.target.rotation.y, _x.target.rotation.z, _x.target.rotation.w,) = _struct_14d.unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
_struct_14d = struct.Struct("<14d")