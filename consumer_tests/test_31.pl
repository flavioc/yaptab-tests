% tests a suspended branch that is reactivated and launches a new general generator.

:- table t/1.
:- table p/2.
:- table a/1.

:- use_variant_tabling a/1.

a(X) :- t(X).

:- use_variant_tabling t/1.

t(X) :- a(X).
t(X) :- p(1, X), a(A), p(B, C).
t(2). t(3).

:- use_retroactive_tabling p/2.

p(1,5). p(1,6). p(10, 10).
p(1, X) :- a(A), X = 20.

debug_query :- t(X), write(X), nl, fail.
