%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% File:      test_vars01.pl
%% Author(s): João Raimundo and Ricardo Rocha
%% Program:   Tests variable terms
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

time_query:- t(A,B,C,D,E),
             fail.
time_query:- t(A,B,C),
             fail.
time_query:- t(A),
             fail.

debug_query:- t(A,B,C,D,E), ground_vars([A,B,C,D,E],0,_),
              write(A), write(' - '), write(B), write(' - '),
              write(C), write(' - '), write(D), write(' - '), write(E), nl,
              fail.
debug_query:- t(A,B,C), ground_vars([A,B,C],0,_),
              write(A), write(' - '), write(B), write(' - '), write(C), nl,
              fail.
debug_query:- t(A), ground_vars([A],0,_),
              write(A), nl,
              fail.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- table t/5.
tabled_predicate(t/5).

t(A,A,A,A,A).     %%%  VAR0,VAR0,VAR0,VAR0,VAR0
t(A,A,B,A,A).     %%%  VAR0,VAR0,VAR1,VAR0,VAR0
t(A,B,C,B,A).     %%%  VAR0,VAR1,VAR2,VAR1,VAR0
t(A,B,C,A,B).     %%%  VAR0,VAR1,VAR2,VAR0,VAR1
t(A,B,A,B,C).     %%%  VAR0,VAR1,VAR0,VAR1,VAR2
t(A,B,A,C,B).     %%%  VAR0,VAR1,VAR0,VAR2,VAR1
t(A,B,C,D,E).     %%%  VAR0,VAR1,VAR2,VAR3,VAR4

:- table t/3.
tabled_predicate(t/3).

t(A,f(A,A,A),A).  %%%  VAR0,f(VAR0,VAR0,VAR0),VAR0
t(A,f(A,B,A),A).  %%%  VAR0,f(VAR0,VAR1,VAR0),VAR0
t(A,f(B,C,B),A).  %%%  VAR0,f(VAR1,VAR2,VAR1),VAR0
t(A,f(B,C,A),B).  %%%  VAR0,f(VAR1,VAR2,VAR0),VAR1
t(A,f(B,A,B),C).  %%%  VAR0,f(VAR1,VAR0,VAR1),VAR2
t(A,f(B,A,C),B).  %%%  VAR0,f(VAR1,VAR0,VAR2),VAR1
t(A,f(B,C,D),E).  %%%  VAR0,f(VAR1,VAR2,VAR3),VAR4

:- table t/1.
tabled_predicate(t/1).

t([A,A,A,A,A]).   %%%  [VAR0,VAR0,VAR0,VAR0,VAR0]
t([A,A,B,A,A]).   %%%  [VAR0,VAR0,VAR1,VAR0,VAR0]
t([A,B,C,B,A]).   %%%  [VAR0,VAR1,VAR2,VAR1,VAR0]
t([A,B,C,A,B]).   %%%  [VAR0,VAR1,VAR2,VAR0,VAR1]
t([A,B,A,B,C]).   %%%  [VAR0,VAR1,VAR0,VAR1,VAR2]
t([A,B,A,C,B]).   %%%  [VAR0,VAR1,VAR0,VAR2,VAR1]
t([A,B,C,D,E]).   %%%  [VAR0,VAR1,VAR2,VAR3,VAR4]
t([A,A,A,A|A]).   %%%  [VAR0,VAR0,VAR0,VAR0|VAR0]
t([A,A,B,A|A]).   %%%  [VAR0,VAR0,VAR1,VAR0|VAR0]
t([A,B,C,B|A]).   %%%  [VAR0,VAR1,VAR2,VAR1|VAR0]
t([A,B,C,A|B]).   %%%  [VAR0,VAR1,VAR2,VAR0|VAR1]
t([A,B,A,B|C]).   %%%  [VAR0,VAR1,VAR0,VAR1|VAR2]
t([A,B,A,C|B]).   %%%  [VAR0,VAR1,VAR0,VAR2|VAR1]
t([A,B,C,D|E]).   %%%  [VAR0,VAR1,VAR2,VAR3|VAR4]

ground_vars([],Index,Index):- !.
ground_vars([Var|Tail],Index,IndexOut):-
   var(Var), !,
   number_codes(Index,AtomIndex),
   atom_codes(Var,[86,65,82|AtomIndex]),
   NextIndex is Index + 1,
   ground_vars(Tail,NextIndex,IndexOut).
ground_vars([Atom|Tail],Index,IndexOut):-
   atomic(Atom), !,
   ground_vars(Tail,Index,IndexOut).
ground_vars([Compound|Tail],Index,IndexOut):-
   Compound=..CompoundList,
   ground_vars(CompoundList,Index,NextIndex),
   ground_vars(Tail,NextIndex,IndexOut).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
