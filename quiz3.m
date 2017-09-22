euler_angles = deg2rad([-5 10 25]');
omega_iee = deg2rad([7 1 3]');
rot_kinematics(0, euler_angles, omega_iee)
%%
syms psi theta phi psid thetad phid real
r_i_a = ...
    [0 0 1;
    0 cos(psi) -sin(psi);
    0 sin(psi) cos(psi)]

r_a_b = ...
    [cos(theta) -sin(theta) 0;
    sin(theta) cos(theta) 0;
    0 0 1]

r_b_e = ...
    [cos(phi) 0 sin(phi);
    0 1 0;
    -sin(phi) 0 cos(phi)]

r_a_b*r_b_e*[psid 0 0]' + r_b_e*[0 0 thetad]' + [0 phid 0]'