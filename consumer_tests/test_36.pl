% internal dependency that has external generator.

:- table p/2.
:- table t/2.

:- use_grounded_tabling p/2.
:- use_variant_tabling t/2.

p(X, Y) :- t(X, Y).
p(5, 6).
p(10, 10).

t(1, 4).
t(1, 6).
t(1, 7).

debug_query :- t(1, X), p(1, A), t(1, B), p(C, D), write((X, A, B, C, D)), nl, fail.
