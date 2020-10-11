# from .coords import (
#     count_coordinates,
#     get_coordinates,
#     set_coordinates
# )

# from .errors import GEOSException

# from .geos import (
#     geos_version,
#     geos_version_string,
#     geos_capi_version,
#     geos_capi_version_string,
# )

# from .pygeom import Geometry


##############

# from .core import (
#     geos_version,
#     geos_version_string,
#     geos_capi_version,
#     geos_capi_version_string,
# )

try:
    from .core import *

except ImportError:
    # Silently skip this when building modules
    pass