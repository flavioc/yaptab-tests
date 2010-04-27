:- table p/3.

:- use_grounded_tabling p/3.

p(1, 2, 3).
p(1, 2, 5).
p(1, 4, 5).
p(4, 6, 7).

debug_query :- p(1, 2, A), p(1, B, C), p(D, E, F), write((A, B, C, D, E, F)), nl, fail.
