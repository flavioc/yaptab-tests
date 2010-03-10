:- consult('driver.pl'),
   consult('genome.pl'),
   consult('data/cycles.pl').

debug_query :- backtrack_and_print(genome_l(_)), fail.
