% tests pruning of retroactive generators

:- table p/2.
:- table a/2.

:- use_retroactive_tabling p/2.
:- use_retroactive_tabling a/2.

a(X, Y) :- e(X, Z), a(Z, Y).
a(X, Y) :- e(X, Y).

e(1, 2).
e(1, 1).
e(3, 3).

p(X, Y) :- a(A, B), e(X, Y).
p(4, 4).

debug_query :- p(1, X), p(A, B), write((X, A, B)), nl, fail.
