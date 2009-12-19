%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% File:      test_arithmetic01.pl
%% Author(s): Ricardo Rocha
%% Program:   Tests the use of arithmetic built-ins
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

time_query:- t(X),
             fail.

debug_query:- t(X), 
              write(X), nl,
              fail.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- table t/1.
tabled_predicate(t/1).

t(X):-
    e(V),
    Z is V + 50,
    t(Y),
    Y < 10,
    X is Y + Z.
t(1).

e(100).
e(200).
e(300).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
