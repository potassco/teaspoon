%%% Hard constraints (channeling encoding)

c(C) :- course(C,_,_,_,_,_).
t(T) :- course(_,T,_,_,_,_).
r(R) :- room(R,_,_).
d(0..D-1) :- days(D).
ppd(0..P-1) :- periods_per_day(P).
cu(Cu) :- curricula(Cu,_).

%%% Lectures: All lectures of a course must be scheduled, and they
%%% must be assigned to distinct periods. A violation occurs if a
%%% lecture is not scheduled or two lectures are in the same period.

N { assigned(C,D,P) : d(D), ppd(P) } N :- course(C,_,N,_,_,_).

%%% Conflicts: Lectures of courses in the same curriculum or taught by
%%% the same teacher must be all scheduled in different periods. Two
%%% conflicting lectures in the same period represent one
%%% violation. Three conflicting lectures count as 3 violations: one
%%% for each pair.

:- not { assigned(C,D,P) : course(C,T,_,_,_,_) } 1, t(T), d(D), ppd(P).
:- not { assigned(C,D,P) : curricula(Cu,C) } 1, cu(Cu), d(D), ppd(P).

%%% RoomOccupancy: Two lectures can not take place in the same room in
%%% the same period. Two lectures in the same room at the same period
%%% represent one violation. Any extra lecture in the same period and
%%% room counts as one more violation.

1 { assigned(C,R,D,P) : r(R) } 1 :- assigned(C,D,P).
:- not { assigned(C,R,D,P) : c(C) } 1, r(R), d(D), ppd(P).

%%% Availability: If the teacher of the course is not available to
%%% teach that course at a given period, then no lecture of the course
%%% can be scheduled at that period. Each lecture in a period
%%% unavailable for that course is one violation.

:- assigned(C,D,P), unavailability_constraint(C,D,P).

%%% Additional constraints (can be omitted)

:- not { assigned(C,D,P) : c(C) } N, d(D), ppd(P), rooms(N).

% End
