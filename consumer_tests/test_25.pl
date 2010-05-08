% tests variant subsumptive generator restarting.

:- table p/2.
:- table t/2.

:- use_subsumptive_tabling t/2.
:- use_retroactive_tabling p/2.

p(X, Y) :- e(X, Y), t(A, B).
p(X, Y) :- e(X, Y).

e(1, 2).
e(1, 1).
e(5, 1).
e(3, 5).

t(5, 5).
t(3, 5).
t(5, 9).
t(3, 8).

debug_query :- p(1, X), t(A, B), p(C, D), write((X, A, B, C, D)), nl, fail.
