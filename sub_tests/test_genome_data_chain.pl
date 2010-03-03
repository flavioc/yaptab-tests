
:- consult('driver.pl'),
   consult('genome.pl'),
   consult('data/chain.pl').

 :- yap_flag(tabling_mode, subsumptive).

debug_query :- backtrack_and_print(genome_l(_)), fail.
