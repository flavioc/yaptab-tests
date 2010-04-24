% tests a RESTART_GENERATOR that gets transformed into a real consumer.

:- table p/2.
:- table a/1.
:- table t/1.

:- use_grounded_tabling p/2.
:- use_variant_tabling t/1.
:- use_variant_tabling a/1.

t(X) :- p(1, Y), a(X), p(A, B).
t(5).

a(7).
a(4).
a(X) :- t(X).

p(X, Y) :- e(X), a(Y).
p(1, 5).

e(1). e(9).

debug_query :- t(X), write(X), nl, fail.
