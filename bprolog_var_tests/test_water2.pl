%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% File:      test_water2.pl
%% Author(s): Ricardo Rocha
%% Program:   Downloaded from B-prolog web site at
%%            http://www.probp.com and adapted by Ricardo Rocha
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

time_query:- solve_dfs(10,jugs(0,0),Moves),
             fail.

debug_query:- solve_dfs(11,jugs(0,0),Moves),
              write(Moves), nl,
              fail.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- table solve_dfs/3.
tabled_predicate(solve_dfs/3).

solve_dfs(Step,State,[]):-
    Step > 0,
    final_state(State).
solve_dfs(Step,State,[Move|Moves]):-
    Step > 0,
    move(State,Move),
    update(State,Move,State1),
    Step1 is Step - 1,
    solve_dfs(Step1,State1,Moves).

final_state(jugs(4,_)).
final_state(jugs(_,4)).

move(jugs(V1,V2),fill(1)).
move(jugs(V1,V2),fill(2)).
move(jugs(V1,V2),empty(1)):-V1>0.
move(jugs(V1,V2),empty(2)):-V2>0.
move(jugs(V1,V2),transfer(2,1)):-V2>0.
move(jugs(V1,V2),transfer(1,2)):-V1>0.

update(jugs(V1,V2),empty(1),jugs(0,V2)).
update(jugs(V1,V2),empty(2),jugs(V1,0)).
update(jugs(V1,V2),fill(1),jugs(C1,V2)):-capacity(1,C1).
update(jugs(V1,V2),fill(2),jugs(V1,C2)):-capacity(2,C2).
update(jugs(V1,V2),transfer(2,1),jugs(W1,W2)):-
    capacity(1,C1),
    Liquid is V1+V2,
    Excess is Liquid-C1,
    (Excess=<0->W1=Liquid,W2=0;
     W1 is C1,W2=Excess).
update(jugs(V1,V2),transfer(1,2),jugs(W1,W2)):-
    capacity(2,C2),
    Liquid is V1+V2,
    Excess is Liquid-C2,
    (Excess=<0->W2=Liquid,W1=0;
     W2 is C2,W1=Excess).

capacity(1,8).
capacity(2,5).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
