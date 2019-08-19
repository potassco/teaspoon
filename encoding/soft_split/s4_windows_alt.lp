%%% Windows (Compactness v.2): Lectures belonging to a curriculum
%%% should not have time windows (i.e., periods without teaching)
%%% between them. For a given curriculum we account for a violation
%%% every time there is one windows between two lectures within the
%%% same day. Each time window in a curriculum counts as many
%%% violation as its length (in periods).

dp(1;-1).
scheduled_curricula_chain(Cu,D,P,   DP) :- scheduled_curricula(Cu,D,P), ppd(P+DP), dp(DP).
scheduled_curricula_chain(Cu,D,P+DP,DP) :- scheduled_curricula_chain(Cu,D,P,DP), ppd(P+DP).

% Soft_constraint
penalty("Windows",windows(Cu,D,P),W,Prior) :-
    scheduled_curricula_chain(Cu,D,P,-1),
    not scheduled_curricula(Cu,D,P),
    scheduled_curricula_chain(Cu,D,P,1),
    soft_constraint("Windows",W,Prior).

% Hard_constraint
:- scheduled_curricula_chain(Cu,D,P,-1),
   not scheduled_curricula(Cu,D,P),
   scheduled_curricula_chain(Cu,D,P,1),
   hard_constraint("Windows").

% End
