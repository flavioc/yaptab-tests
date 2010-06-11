
:- table path/2.

path(f(X), f(Y)) :- edge(f(X), f(Y)).
path(f(X), f(Y)) :- path(f(X), f(Z)), path(f(Z), f(Y)).
