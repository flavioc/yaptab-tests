% test external general subgoal with suspended consumer out of the new answer choice point (B_FZ check).

:- table t/1.
:- table p/2.

:- use_variant_tabling t/1.
:- use_retroactive_tabling p/2.

p(X, Y) :- p(X, Z), e(Z, Y).
p(X, Y) :- e(X, Y).

e(1, 2).
e(2, 3).

t(X) :- p(1, X).
t(3).
t(4).

debug_query :- t(X), p(A, B), write((X, A, B)), nl, fail.
