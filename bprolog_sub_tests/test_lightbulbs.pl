%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% File:      test_lightbulbs.pl
%% Author(s): Ricardo Rocha
%% Program:   Downloaded from B-prolog web site at
%%            http://www.probp.com
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

time_query:- Initial= [1,1,0,1,1,1,0,1,0,1,0,1,1,1,1,0,1,1,0,1,0,0,1,0,1,1,0,1,0,1,1,1,0],
             Final  = [0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,1,1,0,1,1,0,0,1,0,1,0,1,1,0,1,0,0,0],
             plan0(Initial,Final,Plan),
             fail.

debug_query:- Initial= [1,1,0,1,1,1,0,1,0,1,0,1,1,1,1,0,1,1,0,1,0,0,1,0,1,1,0,1,0,1,1,1,0],
              Final  = [0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,1,1,0,1,1,0,0,1,0,1,0,1,1,0,1,0,0,0],
              plan0(Initial,Final,Plan),
              write(Plan), nl,
              fail.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- table plan/3.
tabled_predicate(plan/3).

plan0([X],[X],Plan):-Plan=[0].
plan0([X],_,Plan):-Plan=[1].
plan0([X1,X2],[X1,X2],Plan):-Plan=[0].
plan0([X1,X2],_,Plan):-Plan=[1].
plan0(Initial,Final,Plan):-
    my_length(Initial,Len),
    my_length(Plan,Len),
    append(Initial,[0],NInitial), % add dummy bulbs
    append(Final,[_],NFinal),
    plan([0|NInitial],[_|NFinal],Plan).

plan([X1,X2,X3|Xs],[X1,Y2,Y3|Ys],[0|Plan]):-
    plan([X2,X3|Xs],[Y2,Y3|Ys],Plan).
plan([X1,X2,X3|Xs],[Y1,Y2,Y3|Ys],[1|Plan]):-
    opposite(X1,Y1),
    opposite(X2,OX2),
    opposite(X3,OX3),
    plan([OX2,OX3|Xs],[Y2,Y3|Ys],Plan).
plan([X1,X2],[X1,X2],[]).

opposite(0,1).
opposite(1,0).

append([],L,L).
append([X|L1],L2,[X|L3]) :- append(L1,L2,L3).

my_length(L,N) :-
	var(N)
	 ->	my_length1(L,0,N)
	 ;	my_length2(L,N).

my_length1([],N,N).
my_length1([_|R],N0,N) :- N1 is N0+1, my_length1(R,N1,N).

my_length2(L,N) :-
	N =< 0
	 ->	L=[]
	 ;	N1 is N-1, L=[_|L1],
		my_length2(L1,N1).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
