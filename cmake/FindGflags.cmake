set(_gflags_ORIG_CMAKE_FIND_LIBRARY_SUFFIXES ${CMAKE_FIND_LIBRARY_SUFFIXES})

find_path(Gflags_INCLUDE_PATH gflags/gflags.h)

if (Gflags_STATIC)
  if (WIN32)
    set(CMAKE_FIND_LIBRARY_SUFFIXES .lib ${CMAKE_FIND_LIBRARY_SUFFIXES})
  else (WIN32)
    set(CMAKE_FIND_LIBRARY_SUFFIXES .a ${CMAKE_FIND_LIBRARY_SUFFIXES})
  endif (WIN32)
endif (Gflags_STATIC)
find_library(Gflags_LIBRARY NAMES gflags libgflags)
if(Gflags_INCLUDE_PATH AND Gflags_LIBRARY)
  set(Gflags_FOUND TRUE)
endif(Gflags_INCLUDE_PATH AND Gflags_LIBRARY)
if(Gflags_FOUND)
  if(NOT Gflags_FIND_QUIETLY)
    message(STATUS "Found gflags: ${Gflags_LIBRARY}")
  endif(NOT Gflags_FIND_QUIETLY)
else(Gflags_FOUND)
  if(Gflags_FIND_REQUIRED)
    message(FATAL_ERROR "Could not find gflags library.")
  endif(Gflags_FIND_REQUIRED)
endif(Gflags_FOUND)

set(CMAKE_FIND_LIBRARY_SUFFIXES ${_gflags_ORIG_CMAKE_FIND_LIBRARY_SUFFIXES})
