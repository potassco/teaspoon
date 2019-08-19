%%% RoomStability: All lectures of a course should be given in the
%%% same room. Each distinct room used for the lectures of a course,
%%% but the first, counts as 1 violation.

using_room(C,R) :- assigned(C,R,D,P).

% Soft_constraint
penalty("RoomStability",using_room(C,N),(N-1)*W,Prior) :- 
	c(C),
	N = { using_room(C,R) }, 
	N > 1,
	soft_constraint("RoomStability",W,Prior).

% Hard_constraint
:- not { using_room(C,R) } 1, c(C), hard_constraint("RoomStability").

% End
