backtrack_and_print(Query) :-
  call(Query), numbervars(Query, 0, _), write(Query), nl, fail.
backtrack_and_print(_).
