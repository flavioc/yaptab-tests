
:- consult('driver.pl'),
   consult('anc_d.pl'),
   consult('data/tree.pl').

debug_query :- backtrack_and_print(anc_d(_,_)), fail.
