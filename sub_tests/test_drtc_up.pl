:- consult('driver.pl'),
   consult('anc_d.pl'),
   consult('data/cycles.pl').

 :- use_subsumptive_tabling anc_d/2.

debug_query :- 
	backtrack_and_print( anc_d([L],[L]) ),
	backtrack_and_print( anc_d(f(F),f(F)) ),
	backtrack_and_print( anc_d(X,X) ),
	backtrack_and_print( anc_d(_,_) ),
  fail.
