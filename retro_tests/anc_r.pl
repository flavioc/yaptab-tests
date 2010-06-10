:- table anc_r/2.

anc_r(X, Y) :- edge(X, Y).
anc_r(X, Y) :- edge(X, Z), anc_r(Z, Y).
