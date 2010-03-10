:- consult('driver.pl'),
   consult('sg.pl'),
   consult('data/cycles.pl').

debug_query :-
	backtrack_and_print( same_gen(_,_) ),
	backtrack_and_print( same_gen(X,X) ),
	backtrack_and_print( same_gen(f(F),f(F)) ),
	backtrack_and_print( same_gen([L],[L]) ),
  fail.
