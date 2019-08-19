%%% UD5 formulation: soft constraints with weights and priorities

soft_constraint("RoomCapacity",      1, 0). % S1
soft_constraint("MinWorkingDays",    5, 0). % S2
soft_constraint("IsolatedLectures",  1, 0). % S3
soft_constraint("Windows",           2, 0). % S4
soft_constraint("StudentMinMaxLoad", 2, 0). % S6
soft_constraint("TravelDistance",    2, 0). % S7

% End
