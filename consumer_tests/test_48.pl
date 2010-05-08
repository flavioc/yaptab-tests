% same as test 30, but with different variant generators.

:- table p/2.
:- table t/2.
:- table a/2.

:- use_retroactive_tabling p/2.
:- use_variant_tabling a/2.
:- use_variant_tabling t/2.

t(1, Y) :- p(1, Y).
t(1, X) :- a(1, X).
t(X, Y) :- p(A, B), e(X, Y).

p(X, Y) :- a(X, Y).
p(2, 4).
p(5, 6).

e(20, 100).
e(1, 50).
e(1, 5).
e(1, 6).
e(100, 100).

a(1, 200).
a(20, 50).
a(1, X) :- t(A, X).
a(8, 30).

debug_query :- t(X, Y), write((X, Y)), nl, fail.
