include(CMakeForceCompiler)
# the name of the target operating system
SET(CMAKE_SYSTEM_NAME Darwin)

# The libgit2 CMakeFile.txt needs this to be set:
SET(CMAKE_SIZEOF_VOID_P 8)

# which compilers to use for C and C++
cmake_force_c_compiler(/usr/local/osx-ndk-x86/bin/x86_64-apple-darwin15-clang Clang)
cmake_force_cxx_compiler(/usr/local/osx-ndk-x86/bin/x86_64-apple-darwin15-clang++ Clang)
SET(CMAKE_AR /usr/local/osx-ndk-x86/bin/x86_64-apple-darwin15-ar CACHE FILEPATH "Archiver")
SET(PKG_CONFIG_EXECUTABLE /usr/local/osx-ndk-x86/bin/x86_64h-apple-darwin15-pkg-config)

SET(CMAKE_OSX_SYSROOT /usr/local/osx-ndk-x86/SDK/MacOSX10.11.sdk)

# here is the target environment located
#SET(CMAKE_FIND_ROOT_PATH ${CMAKE_OSX_SYSROOT} ${CMAKE_OSX_SYSROOT}/usr/bin)
SET(CMAKE_FIND_ROOT_PATH /usr/local/osx-ndk-x86/macports/pkgs/opt/local ${CMAKE_OSX_SYSROOT} ${CMAKE_OSX_SYSROOT}/usr/bin )

# adjust the default behaviour of the FIND_XXX() commands:
# search headers and libraries in the target environment, search
# programs in the host environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
