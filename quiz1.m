pr = [10 10 10]';
p1 = [75 32 68]';
p2 = [90 0 60]';
p3 = [80 20 60]';
r = [67.72 80.07 67.61]';
satpos = horzcat(p1,p2,p3)

diffnorm = @(receiver_position, satellite_positions) cellfun(@norm, num2cell(bsxfun(@minus, receiver_position, satellite_positions), 1))';

diffnorm_num = diffnorm(pr, satpos)

b  = r - diffnorm(pr, satpos)

big_fat_one = @(p_r_guess, p_sat) (p_r_guess - p_sat) / norm(p_r_guess - p_sat);
A =  @(receiver_position, satellite_positions) cell2mat(cellfun(@(p_sat) big_fat_one(receiver_position, p_sat)', num2cell(satellite_positions, 1), 'UniformOutput', false)');

A_num = A(pr, satpos)

d_p = A_num \ b

pr_new = pr + d_p

norm(d_p)

receiver_position = trilat_noclockbias(satpos, r, [10;10;10], 1e-3, 1e-3, 1e3)