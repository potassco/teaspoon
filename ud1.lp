%%% UD1 formulation: soft constraints with weights and priorities

soft_constraint("RoomCapacity",     1, 0).  % S1
soft_constraint("MinWorkingDays",   5, 0).  % S2
soft_constraint("IsolatedLectures", 1, 0).  % S3

% End
