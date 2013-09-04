function [yawpitchroll] = transform2yawpitchroll(transform_msg)

    quaternion(1) = transform_msg.rotation(4);
    quaternion(2) = transform_msg.rotation(1);
    quaternion(3) = transform_msg.rotation(2);
    quaternion(4) = transform_msg.rotation(3);
    
    [yaw, pitch, roll] = quat2angle(quaternion, 'ZYX');
    yawpitchroll = [yaw, pitch, roll];

end
