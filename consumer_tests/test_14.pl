
:- table p/2.
:- table a/1.
:- use_grounded_tabling p/2.
:- use_variant_tabling a/1.

a(2).
a(3).

p(1, 5).
p(1, 10).
p(2, 3).

debug_query :- p(1, A), a(B), a(C), p(D, E), write((A, B, C, D, E)), nl, fail.
