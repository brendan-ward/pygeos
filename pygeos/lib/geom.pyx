from cpython cimport PyObject
cimport cython

# FIXME: debug only
from libc.stdio cimport *


import numpy as np
cimport numpy as np


from pygeos.lib.geos cimport *
from pygeos.lib.pygeom cimport *


@cython.boundscheck(False)
@cython.wraparound(False)
cdef geos_get_num_geometries(object[:] array):
    cdef unsigned int i = 0
    cdef GEOSContextHandle_t geos_handle = get_geos_handle()
    cdef GEOSGeometry *geom = NULL

    counts = np.zeros(shape=(array.size), dtype=np.intp)
    cdef np.intp_t [:] counts_view = counts[:]

    for i in range(array.size):
        if get_geom(<GeometryObject *>array[i], &geom) == 0:
            raise TypeError("One of the arguments is of incorrect type. Please provide "
            "only Geometry objects.")

        if geom == NULL:
            continue


        counts_view[i] = GEOSGetNumGeometries_r(geos_handle, geom)

    return counts


@cython.boundscheck(False)
@cython.wraparound(False)
def get_parts(object[:] array):
    cdef unsigned geom_idx = 0
    cdef unsigned part_idx = 0
    cdef unsigned idx = 0
    cdef GEOSContextHandle_t geos_handle = get_geos_handle()
    cdef GEOSGeometry *geom = NULL
    cdef GEOSGeometry *part = NULL

    cdef const np.intp_t [:] input_index_view = np.arange(0, len(array), dtype=np.intp)

    counts = geos_get_num_geometries(array)

    cdef np.intp_t [:] counts_view = counts[:]

    cdef unsigned int count = counts.sum()

    parts = np.empty(shape=(count, ), dtype=np.object)
    index = np.empty(shape=(count, ), dtype=np.intp)

    cdef object[:] parts_view = parts[:]
    cdef np.intp_t [:] index_view = index[:]

    for geom_idx in range(array.size):
        if get_geom(<GeometryObject *>array[geom_idx], &geom) == 0:
            raise TypeError("One of the arguments is of incorrect type. Please provide "
            "only Geometry objects.")

        if geom == NULL:
            continue

        for part_idx in range(counts_view[geom_idx]):
            index_view[idx] = geom_idx
            part = GEOSGetGeometryN_r(geos_handle, geom, part_idx)

            if part == NULL:
                parts_view[idx] = None

            else:
                # clone the geometry to keep it separate from the inputs
                part = GEOSGeom_clone_r(geos_handle, part)
                parts_view[idx] = <object>GeometryObject_FromGEOS(part, geos_handle)

            idx += 1


    return parts, index