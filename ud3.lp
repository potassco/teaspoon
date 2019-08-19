%%% UD3 formulation: soft constraints with weights and priorities

soft_constraint("RoomCapacity",      1, 0).  % S1
soft_constraint("Windows",           4, 0).  % S4
soft_constraint("StudentMinMaxLoad", 2, 0).  % S6
soft_constraint("RoomSuitability",   3, 0).  % S8

% End
