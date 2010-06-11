
:- table same_gen/2.

same_gen(X,X).
same_gen(X,Y) :- edge(W, X), same_gen(W,Z), edge(Z, Y).

