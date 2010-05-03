#!/bin/sh

PROLOG=$1

export IGNORE_TABLES=yes
bash run_debug_test_suite.sh -o sub_tests \
    -a "-h 500000 -s 200000 -t 100000" \
    -c run_config_files/yap_grounded_exec_answers.pl $PROLOG
