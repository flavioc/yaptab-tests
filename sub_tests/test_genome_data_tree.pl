
:- consult('driver.pl'),
   consult('genome.pl'),
   consult('data/tree.pl').

debug_query :- backtrack_and_print(genome_l(_)), fail.
