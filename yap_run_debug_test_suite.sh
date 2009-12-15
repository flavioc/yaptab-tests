##################################################################
##
## File:      yap_run_debug_test_suite.sh
## Author(s): Ricardo Rocha
## Program:   Script for running the test suite with all 
##            configuration files for Yap
##
##################################################################

#!/bin/sh

MODE_FILES="run_config_files/yap_batched_exec_answers.pl run_config_files/yap_local_exec_answers.pl run_config_files/yap_batched_load_answers.pl run_config_files/yap_local_load_answers.pl"
DEFAULT_ARGUMENTS=""

while test 1=1; do
   case "$1" in
      -a*)
	    shift
	    ARGUMENTS=$1
	    shift
	    ;;
        *)
	    break
	    ;;
   esac
done

if test -z "$1" -o $# -gt 1; then
   echo
   echo "Usage: ./yap_run_debug_test_suite.sh [-a \"arguments\"] prolog_bin"
   echo "where: arguments        -- command line arguments to be passed to the Prolog executable"
   echo "       prolog_bin       -- full path for Prolog executable"
   echo
   exit
fi

PROLOG_BIN=$1
if test ! -x "${PROLOG_BIN}"; then
   echo
   echo "Can't execute '${PROLOG_BIN}'"
   echo "Aborting ..."
   echo
   exit
fi

if test -z "${ARGUMENTS}"; then
    ARGUMENTS=${DEFAULT_ARGUMENTS}
fi

for mode in ${MODE_FILES} ; do
   ./run_debug_test_suite.sh -c ${mode} -a "${ARGUMENTS}" ${PROLOG_BIN}
   sleep 1
done
