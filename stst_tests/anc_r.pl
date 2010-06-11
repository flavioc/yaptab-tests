:- table anc_r/2.

anc_r(f(X), f(Y)) :- edge(f(X), f(Y)).
anc_r(f(X), f(Y)) :- edge(f(X), f(Z)), anc_r(f(Z), f(Y)).
