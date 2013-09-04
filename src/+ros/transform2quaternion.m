function [quaternion] = transform2quaternion(transform_msg)

	quaternion(1) = transform_msg.rotation(4);
    quaternion(2) = transform_msg.rotation(1);
    quaternion(3) = transform_msg.rotation(2);
    quaternion(4) = transform_msg.rotation(3);

end