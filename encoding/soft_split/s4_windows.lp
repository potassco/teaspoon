%%% Windows (Compactness v.2): Lectures belonging to a curriculum
%%% should not have time windows (i.e., periods without teaching)
%%% between them. For a given curriculum we account for a violation
%%% every time there is one windows between two lectures within the
%%% same day. Each time window in a curriculum counts as many
%%% violation as its length (in periods).

% Soft_constraint
penalty("Windows",windows(Cu,D,P1,P2),(P2-P1-1)*W,Prior) :- 
    scheduled_curricula(Cu,D,P1),
    scheduled_curricula(Cu,D,P2),
    P1 + 1 < P2,
    not scheduled_curricula(Cu,D,P) : P = P1+1..P2-1;
    soft_constraint("Windows",W,Prior).

% Hard_constraint
:-  scheduled_curricula(Cu,D,P1),
    scheduled_curricula(Cu,D,P2),
    P1 + 1 < P2,
    not scheduled_curricula(Cu,D,P) : P = P1+1..P2-1;
    hard_constraint("Windows").

% End

