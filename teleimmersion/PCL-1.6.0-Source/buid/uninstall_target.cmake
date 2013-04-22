if(NOT EXISTS "/Users/arpitagarwal/Desktop/kinect/teleimmersion/PCL-1.6.0-Source/buid/install_manifest.txt")
    message(FATAL_ERROR "Cannot find install manifest: \"/Users/arpitagarwal/Desktop/kinect/teleimmersion/PCL-1.6.0-Source/buid/install_manifest.txt\"")
endif(NOT EXISTS "/Users/arpitagarwal/Desktop/kinect/teleimmersion/PCL-1.6.0-Source/buid/install_manifest.txt")

file(READ "/Users/arpitagarwal/Desktop/kinect/teleimmersion/PCL-1.6.0-Source/buid/install_manifest.txt" files)
string(REGEX REPLACE "\n" ";" files "${files}")
foreach(file ${files})
    message(STATUS "Uninstalling \"$ENV{DESTDIR}${file}\"")
    message(STATUS "Uninstalling \"$ENV{DESTDIR}${file}\"")
    if(EXISTS "$ENV{DESTDIR}${file}" OR IS_SYMLINK "$ENV{DESTDIR}${file}")
        exec_program("/usr/local/Cellar/cmake/2.8.10.2/bin/cmake" ARGS "-E remove \"$ENV{DESTDIR}${file}\""
            OUTPUT_VARIABLE rm_out RETURN_VALUE rm_retval)
        if(NOT "${rm_retval}" STREQUAL 0)
            message(FATAL_ERROR "Problem when removing \"$ENV{DESTDIR}${file}\"")
        endif(NOT "${rm_retval}" STREQUAL 0)
    else(EXISTS "$ENV{DESTDIR}${file}" OR IS_SYMLINK "$ENV{DESTDIR}${file}")
        message(STATUS "File \"$ENV{DESTDIR}${file}\" does not exist.")
    endif(EXISTS "$ENV{DESTDIR}${file}" OR IS_SYMLINK "$ENV{DESTDIR}${file}")
endforeach(file)

# remove pcl directory in include (removes all files in it!)
message(STATUS "Uninstalling \"/usr/local/include/pcl-1.6\"")
if(EXISTS "/usr/local/include/pcl-1.6")
    exec_program("/usr/local/Cellar/cmake/2.8.10.2/bin/cmake"
        ARGS "-E remove_directory \"/usr/local/include/pcl-1.6\""
        OUTPUT_VARIABLE rm_out RETURN_VALUE rm_retval)
    if(NOT "${rm_retval}" STREQUAL 0)
        message(FATAL_ERROR
            "Problem when removing \"/usr/local/include/pcl-1.6\"")
    endif(NOT "${rm_retval}" STREQUAL 0)
else(EXISTS "/usr/local/include/pcl-1.6")
    message(STATUS
        "Directory \"/usr/local/include/pcl-1.6\" does not exist.")
endif(EXISTS "/usr/local/include/pcl-1.6")

# remove pcl directory in share (removes all files in it!)
# created by CMakeLists.txt for PCLConfig.cmake
message(STATUS "Uninstalling \"/usr/local/share/pcl-1.6\"")
if(EXISTS "/usr/local/share/pcl-1.6")
    exec_program("/usr/local/Cellar/cmake/2.8.10.2/bin/cmake"
        ARGS "-E remove_directory \"/usr/local/share/pcl-1.6\""
        OUTPUT_VARIABLE rm_out RETURN_VALUE rm_retval)
    if(NOT "${rm_retval}" STREQUAL 0)
        message(FATAL_ERROR
            "Problem when removing \"/usr/local/share/pcl-1.6\"")
    endif(NOT "${rm_retval}" STREQUAL 0)
else(EXISTS "/usr/local/share/pcl-1.6")
    message(STATUS
        "Directory \"/usr/local/share/pcl-1.6\" does not exist.")
endif(EXISTS "/usr/local/share/pcl-1.6")

# remove pcl directory in share (removes all files in it!)
# created by CMakeLists.txt for PCLConfig.cmake
message(STATUS "Uninstalling \"/usr/local/share/doc/pcl-1.6\"")
if(EXISTS "/usr/local/share/doc/pcl-1.6")
    exec_program("/usr/local/Cellar/cmake/2.8.10.2/bin/cmake"
        ARGS "-E remove_directory \"/usr/local/share/doc/pcl-1.6\""
        OUTPUT_VARIABLE rm_out RETURN_VALUE rm_retval)
    if(NOT "${rm_retval}" STREQUAL 0)
        message(FATAL_ERROR
            "Problem when removing \"/usr/local/share/doc/pcl-1.6\"")
    endif(NOT "${rm_retval}" STREQUAL 0)
else(EXISTS "/usr/local/share/doc/pcl-1.6")
    message(STATUS
        "Directory \"/usr/local/share/doc/pcl-1.6\" does not exist.")
endif(EXISTS "/usr/local/share/doc/pcl-1.6")
