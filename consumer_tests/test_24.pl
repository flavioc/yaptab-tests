% tests consumption of specific answers for a specific generator node that will banished

:- table p/3.
:- use_grounded_tabling p/3.

p(1, 2, 3).
p(1, 2, 2).
p(1, 5, 5).
p(4, 5, 6).
p(1, 5, 2).

debug_query :- p(1, A, 2), p(1, B, B), p(1, C, D), write((A, B, C, D)), nl, fail.
