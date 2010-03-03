:- table same_gen/2, genome_l/2.

same_gen(X, X).
same_gen(X,Y) :- p(W, X), same_gen(W,Z), p(Z, Y).

genome_l(X) :- anc_l(1, X), anc_l(2, X).
