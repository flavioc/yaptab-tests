
:- table a/1.
:- table b/1.
:- table p/2.
:- table t/1.

:- use_variant_tabling t/1.
:- use_variant_tabling a/1.
:- use_variant_tabling b/1.
:- use_grounded_tabling p/2.

t(X) :- p(1, X).
t(3).

p(1, Y) :- a(A), b(Y).
p(10, 20).
p(30, 40).

a(1). a(2). a(3).
b(5). b(6). b(7).

debug_query :- t(A), b(B), p(C, D), write((A, B, C, D)), nl, fail.
