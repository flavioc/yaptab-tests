% orphan consumers not related to master consumer.

:- table p/2.
:- table t/2.

:- use_grounded_tabling p/2.
:- use_subsumptive_tabling t/2.

p(1, X) :- t(A, X).
p(1, 2).
p(5, 3).
p(1, 7).
p(3, 3).

t(2, 3).
t(1, 5).
t(1, 7).
t(10, 10).

debug_query :- p(1, A), t(1, B), p(C, D), write((A,B,C,D)), nl, fail.
