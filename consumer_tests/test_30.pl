% tests dangling external consumer turned generator (a(X)).

:- table p/2.
:- table t/2.
:- table a/1.

:- use_grounded_tabling p/2.
:- use_variant_tabling t/2.
:- use_variant_tabling a/1.

t(1, Y) :- p(1, Y).
t(1, X) :- a(X).
t(X, Y) :- p(A, B), e(X, Y).

p(X, Y) :- e(X, Y), a(B).
p(2, 4).
p(5, 6).

e(1, 5).
e(1, 6).

a(50).
a(X) :- t(A, X).

debug_query :- t(X, Y), write((X, Y)), nl, fail.
