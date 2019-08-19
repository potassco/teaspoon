%%% IsolatedLectures (Compactness v.1): Lectures belonging to a
%%% curriculum should be adjacent to each other (i.e., in consecutive
%%% periods). For a given curriculum we account for a violation every
%%% time there is one lecture not adjacent to any other lecture within
%%% the same day. Each isolated lecture in a curriculum counts as 1
%%% violation.

% Soft constraint
penalty("IsolatedLectures",isolated_lectures(Cu,D,P),W,Prior) :- 
	scheduled_curricula(Cu,D,P),
	not scheduled_curricula(Cu,D,P-1),
	not scheduled_curricula(Cu,D,P+1),
	soft_constraint("IsolatedLectures",W,Prior).

% Hard constraint
:- scheduled_curricula(Cu,D,P), 
   not scheduled_curricula(Cu,D,P-1), 
   not scheduled_curricula(Cu,D,P+1),
   hard_constraint("IsolatedLectures").

% End
