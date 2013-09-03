%% Clear all
clc
clear all

%% Add paths
addpath('/home/peter/ros_workspace/matlab_rosbag/src');

%% Define load and save paths
fileName = 'ros_bag_2013-08-30-21-59-59';
filePath = '';

%% Convert and save in MATLAB format
bagData = convertToMatExample(filePath, fileName);
pathToSaveData = fullfile(filePath, strcat(fileName, '.mat'));
save(pathToSaveData, 'bagData');
