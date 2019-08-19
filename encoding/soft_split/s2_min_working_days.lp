%%% MinWorkingDays: The lectures of each course must be spread into a
%%% given minimum number of days. Each day below the minimum counts as
%%% 1 violation.

working_day(C,D) :- assigned(C,D,P).

% Soft constraint
penalty("MinWorkingDays",course(C,MWD,N),(MWD-N)*W,Prior) :- 
	course(C,_,_,MWD,_,_),
	N = { working_day(C,D) },
	N < MWD,
	soft_constraint("MinWorkingDays",W,Prior).

% Hard constraint
:- not MWD { working_day(C,D) }, course(C,_,_,MWD,_,_), hard_constraint("MinWorkingDays").

% End
