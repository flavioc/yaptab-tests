% simplest example

:- table p/2.
:- use_retroactive_tabling p/2.

p(1, 2).
p(1, 1).

debug_query :- p(1, X), p(A, B), write((X, A, B)), nl, fail.
