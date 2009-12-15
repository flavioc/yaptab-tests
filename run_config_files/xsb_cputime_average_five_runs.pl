%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% File:      xsb_cputime_average_five_runs.pl
%% Author(s): Ricardo Rocha
%% Program:   Defines the default predicate for measuring time
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

time:- abolish_all_tables,
       cputime(Init1),
       (time_query ; true),
       cputime(End1),
       Time1 is End1 - Init1,

       abolish_all_tables,
       cputime(Init2),
       (time_query ; true),
       cputime(End2),
       Time2 is End2 - Init2,

       abolish_all_tables,
       cputime(Init3),
       (time_query ; true),
       cputime(End3),
       Time3 is End3 - Init3,

       abolish_all_tables,
       cputime(Init4),
       (time_query ; true),
       cputime(End4),
       Time4 is End4 - Init4,

       abolish_all_tables,
       cputime(Init5),
       (time_query ; true),
       cputime(End5),
       Time5 is End5 - Init5,

       Time is (Time1 + Time2 + Time3 + Time4 + Time5) / 5,
       write('cputime average five runs is '), write(Time),
       write(' ('), write(Time1), write('/'), write(Time2), 
       write('/'), write(Time3), write('/'), write(Time4), 
       write('/'), write(Time5), write(')'), nl.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
