%%% DoubleLectures: Some courses require that lectures in the same day
%%% are grouped together (double lectures). For a course that requires
%%% grouped lectures, every time there is more than one lecture in one
%%% day, a lecture non-grouped to another is not allowed. Two lectures
%%% are grouped if they are adjacent and in the same room. Each
%%% non-grouped lecture counts as 1 violation.

% Soft constraint
penalty("DoubleLectures",non_grouped_lecture(C,R,D,P),W,Prior) :- 
	course(C,_,_,_,_,1),
	d(D),
	2 { assigned(C,D,PPD) },
	assigned(C,R,D,P),
	not assigned(C,R,D,P-1),
	not assigned(C,R,D,P+1),
	soft_constraint("DoubleLectures",W,Prior).

% Hard constraint
:- course(C,_,_,_,_,1), d(D), 2 { assigned(C,D,PPD) },
   assigned(C,R,D,P),
   not assigned(C,R,D,P-1),
   not assigned(C,R,D,P+1),
   hard_constraint("DoubleLectures").

% End
