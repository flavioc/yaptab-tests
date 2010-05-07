#!/bin/bash

bash run_time_test_suite.sh -a "-h 500000 -s 200000 -t 100000" \
  -t run_config_files/yap_cputime_one_run.pl \
  -c run_config_files/yap_subsumptive_exec_answers.pl \
  -o retro_tests \
  $*
