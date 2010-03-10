:- consult('driver.pl'),
   consult('anc_r.pl'),
   consult('data/tree.pl').

debug_query :- backtrack_and_print(anc_r(_,_)), fail.
