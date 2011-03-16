:- table anc_l/2.

anc_l(X, Y) :- edge(X, Y).
anc_l(X, Y) :- anc_l(X, Z), edge(Z, Y).
