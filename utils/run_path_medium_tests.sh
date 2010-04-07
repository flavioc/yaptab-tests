#!/bin/sh

PROLOG=$1

sh run_debug_test_suite.sh -o path_medium_tests -c run_config_files/yap_subsumptive_exec_answers.pl $PROLOG
