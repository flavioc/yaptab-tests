#!/bin/bash

export IGNORE_TABLES=yes
bash run_debug_test_suite.sh \
  -c run_config_files/yap_retroactive_exec_answers.pl \
  -o retro_tests \
  $*
