% external single subsumed consumer that is run before the RESTART_GENERATOR node and a RUN_COMPLETED node.

:- table p/2.
:- table t/2.
:- table a/5.

:- use_grounded_tabling p/2.
:- use_subsumptive_tabling t/2.
:- use_variant_tabling a/5.

p(1, Y) :- e(1, Y), t(A, B).
p(2, 3).
p(5, 6).

e(1, 4).
e(1, 2).

t(5, 6).
t(1, 6).
t(1, 7).

a(X, Y, C, A, B) :- p(1, X), t(1, Y), t(1, C), p(A, B), a(_, _, _, _, _).
a(200, 400, 600, 800, 1000).

debug_query :- a(X, Y, C, A, B), write((X, Y, A, B, C)), nl, fail.
