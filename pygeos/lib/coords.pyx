from cpython cimport PyObject

# FIXME: debub only
from libc.stdio cimport *


cimport numpy as np
import numpy as np

from pygeos.lib.coords cimport PyCountCoords, PyGetCoords, PySetCoords


# This MUST be called to initialize numpy C API for use in C functions
np.import_array()


def count_coordinates(*arr):
    """Counts the total amount of coordinates in a array with geometry objects"""

    ret = PyCountCoords(<PyObject *> arr)

    # if ret == NULL:
    #     # TODO: check exception
    #     return None

    return <object> ret


def get_coordinates(*args):
    """Gets the coordinates as an (N, 2) shaped ndarray of floats"""
    pass


def set_coordinates(*args):
    """Sets coordinates to a geometry array"""
    pass


# if arr is None:
#     return None

# TODO: typecheck that is ndarray of
# if not isinstance(arr, np.ndarray):
#     raise TypeError("Not an ndarray")

# if arr.dtype != np.object:
#     raise TypeError("Array should be of object dtype")

