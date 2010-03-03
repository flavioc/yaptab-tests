:- table same_gen/2.

same_gen(X,X).
same_gen(X,Y) :- p(W, X), same_gen(W,Z), p(Z, Y).
