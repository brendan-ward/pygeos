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


# PyGEOS wrapper for GEOS
cdef extern from "geos.h":
    cdef GEOS_HANDLE_ERR()
    cdef void geos_error_handler(const char *message, void *userdata)
    cdef geos_notice_handler(const char *message, void *userdata)

