:- consult('driver.pl'),
   consult('sg.pl'),
   consult('data/chain.pl').

debug_query :- backtrack_and_print(same_gen(_,_)), fail.
