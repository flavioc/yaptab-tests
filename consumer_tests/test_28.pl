% test pruning of internal subsumptive general subgoal with external variant and subsumed goals, with the subsumed subgoal before the variant one.

:- table a/1.
:- table p/2.
:- table t/2.

:- use_grounded_tabling p/2.
:- use_subsumptive_tabling t/2.
:- use_variant_tabling a/1.

p(1, Y) :- e(1, Y), t(A, B).
p(2, 3).
p(5, 6).
p(1, 5).
p(1, 7).
p(1, Y) :- a(Y).

e(1, 4).
e(1, 2).

t(5, 6).
t(1, 6).
t(1, 7).

a(X) :- p(1, X), t(1, Y), t(A, B), p(C, D).
a(20).

debug_query :- a(X), write(X), nl, fail.
