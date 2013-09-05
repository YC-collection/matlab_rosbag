function [bagData] = convertToMatExample(filePath, fileName)

    pathToLoadData = fullfile(filePath, strcat(fileName, '.bag'));
    bag = ros.Bag(pathToLoadData);

    %% Show info
    bag.info()

    %% Load topics

    %% Example topics
    topic = '/example_topic';
    msgs = bag.readAll(topic);

    % Time
    accessor = @(msg) msg.header.stamp;
    converter = @ros.stamp2time;
    bagData.example.time = ros.msgs2mat(msgs, accessor, converter);

    % Translation
    accessor = @(msg) msg.transform;
    converter = @ros.transform2translation;
    bagData.example.translation = ros.msgs2mat(msgs, accessor, converter);

    % Rotation
    accessor = @(msg) msg.transform;
    converter = @ros.transform2yawpitchroll;
    bagData.example.yawpitchroll = ros.msgs2mat(msgs, accessor, converter);

    % Shift start time to zero
    startTime = bagData.example.time(1);
    bagData.example.time = bagData.example.time - startTime;

end
