
:- table anc_l/2.

anc_l(f(X), f(Y)) :- edge(f(X), f(Y)).
anc_l(f(X), f(Y)) :- anc_l(f(X), f(Z)), edge(Z, f(Y)).
