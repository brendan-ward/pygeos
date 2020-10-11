from cpython cimport PyObject

# FIXME: debub only
from libc.stdio cimport *


cimport numpy as np
import numpy as np

from pygeos.lib.coords cimport PyCountCoords, PyGetCoords, PySetCoords


# This MUST be called to initialize numpy C API for use in C functions
np.import_array()


def count_coordinates(*args):
    """Counts the number of coordinate pairs in a geometry array."""

    return <object>PyCountCoords(<PyObject *> args)


def get_coordinates(*args):
    """Gets coordinates from a geometry array as an array of floats."""

    return <object> PyGetCoords(<PyObject *> args)


def set_coordinates(*args):
    """Returns a copy of a geometry array with different coordinates."""

    return <object> PySetCoords(<PyObject *> args)
