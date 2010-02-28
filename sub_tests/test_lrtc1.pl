
:- consult('driver'),
   consult('anc_l.pl').

debug_query :- backtrack_and_print(anc_l(_,_)), fail.
