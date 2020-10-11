# from pygeos.lib.geos cimport *

# geos_version = (GEOS_VERSION_MAJOR, GEOS_VERSION_MINOR, GEOS_VERSION_PATCH)
# geos_version_string = GEOS_VERSION.decode('UTF-8')

# geos_capi_version = (GEOS_CAPI_VERSION_MAJOR, GEOS_CAPI_VERSION_MINOR, GEOS_CAPI_VERSION_PATCH)
# geos_capi_version_string = GEOS_CAPI_VERSION.decode('UTF-8')


cdef GEOSContextHandle_t get_geos_handle():
    """Provides GEOS context pointer to use in GEOS functions called from
    within Cython functions.
    """

    cdef GEOSContextHandle_t handle

    handle = GEOS_init_r()
    return handle