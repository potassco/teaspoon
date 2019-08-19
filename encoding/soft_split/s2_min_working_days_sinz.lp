%%% MinWorkingDays: The lectures of each course must be spread into a
%%% given minimum number of days. Each day below the minimum counts as
%%% 1 violation.

working_day(C,D) :- assigned(C,D,P).

wd_counter(C,M,-1,0)  :- course(C,_,_,M,_,_).
wd_counter(C,M,D,N+1) :- wd_counter(C,M,D-1,N), working_day(C,D), N+1 <= M.
wd_counter(C,M,D,N+0) :- wd_counter(C,M,D-1,N), d(D), N <= M.

% Soft constraint
penalty("MinWorkingDays",course(C,N),W,Prior) :-
    not wd_counter(C,M,D-1,N),
    course(C,_,_,M,_,_), N = 1..M, days(D),
    soft_constraint("MinWorkingDays",W,Prior).

% Hard constraint
:- not wd_counter(C,M,D-1,M),
   course(C,_,_,M,_,_), days(D),
   hard_constraint("MinWorkingDays").

% End
