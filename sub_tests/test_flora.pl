:- consult('driver.pl'),
   consult('flora.pl').

debug_query :- backtrack_and_print('_$_$_flora_isa_rhs'(_,direct)), fail.
