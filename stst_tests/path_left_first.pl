
:- table path/2.

path(f(X), f(Z)) :- path(f(X), f(Y)), edge(f(Y), f(Z)).
path(f(X), f(Z)) :- edge(f(X), f(Z)).
