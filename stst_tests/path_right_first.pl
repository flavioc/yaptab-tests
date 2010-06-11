
:- table path/2.

path(X, Z) :- edge(X, Y), path(Y, Z).
path(X, Z) :- edge(X, Z).
