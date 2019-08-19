%%% UD4 formulation: soft constraints with weights and priorities

soft_constraint("RoomCapacity",      1, 0).  % S1
soft_constraint("MinWorkingDays",    1, 0).  % S2
soft_constraint("Windows",           1, 0).  % S4
soft_constraint("StudentMinMaxLoad", 1, 0).  % S6
hard_constraint("RoomSuitability").          % S8
soft_constraint("DoubleLectures",    1, 0).  % S9

% End
