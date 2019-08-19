%%% StudentMinMaxLoad: For each curriculum the number of daily
%%% lectures should be within a given range. Each lecture below the
%%% minimum or above the maximum counts as 1 violation.

% Soft constraint
penalty("StudentMinMaxLoad",student_min_max_load(Cu,D,N,many),(N-Max)*W,Prior) :- 
	cu(Cu),
	d(D),
	N = { scheduled_curricula(Cu,D,P) },
	min_max_daily_lectures(Min,Max),
	N > Max,
	soft_constraint("StudentMinMaxLoad",W,Prior).
penalty("StudentMinMaxLoad",student_min_max_load(Cu,D,N,few),(Min-N)*W,Prior) :- 
	cu(Cu),
	d(D),
	N = { scheduled_curricula(Cu,D,P) },
	min_max_daily_lectures(Min,Max),
	0 < N, N < Min,
	soft_constraint("StudentMinMaxLoad",W,Prior).

% Hard constraint
:- not Min { scheduled_curricula(Cu,D,P) } Max,
   min_max_daily_lectures(Min,Max),
   cu(Cu), d(D),
   hard_constraint("StudentMinMaxLoad").

% End

