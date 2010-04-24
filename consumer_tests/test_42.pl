% internal generator with two outside dependencies (a(X)), resulting in
% a new consumer for the two subgoals

:- table p/2.
:- table a/1.
:- table t/3.

:- use_grounded_tabling p/2.
:- use_variant_tabling a/1.
:- use_variant_tabling t/3.

t(X, Y, Z) :- p(1, X), a(Y), a(Z), p(C, D).
t(100, 200, 300).

p(1, X) :- a(X).
p(5, 6).
p(10, 10).

a(3). a(5). a(7).
a(X) :- t(X).

debug_query :- t(X, Y, Z), write((X, Y, Z)), nl, fail.
