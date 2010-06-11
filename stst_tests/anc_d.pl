:- table anc_d/2.

anc_d(f(X), f(Y)) :- edge(f(X), f(Y)).
anc_d(f(X), f(Y)) :- anc_d(f(X), f(Z)), anc_d(f(Z), f(Y)).
