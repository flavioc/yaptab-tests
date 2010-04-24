% tests pruning of a internal generator a(1, X) with an external dependency
% in which the leader is t(1, X), not a(1, X) and an internal generator
% t(1, X) with an outside dependency that is the leader itself.

:- table p/2.
:- use_grounded_tabling p/2.

:- table t/2.
:- use_variant_tabling t/2.

:- table a/2.
:- use_variant_tabling a/2.

p(X, Y) :- t(X, Y).
p(10, 10).

t(X, Y) :- a(X, Y).
t(5, 5).

a(X, Y) :- t(X, Y).
a(1, 2).
a(1, 3).
a(1, 4).

debug_query :- p(1, A), a(1, B), t(1, E), p(C, D), write((A, B, C, D, E)), nl, fail.
