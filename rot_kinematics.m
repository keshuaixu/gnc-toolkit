function [ euler321_angles_dot ] = rot_kinematics( t, euler321_angles, omega_iee )
%ROT_KINEMATICS Summary of this function goes here
%   Detailed explanation goes here
R = rotx(euler321_angles(1))*roty(euler321_angles(2))*rotz(euler321_angles(3));
euler321_angles_dot = R \ omega_iee;
end

