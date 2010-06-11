:- table anc_d/2.

anc_d(X, Y) :- edge(X, Y).
anc_d(X, Y) :- anc_d(X, Z), anc_d(Z, Y).
