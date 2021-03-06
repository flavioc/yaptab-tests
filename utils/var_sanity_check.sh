#!/bin/bash

YAP=$1

if [ -z "$YAP" ]; then
  echo "usage: var_sanity_check.sh <YAP>"
  exit 1
fi

run_test () {
  test=$1
  bash ./run_debug_test_suite.sh -o $test \
    $YAP || exit 1
}

run_load_test () {
  test=$1
  bash ./run_debug_test_suite.sh -o $test \
    $YAP || exit 1
}

run_test basic_tests
run_test path_small_tests

run_load_test basic_tests
run_load_test path_small_tests

bash utils/clear_results.sh
