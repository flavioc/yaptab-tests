
:- table path/2.

path(X, Z) :- path(X, Y), edge(Y, Z).
path(X, Z) :- edge(X, Z).
