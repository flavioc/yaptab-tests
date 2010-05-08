% tests internal general subgoals with outside dependencies.

:- table t/1.
:- table p/2.
:- use_variant_tabling t/1.
:- use_retroactive_tabling p/2.

t(X) :- p(1, X).
t(1).
t(2).

p(1, X) :- t(X).
p(X, Y) :- p(A, B), e(X, Y).

e(1, 2).
e(1, 3).
e(5, 3).

debug_query :- t(X), write(X), nl, fail.
