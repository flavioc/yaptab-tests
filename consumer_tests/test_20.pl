% tests saved_max and rebinding

:- table b/1.
:- table a/1.
:- table p/2.

:- use_retroactive_tabling p/2.
:- use_variant_tabling a/1.
:- use_variant_tabling b/1.

a(2).
a(3).

b(X) :- p(1, X), b(C), p(A, B).
b(3).

p(1, X) :- a(X).
p(4, 5).

debug_query :- b(X), write(X), nl, fail.
