
:- table path/2.

path(X, Y) :- edge(X, Y).
path(X, Y) :- path(X, Z), path(Z, Y).
