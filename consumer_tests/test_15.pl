% test internal variant generator with external dependency.

:- table p/2.
:- table a/1.

:- use_grounded_tabling p/2.
:- use_variant_tabling a/1.

p(1, Y) :- a(Y).
p(X, Y) :- e(X, Y).

e(1, 2).
e(2, 3).
e(4, 4).

a(5).
a(6).
a(7).

debug_query :- p(1, A), a(B), p(C, D), write((A, B, C, D)), nl, fail.
