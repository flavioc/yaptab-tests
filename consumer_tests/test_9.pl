% tests internal general consumer with dynamic batched/local scheduling.

:- table p/2.

:- use_grounded_tabling p/2.

e(1, 2).
e(5, 1).
e(5, 2).
e(1, 1).
e(5, 3).
e(5, 6).
e(1, 3).
e(1, 4).
e(5, 9).
e(1, 5).
e(1, 6).
e(1, 7).
p(5, 5).

p(X, Y) :- p(A, B), e(X, Y).
p(X, Y) :- e(X, Y).

debug_query :- p(1, X), write(X), nl, fail.
