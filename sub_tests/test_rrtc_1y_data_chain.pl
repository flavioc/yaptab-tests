
:- consult('driver.pl'),
   consult('anc_r.pl'),
   consult('data/chain.pl').

debug_query :- backtrack_and_print(anc_r(1,_)), fail.
