:- table anc_r/2.

anc_r(X, Y) :- p(X, Y).
anc_r(X, Y) :- p(X, Z), anc_r(Z, Y).
