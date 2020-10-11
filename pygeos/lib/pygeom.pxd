from cpython cimport PyObject
from numpy cimport intp_t

from pygeos.lib.core cimport *
from pygeos.lib.geos cimport GEOSContextHandle_t, GEOSGeometry


cdef extern from "pygeom.h":
    ctypedef struct GeometryObject:
        intp_t ptr

    ctypedef class pygeos.lib.core.Geometry [object GeometryObject]:
        cdef intp_t _ptr "ptr"

    PyObject *GeometryObject_FromGEOS(GEOSGeometry *ptr, GEOSContextHandle_t ctx)
    char get_geom(GeometryObject *obj, GEOSGeometry **out)

