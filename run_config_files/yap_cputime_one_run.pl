%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% File:      yap_cputime_one_run.pl
%% Author(s): Miguel Areias and Ricardo Rocha
%% Program:   Defines the default predicate for measuring time
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

time:- statistics(cputime, [T0,_]),
       (time_query ; true),
       statistics(cputime, [TF,_]),
       Time is TF-T0,
       write('cputime one run is '), write(Time), nl.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
