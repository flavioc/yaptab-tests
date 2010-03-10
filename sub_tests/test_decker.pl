:- consult('driver.pl'),
   consult('data/decker_facts.pl'),
   consult('decker_rules.pl').

debug_query :- backtrack_and_print(p_isa_(_,f_Researcher)), fail.
