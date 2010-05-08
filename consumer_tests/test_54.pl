% internal pruning with answers in the first clause.

:- table path/2.

edge(1, 2).
edge(2, 1).
edge(1, 3).
edge(3, 2).

path(X, Y) :- edge(X, Y).
path(X, Y) :- path(X, Z), edge(Z, Y).

:- use_retroactive_tabling path/2.

debug_query :- path(X, 1), path(Y, 2), write((X, Y)), nl, fail.
