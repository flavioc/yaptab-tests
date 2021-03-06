##################################################################
##
## File:      run_time_test_suite.sh
## Author(s): Miguel Areias and Ricardo Rocha
## Program:   Script for running the test suite
##
##################################################################

#!/bin/sh

DEFAULT_DIR_LIST="basic_tests bprolog_tests model_checking_tests open_rule_bench_tests path_big_tests path_medium_tests path_small_tests"
DEFAULT_MODE_FILE="run_config_files/default.pl"
DEFAULT_TIME_FILE="run_config_files/yap_cputime_average_three_runs.pl"
DEFAULT_ARGUMENTS=""

while test 1=1; do
   case "$1" in
      -e*)
	    shift
	    EXCLUDE_DIR_LIST=$1
	    shift
	    ;;
      -o*)
	    shift
	    ONLY_DIR_LIST=$1
	    shift
	    ;;
      -c*)
	    shift
	    MODE_FILE=$1
	    shift
	    ;;
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
   echo "Usage: ./run_time_test_suite.sh [-e \"exclude_dir_list\"] [-o \"only_dir_list\"] [-c config_file] [-t time_file] [-a \"arguments\"] prolog_bin"
   echo "where: exclude_dir_list -- quoted, space-separated list of directory tests to not run"
   echo "       only_dir_list    -- quoted, space-separated list of directory tests to run"
   echo "       config_file      -- Prolog file defining general settings/predicates for all tests"
   echo "       time_file        -- Prolog file defining the time predicate"
   echo "       arguments        -- command line arguments to be passed to the Prolog executable"
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

if test -z "${MODE_FILE}"; then
   MODE_FILE=${DEFAULT_MODE_FILE}
fi
if test ! -f "${MODE_FILE}"; then
   echo
   echo "Can't find '${MODE_FILE}'"
   echo "Aborting ..."
   echo
   exit
fi

if test -z "${TIME_FILE}"; then
   TIME_FILE=${DEFAULT_TIME_FILE}
fi
if test ! -f "${TIME_FILE}"; then
   echo
   echo "Can't find '${TIME_FILE}'"
   echo "Aborting ..."
   echo
   exit
fi

if test -z "${ONLY_DIR_LIST}"; then
    DIR_LIST=${DEFAULT_DIR_LIST}
else
    DIR_LIST=${ONLY_DIR_LIST}
fi

if test -z "${ARGUMENTS}"; then
    ARGUMENTS=${DEFAULT_ARGUMENTS}
fi

show_run_info () {
   echo "***********************"
   echo "***     run info    ***"
   echo "***********************"
   echo "PROLOG_BIN:  ${PROLOG_BIN} ${ARGUMENTS}"
   echo "MODE_FILE:   ${MODE_FILE}"
}

show_dir_info() {
   size=$(expr 15 + ${#1})
   for ((i = 0; i <= ${size}; i++)); do echo -n "*"; done
   echo
   echo "***     $1     ***"
   for ((i = 0; i <= ${size}; i++)); do echo -n "*"; done
   echo
}

member () {
   for elem in $2; do
      if test "$1" = "${elem}" ; then
	 return 0
      fi
   done
   return 1
}

run_recursive () {
  show_dir_info ${1}
  ./run_time_tests.sh "${PROLOG_BIN} ${ARGUMENTS}" \
    "${PWD}/${MODE_FILE}" "${PWD}/${TIME_FILE}" "${1}"
  rm -f "${1}/"*.xwam

  for dir in $(ls ${1}/); do
    if [ -d "${1}/${dir}" ]; then
      [ "${dir}" == "run_results_ok" ] && continue
      [ "${dir}" == "run_results_temp" ] && continue
      run_recursive "${1}/${dir}"
    fi
  done
}

show_run_info

for dir in ${DIR_LIST} ; do
   if member "${dir}" "${EXCLUDE_DIR_LIST}" ; then
      continue
   else
     run_recursive ${dir}
   fi
done

rm -f run_config_files/*.xwam
