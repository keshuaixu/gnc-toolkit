function [receiver_position] = trilat_noclockbias(satellite_positions, measured_ranges, initial_guess, e1, e2, max_iter)
%TRILAT_NOCLOCKBIAS Summary of this function goes here
%   Detailed explanation goes here

big_fat_one = @(p_r_guess, p_sat) (p_r_guess - p_sat) / norm(p_r_guess - p_sat);
receiver_position = initial_guess;

for iter = 1:max_iter
    A = cell2mat(cellfun(@(p_sat) big_fat_one(receiver_position, p_sat)', num2cell(satellite_positions, 1), 'UniformOutput', false)');
    b = measured_ranges - cellfun(@norm, num2cell(bsxfun(@minus, receiver_position, satellite_positions), 1))';
    d_p = A \ b;
    receiver_position = receiver_position + d_p;
    if norm(d_p) < e1 || norm(b) < e2
        return
    end
end
error('reached maximum iteration')
end