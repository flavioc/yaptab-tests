% test internal general subgoal with a new dependency for the specific subgoal outside

:- table t/1.
:- table p/2.

:- use_variant_tabling t/1.
:- use_grounded_tabling p/2.

t(X) :- p(1, X).
t(3).
t(4).

p(1, Y) :- t(Y).
p(X, Y) :- p(A, B), e(X, Y).
p(X, Y) :- e(X, Y).

e(1, 2).
e(1, 6).

debug_query :- t(X), p(1, A), write((X, A)), nl, fail.
