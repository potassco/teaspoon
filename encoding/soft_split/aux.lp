%%% Auxiliary predicates

scheduled_curricula(Cu,D,P) :- assigned(C,D,P), curricula(Cu,C). % used in S3, S4

% End

