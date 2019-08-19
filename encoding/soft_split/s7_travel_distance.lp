%%% TravelDistance: Students should have the time to move from one
%%% building to another one between two lectures. For a given
%%% curriculum we account for a violation every time there is an
%%% instantaneous move: two lectures in rooms located in different
%%% building in two adjacent periods within the same day. Each
%%% instantaneous move in a curriculum counts as 1 violation.

scheduled_curricula(Cu,B,D,P) :- assigned(C,R,D,P), curricula(Cu,C), room(R,_,B).

% Soft constraint
penalty("TravelDistance",instantaneous_move(Cu,D,P,P+1),W,Prior) :-
    scheduled_curricula(Cu,BLG1,D,P),
    scheduled_curricula(Cu,BLG2,D,P+1),
    BLG1 != BLG2,
    soft_constraint("TravelDistance",W,Prior).

% Hard constraint
:- scheduled_curricula(Cu,BLG1,D,P),
   scheduled_curricula(Cu,BLG2,D,P+1),
   BLG1 != BLG2,
   hard_constraint("TravelDistance").

% End
