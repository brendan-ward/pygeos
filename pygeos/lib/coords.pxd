from cpython cimport PyObject

# pygeos.lib.core MUST be imported for each Cython module that uses C functions from the
# Numpy C API
from pygeos.lib.core cimport *


cdef extern from "coords.h":
    PyObject *PyCountCoords(PyObject *args) except NULL
    PyObject *PyGetCoords(PyObject *args) except NULL
    PyObject *PySetCoords(PyObject *args) except NULL