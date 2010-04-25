#!/bin/bash

YAP=$1

if [ -z "$YAP" ]; then
  echo "usage: sanity_check.sh <YAP>"
  exit 1
fi

run_test () {
  test=$1
  bash ./run_debug_test_suite.sh -o $test \
    -c run_config_files/yap_subsumptive_exec_answers.pl \
    "$YAP" || exit 1
}

run_load_test () {
  test=$1
  bash ./run_debug_test_suite.sh -o $test \
    -c run_config_files/yap_subsumptive_load_answers.pl \
    "$YAP" || exit 1
}

run_test basic_tests
run_test path_small_tests
run_test sub_tests
run_test complex_types_tests

export IGNORE_TABLES=yes
run_load_test basic_tests
run_load_test path_small_tests
run_load_test sub_tests
run_load_test complex_types_tests

bash utils/clear_results.sh
