backtrack_and_print(Query) :-
  call(Query), write(Query), nl, fail.
backtrack_and_print(_).
