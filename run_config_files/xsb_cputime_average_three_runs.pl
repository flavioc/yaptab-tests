%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% File:      xsb_cputime_average_three_runs.pl
%% Author(s): Ricardo Rocha
%% Program:   Defines the default predicate for measuring time
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

time:- abolish_all_tables,
       cputime(Init1),
       (time_query ; true),
       cputime(End1),
       Time10 is End1 - Init1,

       abolish_all_tables,
       cputime(Init2),
       (time_query ; true),
       cputime(End2),
       Time20 is End2 - Init2,

       abolish_all_tables,
       cputime(Init3),
       (time_query ; true),
       cputime(End3),
       Time30 is End3 - Init3,

       Time1 is Time10 * 1000,
       Time2 is Time20 * 1000,
       Time3 is Time30 * 1000,

       Time is (Time1 + Time2 + Time3) / 3,
       write('cputime average three runs is '), write(Time),
       write(' ('), write(Time1), write('/'), write(Time2), 
       write('/'), write(Time3), write(')'), nl.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
