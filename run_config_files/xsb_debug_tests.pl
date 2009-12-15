%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% File:      xsb_debug_tests.pl
%% Author(s): Miguel Areias and Ricardo Rocha
%% Program:   Defines the show_all_tables/0 predicate for XSB
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- export show_all_tables/0.

:- import append/3 from basics.
:- import concat_atom/2 from string.

:- dynamic current_table_has_calls/0.
:- dynamic current_subgoal_has_answers/0.

show_all_tables:- usermod:tabled_predicate(Pred), show_table(Pred), fail.
show_all_tables.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

show_table(Pred):-
   write_pred(Pred),
   get_calls_for_table(Pred,Call),
   new_call,
   Call=..CallList,
   get_list_of_vars(CallList,Vars), 
   remove_var_duplicates(Vars,[],Single_Vars),
   (
      show_call(Call,Single_Vars), fail 
   ;
      show_answers(Call,Single_Vars)
   ).
show_table(_):-
   usermod:current_table_has_calls, !,
   retract(current_table_has_calls).
show_table(_):-
   write('  EMPTY'), nl.

new_call:-
   usermod:current_table_has_calls, !.
new_call:-
   assert(current_table_has_calls).

get_list_of_vars([],[]):- !.
get_list_of_vars([Var|TailIn],[Var|TailOut]):- 
   var(Var), !,
   get_list_of_vars(TailIn,TailOut).
get_list_of_vars([Atom|TailIn],ListOut):- 
   atomic(Atom), !,
   get_list_of_vars(TailIn,ListOut).
get_list_of_vars([Compound|TailIn],ListOut):- 
   Compound=..CompoundList,
   get_list_of_vars(CompoundList,CoumpoundListOut),
   get_list_of_vars(TailIn,TailOut),
   append(CoumpoundListOut,TailOut,ListOut).

remove_var_duplicates([],_,[]):- !.
remove_var_duplicates([Var|TailIn],ListVisited,ListOut):- 
   var_member(Var,ListVisited), !, 
   remove_var_duplicates(TailIn,ListVisited,ListOut).
remove_var_duplicates([Var|TailIn],ListVisited,[Var|TailOut]):- 
   remove_var_duplicates(TailIn,[Var|ListVisited],TailOut).

var_member(_,[]):- !, fail.
var_member(V,[H|_]):- V == H, !.
var_member(V,[_|T]):- var_member(V,T).

ground_vars(_,[],_):- !.
ground_vars(Text,[Var|Tail],Index):-
   concat_atom([Text,Index],Var),
   NextIndex is Index + 1,
   ground_vars(Text,Tail,NextIndex).

show_call(Call,VarsList):- 
   ground_vars('VAR',VarsList,0),
   write_call(Call).

show_answers(Call,VarsList):-
   get_returns_for_call(Call,Call),
   (VarsList = [] ->  
      write('    TRUE'), nl, !
   ; 
      new_answer,
      get_list_of_vars(VarsList,Vars), 
      remove_var_duplicates(Vars,[],Single_Vars),
      ground_vars('ANSVAR',Single_Vars,0),
      write_answer(VarsList,0)
   ).
show_answers(_,_):-
   usermod:current_subgoal_has_answers, !,
   retract(current_subgoal_has_answers).
show_answers(_,_):-
   write('    NO'), nl.

new_answer:-
   usermod:current_subgoal_has_answers, !.
new_answer:-
   assert(current_subgoal_has_answers).

write_pred(Name/Arity):-
   write('Table structure for predicate '), put(39), write(Name), write('/'), write(Arity), put(39), nl.

write_call(Call):-
   write('  ?- '), write(Call), write('.'), nl.

write_answer([],_):- !, nl.
write_answer([Ans|Tail], Index):-
   write('    VAR'), write(Index), write(': '), write(Ans),
   NextIndex is Index + 1,
   write_answer(Tail, NextIndex).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
