%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% File:      xsb_cputime_one_run.pl
%% Author(s): Miguel Areias and Ricardo Rocha
%% Program:   Defines the default predicate for measuring time
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

time:- cputime(T0),
       (time_query ; true),
       cputime(TF),
       Time is TF-T0,
       write('cputime one run is '), write(Time), nl.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
