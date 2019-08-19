%%% TravelDistance: Students should have the time to move from one
%%% building to another one between two lectures. For a given
%%% curriculum we account for a violation every time there is an
%%% instantaneous move: two lectures in rooms located in different
%%% building in two adjacent periods within the same day. Each
%%% instantaneous move in a curriculum counts as 1 violation.

% Soft constraint
penalty("TravelDistance",instantaneous_move(Cu,C1,C2,D,P,P+1),W,Prior) :- 
	curricula(Cu,C1),
	curricula(Cu,C2),
	assigned(C1,R1,D,P),
	assigned(C2,R2,D,P+1),
	room(R1,_,BLG1),
	room(R2,_,BLG2),
	BLG1 != BLG2,
	soft_constraint("TravelDistance",W,Prior).

% Hard constraint
:- curricula(Cu,C1), curricula(Cu,C2), 
   assigned(C1,R1,D,P), assigned(C2,R2,D,P+1),
   room(R1,_,BLG1), room(R2,_,BLG2), BLG1 != BLG2,
   hard_constraint("TravelDistance").

% End
