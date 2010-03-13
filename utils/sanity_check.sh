#!/bin/bash

YAP=$1

run_test () {
  test=$1
  bash ./run_debug_test_suite.sh -o $test \
    -c run_config_files/yap_subsumptive_exec_answers.pl \
    $YAP || exit 1
}

run_test basic_tests
run_test path_small_tests
run_test sub_tests
run_test complex_types_tests
