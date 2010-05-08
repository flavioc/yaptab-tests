% a bit more complicated internal general subgoal.

:- table p/2.

:- use_retroactive_tabling p/2.

p(X, Y) :- p(X, Y), e(X, Y).
p(X, Y) :- a(C), p(A, B), e(X, Y).
p(X, Y) :- e(X, Y).

e(2, 3).
e(1, 2).
e(5, 3).
e(6, 7).
e(1, 4).
e(1, 5).

a(2).
a(3).

debug_query :- p(1, X), write(X), nl, fail.
