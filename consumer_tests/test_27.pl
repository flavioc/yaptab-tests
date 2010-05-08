
:- table p/2.
:- table t/2.

:- use_retroactive_tabling p/2.
:- use_subsumptive_tabling t/2.

p(X, Y) :- e(X, Y), t(A, B).
p(2, 3).
p(5, 6).
p(1, 5).
p(1, 7).

e(1, 4).
e(1, 2).

t(5, 6).
t(1, 6).
t(1, 7).

debug_query :- p(1, X), t(1, Y), t(A, B), p(C, D), write((X, A, B, Y, C, D)), nl, fail.
