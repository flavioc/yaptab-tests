:- consult('driver'),
   consult('anc_l.pl'),
   consult('data/cycles.pl').

debug_query :-
  backtrack_and_print(anc_l([L],[L])),
  backtrack_and_print(anc_l(f(F),f(F))),
  backtrack_and_print(anc_l(X,X)),
  backtrack_and_print(anc_l(_,_)),
  fail.
