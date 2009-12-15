##################################################################
##
## File:      run_time_tests.sh
## Author(s): Miguel Areias and Ricardo Rocha
## Program:   Script for running the time tests
##
##################################################################

#!/bin/sh

PROLOG_BIN=$1
MODE_FILE=$2
TIME_FILE=$3

TEST_FILES=$(ls test_*.pl 2> /dev/null)
DATA_FILES=$(ls data_*.pl 2> /dev/null)
OUTPUT_FILTER=run_output_filter.py

for test_file in ${TEST_FILES}; do
   if test -z "${DATA_FILES}"; then
      file=${test_file%.pl}
      echo -n "test '${file}': "
      ${PROLOG_BIN} <<xxxQUERY_GOALSxxx 2> /dev/null | python ${OUTPUT_FILTER} 2> /dev/null
         ['${MODE_FILE}'].
         ['${TIME_FILE}'].
         ['${test_file}'].
         nl, write('*** TIME ***'), nl, time, write('*** END TIME ***'), nl.
         halt.
xxxQUERY_GOALSxxx
   else
      for data_file in ${DATA_FILES}; do
         file=${test_file%.pl}_${data_file%.pl}
         echo -n "test '${file}': "
         ${PROLOG_BIN} <<xxxQUERY_GOALSxxx 2> /dev/null | python ${OUTPUT_FILTER} 2> /dev/null
            ['${MODE_FILE}']. 
            ['${TIME_FILE}']. 
            ['${test_file}']. 
            ['${data_file}']. 
            nl, write('*** TIME ***'), nl, time, write('*** END TIME ***'), nl.
            halt.
xxxQUERY_GOALSxxx
      done
   fi
done
