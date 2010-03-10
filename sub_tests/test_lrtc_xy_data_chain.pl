:- consult('driver'),
   consult('anc_l.pl'),
   consult('data/chain.pl').

debug_query :- backtrack_and_print(anc_l(_,_)), fail.
