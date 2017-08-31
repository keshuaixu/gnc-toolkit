sat_positions = [93 -68 94; -91 -3 60; -71 -15 83]';
measured_ranges = [133.1; 116.7; 110.7];

receiver_position = trilat_noclockbias(sat_positions, measured_ranges, [0;0;0], 1e-3, 1e-3, 1e3)