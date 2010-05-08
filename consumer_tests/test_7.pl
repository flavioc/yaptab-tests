% tests internal general subgoal, without dependencies.

:- table p/2.

:- use_retroactive_tabling p/2.

e(1, 2).
e(1, 1).
p(5, 5).

p(X, Y) :- p(A, B), e(X, Y).
p(X, Y) :- e(X, Y).

debug_query :- p(1, X), write(X), nl, fail.
