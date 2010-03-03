
:- consult('driver.pl'),
   consult('sg.pl'),
   consult('data/tree.pl').

debug_query :- backtrack_and_print(same_gen(1,_)), fail.
