
:- consult('anc_l.pl').
:- table genome_l/1.

genome_l(X) :- anc_l(1, X), anc_l(2, X).
