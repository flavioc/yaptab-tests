:- consult('driver.pl'),
   consult('anc_d.pl'),
   consult('data/chain.pl').

debug_query :- backtrack_and_print(anc_d(1,_)), fail.
