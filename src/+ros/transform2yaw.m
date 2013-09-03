function [yaw] = transform2yaw(transform_msg)

    [yaw, pitch, roll] = quat2angle(transform_msg.rotation', 'ZYX');

end