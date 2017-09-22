clear;

euler321_initial = deg2rad([10 15 13]');
omega_iee = deg2rad([2 0 0]');

[t_sim, y_sim] = ode45(@(t,y) rot_kinematics(t,y,omega_iee), [0 2], euler321_initial)