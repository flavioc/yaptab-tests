% tests pruning with interior nodes.

:- table p/2.
:- use_retroactive_tabling p/2.

p(X, Y) :- a(X, Y).
p(1, 2).

a(3, 4).
a(3, 5).

debug_query :- p(3, X), p(A, B), write((X,A,B)), nl, fail.
