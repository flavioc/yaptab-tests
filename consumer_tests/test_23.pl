% chained internal specific subgoals

:- table p/2.

:- use_grounded_tabling p/2.

p(1, X) :- p(2, X).
p(2, X) :- p(A, X).
p(2, 5).
p(2, 4).
p(1, 5).
p(3, 6).

debug_query :- p(1, X), write(X), nl, fail.
