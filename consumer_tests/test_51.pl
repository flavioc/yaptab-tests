% dead subsumptive producers.

:- table p/2.
:- table t/3.
:- table b/2.

:- use_retroactive_tabling p/2.
:- use_retroactive_tabling b/2.
:- use_subsumptive_tabling t/3.

p(X, 55) :- t(X, A, B).
p(1, 5).
p(5, 6).
p(10, 10).
p(1, 3).

b(X, 20) :- t(X, A, B).
b(3, 1).
b(1, 2).
b(11, 13).
b(1, 67).

t(1, 2, 3).
t(1, 2, 5).
t(1, 5, 2).
t(3, 10, 20).
t(8, 7, 4).

debug_query :- p(1, A), t(1, 2, B), b(1, C), p(D, E), b(F, G), write((A,B,C,D,E,F,G)), nl, fail.
