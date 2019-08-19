%%% UD2 formulation: soft constraints with weights and priorities

soft_constraint("RoomCapacity",     1, 0).  % S1
soft_constraint("MinWorkingDays",   5, 0).  % S2
soft_constraint("IsolatedLectures", 2, 0).  % S3
soft_constraint("RoomStability",    1, 0).  % S5

% End
