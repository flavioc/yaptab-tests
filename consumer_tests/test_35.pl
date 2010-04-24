
:- table p/2.
:- table t/1.
:- table a/1.

:- use_grounded_tabling p/2.
:- use_variant_tabling t/1.
:- use_variant_tabling a/1.

p(1, Y) :- t(Y).
p(5, 6).
p(1, 20).

t(X) :- a(A), t(B), a(X).

t(1).
a(2).
t(3).
a(4).

debug_query :- p(1, X), t(A), a(B), p(C, D), write((X, A, B, C, D)), nl, fail.
