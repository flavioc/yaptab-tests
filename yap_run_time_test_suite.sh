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
DEFAULT_TIME_FILE=""
DEFAULT_ARGUMENTS=""

while test 1=1; do
   case "$1" in
      -t*)
	    shift
	    TIME_FILE=$1
	    shift
	    ;;
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
   echo "Usage: ./yap_run_debug_test_suite.sh [-t time_file] [-a \"arguments\"] prolog_bin"
   echo "       time_file        -- Prolog file defining the time predicate"
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

if test -z "${TIME_FILE}"; then
   TIME_FILE=${DEFAULT_TIME_FILE}
elif test ! -f "${TIME_FILE}"; then
   echo
   echo "Can't find '${TIME_FILE}'"
   echo "Aborting ..."
   echo
   exit
fi

if test -z "${ARGUMENTS}"; then
    ARGUMENTS=${DEFAULT_ARGUMENTS}
fi

for mode in ${MODE_FILES} ; do
   ./run_time_test_suite.sh -c ${mode} -t "${TIME_FILE}" -a "${ARGUMENTS}" ${PROLOG_BIN}
   sleep 1
done
