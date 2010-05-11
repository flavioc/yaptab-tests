%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% File:      test_farmer.pl
%% Author(s): Ricardo Rocha
%% Program:   Downloaded from B-prolog web site at
%%            http://www.probp.com and adapted by Ricardo Rocha
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

time_query:- state(8,s,s,s,s,Path),
             fail.

debug_query:- state(8,s,s,s,s,Path),
              write(Path), nl,
              fail.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- table state/6.
tabled_predicate(state/6).

% state(Step,Farmer,Wolf,Goat,Cabbage)
state(Step,n,n,n,n,[]):-
    Step > 0.
state(Step,F,F,G,C,[takes(farmer,wolf)|Path]):-
    Step > 0,
    safe(F,F,G,C),
    opp(F,F1),
    Step1 is Step - 1,
    state(Step1,F1,F1,G,C,Path).
state(Step,F,W,F,C,[takes(farmer,goat)|Path]):-
    Step > 0,
    safe(F,W,F,C),
    opp(F,F1),
    Step1 is Step - 1,
    state(Step1,F1,W,F1,C,Path).
state(Step,F,W,G,F,[takes(farmer,cabbage)|Path]):-
    Step > 0,
    safe(F,W,G,F),
    opp(F,F1),
    Step1 is Step - 1,
    state(Step1,F1,W,G,F1,Path).
state(Step,F,W,G,C,[go_alone(farmer)|Path]):-
    Step > 0,
    safe(F,W,G,C),
    opp(F,F1),
    Step1 is Step - 1,
    state(Step1,F1,W,G,C,Path).

opp(n,s).
opp(s,n).

safe(F,W,F,C).
safe(F,F,G,F):- opp(F,G).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
