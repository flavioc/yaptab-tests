#!/bin/bash

YAP=$1

if [ -z "$YAP" ]; then
  echo "usage: ground_sanity_check.sh <YAP>"
  exit 1
fi

run_test () {
  test=$1
  bash ./run_debug_test_suite.sh -o $test \
    -c run_config_files/yap_retroactive_exec_answers.pl \
    -a "-h 500000 -s 200000 -t 100000" \
    $YAP || exit 1
}

run_load_test () {
  test=$1
  bash ./run_debug_test_suite.sh -o $test \
    -c run_config_files/yap_retroactive_load_answers.pl \
    -a "-h 500000 -s 200000 -t 100000" \
    $YAP || exit 1
}

export IGNORE_TABLES=yes
run_test basic_tests
run_test path_small_tests
run_test sub_tests
run_test complex_types_tests

run_load_test basic_tests
run_load_test path_small_tests
#run_load_test sub_tests
#run_load_test complex_types_tests

bash utils/clear_results.sh
