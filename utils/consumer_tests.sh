#!/bin/bash

YAP=$1

if [ -z "$YAP" ]; then
  echo "usage: consumer_tests.sh <yap path>"
  exit 1
fi

export IGNORE_TABLES=yes
bash run_debug_test_suite.sh -o consumer_tests -c run_config_files/yap_batched_exec_answers.pl $YAP
