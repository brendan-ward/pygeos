# GEOS C API
cdef extern from "geos_c.h":
    cdef long GEOS_VERSION_MAJOR
    cdef long GEOS_VERSION_MINOR
    cdef long GEOS_VERSION_PATCH
    cdef char *GEOS_VERSION

    cdef long GEOS_CAPI_VERSION_MAJOR
    cdef long GEOS_CAPI_VERSION_MINOR
    cdef long GEOS_CAPI_VERSION_PATCH
    cdef char *GEOS_CAPI_VERSION

    ctypedef void *GEOSContextHandle_t
    GEOSContextHandle_t GEOS_init_r()
    ctypedef struct GEOSGeometry

    const GEOSGeometry* GEOSGetGeometryN_r(GEOSContextHandle_t handle, const GEOSGeometry* g, int n)
    int GEOSGetNumGeometries_r(GEOSContextHandle_t handle, const GEOSGeometry* g)
    int GEOSisEmpty_r(GEOSContextHandle_t handle, const GEOSGeometry* g)
    GEOSGeometry* GEOSGeom_clone_r(GEOSContextHandle_t handle, const GEOSGeometry* g)


cdef GEOSContextHandle_t get_geos_handle()



# PyGEOS wrapper for GEOS
cdef extern from "geos.h":
    cdef GEOS_HANDLE_ERR()
    cdef void geos_error_handler(const char *message, void *userdata)
    cdef geos_notice_handler(const char *message, void *userdata)

