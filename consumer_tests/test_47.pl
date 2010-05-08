% Initial generator and two consumers p(1, 3, C).

:- table p/3.

:- use_retroactive_tabling p/3.

p(1, 2, 3).
p(1, 3, 2).
p(1, 3, 9).
p(1, 4, 5).
p(5, 6, 7).

debug_query :- p(1, A, B), p(1, 3, C), p(D, E, F), write((A, B, C, D, E, F)), nl, fail.
