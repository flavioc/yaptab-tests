
:- consult('time2.pl').
:- consult('anc_l.pl').
:- table genome_l/1.
:- use_retroactive_tabling anc_l/2.
:- use_retroactive_tabling genome_l/1.

genome_l(X) :- anc_l(1, X), anc_l(2, X).

time_query :- genome_l(X), fail.
