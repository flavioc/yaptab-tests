%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% File:      yap_cputime_average_five_runs.pl
%% Author(s): Ricardo Rocha
%% Program:   Defines the default predicate for measuring time
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

time:- abolish_all_tables,
       statistics(cputime,[Init1,_]),
       (time_query ; true),
       statistics(cputime,[End1,_]),
       Time1 is End1 - Init1,

       abolish_all_tables,
       statistics(cputime,[Init2,_]),
       (time_query ; true),
       statistics(cputime,[End2,_]),
       Time2 is End2 - Init2,

       abolish_all_tables,
       statistics(cputime,[Init3,_]),
       (time_query ; true),
       statistics(cputime,[End3,_]),
       Time3 is End3 - Init3,

       abolish_all_tables,
       statistics(cputime,[Init4,_]),
       (time_query ; true),
       statistics(cputime,[End4,_]),
       Time4 is End4 - Init4,

       abolish_all_tables,
       statistics(cputime,[Init5,_]),
       (time_query ; true),
       statistics(cputime,[End5,_]),
       Time5 is End5 - Init5,

       Time is (Time1 + Time2 + Time3 + Time4 + Time5) / 5,
       write('cputime average five runs is '), write(Time),
       write(' ('), write(Time1), write('/'), write(Time2), 
       write('/'), write(Time3), write('/'), write(Time4), 
       write('/'), write(Time5), write(')'), nl.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
