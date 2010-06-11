
:- table path/2.

path(f(X), f(Z)) :- edge(f(X), f(Y)), path(f(Y), f(Z)).
path(f(X), f(Z)) :- edge(f(X), f(Z)).
