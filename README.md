# Overview

matlab_rosbag is a library for reading ROS bags in Matlab.  It uses the C++ ROS API and returns messages as structs.  It also lets get meta-data about the bag (i.e., topic info and message definitions similar to <tt>rosmsg show</tt> and <tt>rosbag info</tt>).  Because all of the work is done inside of a statically linked mex function, ROS does not need to be installed on a machine to use this library.

You can download the compiled code for Mac and Linux from sourceforge:

https://sourceforge.net/projects/matlabrosbag/files

If you want to compile things yourself see [COMPILING.md](COMPILING.md).  WARNING: This library won't work at all if your machine is big-endian.

# Usage

Download the library and add the base directory to your Matlab path (i.e., add the directory that contains <tt>+ros</tt> and <tt>rosbag_wrapper</tt>).  You should now be able to access <tt>ros.Bag</tt>, a Matlab class which can read ROS messages on topics from a bag and return them as structs.  Multiple messages are returned as cell arrays.  It's also possible to access some meta-data (e.g., topic, msg type).  To get an idea of how the code works go to the <tt>example</tt> directory and look at <tt>example.m</tt> and <tt>example.bag</tt>.

The fields in the structs are guaranteed to be in the same order as they are in the message definition.  There are also some utilities for converting messages from structs to matrices.

NOTE: Prior to [version 1.2](http://www.ros.org/wiki/Bags/Format/1.2), bags do not store message definitions.  As such, matlab_rosbag won't be able to do anything with these old bags.  Don't worry about this if you've been using a not terribly old version of ROS (i.e., C turtle and later).

# Ubuntu later than 10.04

Matlab ships with an old version of the C++ standard library that you'll need to get rid of.  To do this, follow these steps from the command line:

    cd /usr/local/MATLAB/<version>/sys/os/<system>
    mkdir backup
    mv libstdc++* backup

# License

matlab_rosbag is licensed under the BSD license.
