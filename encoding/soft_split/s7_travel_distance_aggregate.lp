%%% TravelDistance: Students should have the time to move from one
%%% building to another one between two lectures. For a given
%%% curriculum we account for a violation every time there is an
%%% instantaneous move: two lectures in rooms located in different
%%% building in two adjacent periods within the same day. Each
%%% instantaneous move in a curriculum counts as 1 violation.

% Soft constraint
penalty("TravelDistance",instantaneous_move(Cu,D,P,P+1),W,Prior) :-
    cu(Cu), d(D), ppd(P), ppd(P+1),
    #count { B : assigned(C,R,D,(P;P+1)), curricula(Cu,C), room(R,_,B) } > 1,
    soft_constraint("TravelDistance",W,Prior).

% Hard constraint
:-  cu(Cu), d(D), ppd(P), ppd(P+1),
    not #count { B : assigned(C,R,D,(P;P+1)), curricula(Cu,C), room(R,_,B) } 1,
    hard_constraint("TravelDistance").

% End

