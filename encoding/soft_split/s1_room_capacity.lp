%%% RoomCapacity: For each lecture, the number of students that attend
%%% the course must be less than or equal the number of seats of all
%%% the rooms that host its lectures. Each student above the capacity
%%% counts as 1 point of penalty. The weight for this component is 1.

% Soft constraint
penalty("RoomCapacity",assigned(C,R,D,P),(N-Cap)*W,Prior) :- 
    assigned(C,R,D,P),
    course(C,_,_,_,N,_),
    room(R,Cap,_),
    N > Cap,
    soft_constraint("RoomCapacity",W,Prior).

% Hard constraint
:- assigned(C,R,D,P), course(C,_,_,_,N,_), room(R,Cap,_), N > Cap, hard_constraint("RoomCapacity").

% End
