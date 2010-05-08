% tests pruning of variant generator goals.

:- table a/2.
:- table p/2.
:- use_variant_tabling a/2.
:- use_retroactive_tabling p/2.

p(X, Y) :- a(X, Y).
p(2, 3).

e(1, 2).
e(1, 3).
e(5, 5).

a(X, Y) :- a(X, Z), e(Z, Y).
a(X, Y) :- e(X, Y).

debug_query :- p(1, X), p(A, B), write((X,A,B)), nl, fail.
