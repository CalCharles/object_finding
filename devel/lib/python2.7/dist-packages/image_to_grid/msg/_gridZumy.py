# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from image_to_grid/gridZumy.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import image_to_grid.msg

class gridZumy(genpy.Message):
  _md5sum = "c69250648b8877b3f704f49ae46fa300"
  _type = "image_to_grid/gridZumy"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """pixelxy zumy
filteredImage image

================================================================================
MSG: image_to_grid/pixelxy
int16 x
int16 y
================================================================================
MSG: image_to_grid/filteredImage
bool[] image #true is 1, false is 0, convert with im_to_ndarray
int32 length
int32 width
float32 comp_factor

"""
  __slots__ = ['zumy','image']
  _slot_types = ['image_to_grid/pixelxy','image_to_grid/filteredImage']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       zumy,image

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(gridZumy, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.zumy is None:
        self.zumy = image_to_grid.msg.pixelxy()
      if self.image is None:
        self.image = image_to_grid.msg.filteredImage()
    else:
      self.zumy = image_to_grid.msg.pixelxy()
      self.image = image_to_grid.msg.filteredImage()

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
      buff.write(_struct_2h.pack(_x.zumy.x, _x.zumy.y))
      length = len(self.image.image)
      buff.write(_struct_I.pack(length))
      pattern = '<%sB'%length
      buff.write(struct.pack(pattern, *self.image.image))
      _x = self
      buff.write(_struct_2if.pack(_x.image.length, _x.image.width, _x.image.comp_factor))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.zumy is None:
        self.zumy = image_to_grid.msg.pixelxy()
      if self.image is None:
        self.image = image_to_grid.msg.filteredImage()
      end = 0
      _x = self
      start = end
      end += 4
      (_x.zumy.x, _x.zumy.y,) = _struct_2h.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sB'%length
      start = end
      end += struct.calcsize(pattern)
      self.image.image = struct.unpack(pattern, str[start:end])
      self.image.image = map(bool, self.image.image)
      _x = self
      start = end
      end += 12
      (_x.image.length, _x.image.width, _x.image.comp_factor,) = _struct_2if.unpack(str[start:end])
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
      buff.write(_struct_2h.pack(_x.zumy.x, _x.zumy.y))
      length = len(self.image.image)
      buff.write(_struct_I.pack(length))
      pattern = '<%sB'%length
      buff.write(self.image.image.tostring())
      _x = self
      buff.write(_struct_2if.pack(_x.image.length, _x.image.width, _x.image.comp_factor))
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
        self.zumy = image_to_grid.msg.pixelxy()
      if self.image is None:
        self.image = image_to_grid.msg.filteredImage()
      end = 0
      _x = self
      start = end
      end += 4
      (_x.zumy.x, _x.zumy.y,) = _struct_2h.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sB'%length
      start = end
      end += struct.calcsize(pattern)
      self.image.image = numpy.frombuffer(str[start:end], dtype=numpy.bool, count=length)
      self.image.image = map(bool, self.image.image)
      _x = self
      start = end
      end += 12
      (_x.image.length, _x.image.width, _x.image.comp_factor,) = _struct_2if.unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
_struct_2if = struct.Struct("<2if")
_struct_2h = struct.Struct("<2h")
