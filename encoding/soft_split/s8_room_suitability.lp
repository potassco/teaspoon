%%% RoomSuitability: Some rooms may be not suitable for a given course
%%% because of the absence of necessary equipment (projector,
%%% amplification, . . . ). Each lecture of a course in an unsuitable
%%% room counts as 1 violation.

% Soft constraint
penalty("RoomSuitability",assigned(C,R,D,P),W,Prior) :- 
	assigned(C,R,D,P),
	room_constraint(C,R),
	soft_constraint("RoomSuitability",W,Prior).

% Hard constraint
:- assigned(C,R,D,P), room_constraint(C,R), hard_constraint("RoomSuitability").

% End
