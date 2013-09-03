%% Clear all
clc
clear all    

%% Add paths
addpath('/home/peter/ros_workspace/matlab_rosbag/src');

%% Define load path
filePath = '';

%% Get all bag files in folder
fileList = dir(fullfile(filePath, '*.bag'));

if ~isempty(fileList)
    for i = 1:size(fileList, 1)
        % Get file name
        [~, fileName, ~] = fileparts(fileList(i).name);
        
        % Convert to MATLAB format
        bagData = convertToMat(filePath, fileName);
        
        % Save MAT file
        pathToSaveData = fullfile(filePath, strcat(fileName, '.mat'));
        save(pathToSaveData, 'bagData');
        
        % Output
        disp(['File ', fileList(i).name, ' converted and saved as ', fileName, '.mat.']);
    end
end

disp('Finished.')