#!/bin/bash

bash run_time_test_suite.sh -o path_medium_tests -t run_config_files/yap_cputime_one_run.pl -c run_config_files/yap_retroactive_exec_answers.pl -a "-h 500000 -s 200000 -t 100000" $*
