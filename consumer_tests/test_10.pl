
:- table p/2.
%:- use_grounded_tabling p/2.

p(1, 2).
p(1, 3).

a(2).
a(3).

debug_query :- p(1, A), a(B), p(X, Y), write((A, B, X, Y)), nl, fail.
