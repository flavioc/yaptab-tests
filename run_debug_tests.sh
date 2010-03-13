##################################################################
##
## File:      run_debug_tests.sh
## Author(s): Miguel Areias and Ricardo Rocha
## Program:   Script for running the debug tests
##
##################################################################

#!/bin/sh

PROLOG_BIN=$1
MODE_FILE=$2
TARGET_DIRECTORY=$3

CURRENT_DIRECTORY=${PWD}
RESULTS_TEMP_DIR=run_results_temp
RESULTS_OK_DIR=run_results_ok
OUTPUT_FILTER=${CURRENT_DIRECTORY}/run_output_filter.py

check_output () {
   status=0
   if test -z "$IGNORE_TABLES"; then
     diff -u ${RESULTS_TEMP_DIR}/${file}.tables ${RESULTS_OK_DIR}/${file}.tables > ${RESULTS_TEMP_DIR}/${file}.diff_tables 2>> ${RESULTS_TEMP_DIR}/${file}.stderr || status=1
   fi
   diff -u ${RESULTS_TEMP_DIR}/${file}.solutions ${RESULTS_OK_DIR}/${file}.solutions > ${RESULTS_TEMP_DIR}/${file}.diff_solutions 2>> ${RESULTS_TEMP_DIR}/${file}.stderr || status=`expr ${status} + 2`
   if test ${status} -eq 0; then
      echo -n "ok!"
      rm -f ${RESULTS_TEMP_DIR}/${file}.solutions      2> /dev/null
      rm -f ${RESULTS_TEMP_DIR}/${file}.tables         2> /dev/null
      rm -f ${RESULTS_TEMP_DIR}/${file}.diff_solutions 2> /dev/null
      rm -f ${RESULTS_TEMP_DIR}/${file}.diff_tables    2> /dev/null
      rm -f ${RESULTS_TEMP_DIR}/${file}.stderr         2> /dev/null
   else
      echo -n "failed!"
      if test ${status} -gt 1; then
         xsb_status=0
         diff -u ${RESULTS_TEMP_DIR}/${file}.solutions ${RESULTS_OK_DIR}/${file}.solutions_xsb > /dev/null 2>> /dev/null || xsb_status=1
         if test ${xsb_status} -eq 1; then
            echo -n "   [ solutions output ]"
         else
            echo -n "   [ solutions output (XSB compatible) ]"
         fi
         status=`expr ${status} - 2`
      fi
      if test -z "$IGNORE_TABLES"; then
        if test ${status} -eq 1; then
           xsb_status=0
           diff -u ${RESULTS_TEMP_DIR}/${file}.tables ${RESULTS_OK_DIR}/${file}.tables_xsb > /dev/null 2>> /dev/null || xsb_status=1
           if test ${xsb_status} -eq 1; then
              echo -n "   [ tables output ]"
           else
              echo -n "   [ tables output (XSB compatible) ]"
           fi
         fi
      fi
   fi
   echo
}

cd ${TARGET_DIRECTORY}

TEST_FILES=$(ls test_*.pl 2> /dev/null)
DATA_FILES=$(ls data_*.pl 2> /dev/null)

for test_file in ${TEST_FILES}; do
   if test -z "${DATA_FILES}"; then
      file=${test_file%.pl}
      echo -n "test '${file}': "
      ${PROLOG_BIN} <<xxxQUERY_GOALSxxx 2> ${RESULTS_TEMP_DIR}/${file}.stderr | python ${OUTPUT_FILTER} ${RESULTS_TEMP_DIR}/${file} 2> /dev/null
         ['${MODE_FILE}'].
         ['${test_file}'].
         nl, write('*** SOLUTIONS ***'), nl, (debug_query ; write('*** END SOLUTIONS ***')), nl.
         nl, write('*** TABLES ***'), nl, show_all_tables, abolish_all_tables, write('*** END TABLES ***'), nl.
         halt.
xxxQUERY_GOALSxxx
      check_output
   else
      for data_file in ${DATA_FILES}; do
         file=${test_file%.pl}_${data_file%.pl}
         echo -n "test '${file}': "
         ${PROLOG_BIN} <<xxxQUERY_GOALSxxx 2> ${RESULTS_TEMP_DIR}/${file}.stderr | python ${OUTPUT_FILTER} ${RESULTS_TEMP_DIR}/${file} 2> /dev/null
            ['${MODE_FILE}'].
            ['${test_file}'].
            ['${data_file}'].
            nl, write('*** SOLUTIONS ***'), nl, (debug_query ; write('*** END SOLUTIONS ***')), nl.
            nl, write('*** TABLES ***'), nl, show_all_tables, abolish_all_tables, write('*** END TABLES ***'), nl.
            halt.
xxxQUERY_GOALSxxx
         check_output
      done
   fi
done

cd $CURRENT_DIRECTORY
