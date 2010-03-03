
:- consult('driver.pl'),
   consult('anc_r.pl'),
   consult('data/cycles.pl').

debug_query :-
	backtrack_and_print( anc_r(_,_) ),
	backtrack_and_print( anc_r(X,X) ),
	backtrack_and_print( anc_r(f(F),f(F)) ),
	backtrack_and_print( anc_r([L],[L]) ),
  fail.
