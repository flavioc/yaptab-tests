:- consult('driver'),
   consult('anc_l.pl'),
   consult('data/tree.pl').

debug_query :- backtrack_and_print(anc_l(_,_)), fail.
