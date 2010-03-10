:- table anc_l/2.

anc_l(X, Y) :- p(X, Y).
anc_l(X, Y) :- anc_l(X, Z), p(Z, Y).
