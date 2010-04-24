% internal generator with two outside subsumptive dependencies (a(X)).

:- table p/2.
:- table a/1.

:- use_grounded_tabling p/2.
:- use_subsumptive_tabling a/1.

p(1, X) :- a(X).
p(5, 6).
p(10, 10).

a(3). a(5). a(7).

debug_query :- p(1, X), a(A), a(B), p(C, D), write((X, A, B, C, D)), nl, fail.
