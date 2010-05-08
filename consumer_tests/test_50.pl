% multiple cuts of the a(1, X) generator node.

:- table p/2.
:- table b/2.
:- table a/2.

:- use_retroactive_tabling p/2.
:- use_retroactive_tabling b/2.
:- use_variant_tabling a/2.

p(X, Y) :- a(X, Y).
p(2, 2).
p(1, 8).
p(1, 7).

b(X, Y) :- a(X, Y).
b(1, 5).
b(6, 4).
b(3, 2).
b(1, 20).

a(1, X) :- p(1, X).
a(20, 200).
a(30, 300).
a(1, 9).

debug_query :- p(1, A), a(1, B), b(1, C), p(D, E), b(F, G),
               write((A,B,C,D,E,F,G)), nl, fail.
             :- debug_query.
