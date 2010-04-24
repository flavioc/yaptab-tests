% external leader with a cut of the internal generator.

:- table p/2.
:- table t/2.
:- table a/1.

:- use_grounded_tabling p/2.
:- use_variant_tabling t/2.
:- use_variant_tabling a/1.

p(X, Y) :- a(A), t(X, Y), a(B).
p(5, 6).
p(10, 10).

t(1, 4).
t(1, 6).
t(1, 7).

a(50).
a(100).

debug_query :- t(1, X), p(1, A), a(E), t(1, B), p(C, D), write((X, A, B, C, D, E)), nl, fail.
