%%% StudentMinMaxLoad: For each curriculum the number of daily
%%% lectures should be within a given range. Each lecture below the
%%% minimum or above the maximum counts as 1 violation.

abc(M,min) :- min_max_daily_lectures(M,_).
abc(M,max) :- min_max_daily_lectures(_,Max), periods_per_day(Ppd), M=Ppd-Max.

abc(Cu,D,P) :- assigned(C,D,P), curricula(Cu,C).

abc_counter(Cu,D,-1,0,min) :- cu(Cu), d(D).
abc_counter(Cu,D,-1,0,max) :- cu(Cu), d(D).

abc_counter(Cu,D,P,N+1,min) :- abc_counter(Cu,D,P-1,N,min),             abc(Cu,D,P), N+1 <= M, abc(M,min).
abc_counter(Cu,D,P,N+1,max) :- abc_counter(Cu,D,P-1,N,max), ppd(P), not abc(Cu,D,P), N+1 <= M, abc(M,max).
abc_counter(Cu,D,P,N+0,MM)  :- abc_counter(Cu,D,P-1,N,MM),  ppd(P),                  N   <= M, abc(M,MM).

abc_counter(Cu,D,min) :- abc(Cu,D,P).
abc_counter(Cu,D,max) :- cu(Cu), d(D).

% Soft constraint
penalty("StudentMinMaxLoad",student_min_max_load(Cu,D,N),W,Prior) :-
    cu(Cu), d(D), N = 1..M, periods_per_day(P), abc(M,MM), abc_counter(Cu,D,MM),
    not abc_counter(Cu,D,P-1,N,MM),
    soft_constraint("StudentMinMaxLoad",W,Prior).

% Hard constraint
:- cu(Cu), d(D), periods_per_day(P), abc(M,MM), abc_counter(Cu,D,MM),
   not abc_counter(Cu,D,P-1,M,MM),
   hard_constraint("StudentMinMaxLoad").

% End
