% internal generator with external and an internal (and completed) generator.

:- table a/1.
:- table b/1.
:- table p/2.

:- use_variant_tabling a/1.
:- use_variant_tabling b/1.
:- use_grounded_tabling p/2.

p(X, Y) :- a(X), b(Y).
p(10, 20).
p(30, 40).

a(1). a(2). a(3).
b(5). b(6). b(7).

debug_query :- p(1, A), a(B), b(C), p(D, E), write((A,B,C,D,E)), nl, fail. 
