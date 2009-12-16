##################################################################
##
## File:      run_output_filter.py
## Author(s): Miguel Areias and Ricardo Rocha
## Program:   Script for sorting the output
##
##################################################################

import sys
import operator

########## defs ##########

def add_entry(type):
    if (type=="Predicate"):
        tables.append((line,[]))
    elif (type=="Subgoal"):
        tables[len(tables)-1][1].append((line,[]))
    elif (type=="Answer"):
        args=tables[len(tables)-1][1]
        args[len(args)-1][1].append(line)

def parse_line_tables():
    if (line[0:5]=="Table"):
        add_entry("Predicate")
    elif (line[2]== "?" or line[2:7]=="EMPTY"):
        add_entry("Subgoal")
    elif (line[4:8]=="TRUE" or line[4:6]=="NO" or line[4:7]=="VAR"):
        add_entry("Answer")

########## main ##########

if len(sys.argv) == 1:
    line = raw_input()
    while line!="*** TIME ***":
        line = raw_input()
    line = raw_input()        
    while line!="*** END TIME ***":
        print line
        line = raw_input()
else:
    # sort solutions
    solutions=[]
    line = raw_input()
    while line!="*** SOLUTIONS ***":
        line = raw_input()
    line = raw_input()
    while line!="*** END SOLUTIONS ***":
        solutions.append(line)
        line = raw_input()
    solutions_sorted=sorted(solutions)
    fa = open(sys.argv[1]+'.solutions', 'w')
    for solution in solutions_sorted:
        fa.write(solution+'\n')
    fa.close()
    solutions=[]

    # sort tables
    tables=[]
    line = raw_input()
    while line!="*** TABLES ***":
        line = raw_input()
    line = raw_input()
    while line!="*** END TABLES ***":
        parse_line_tables()
        line = raw_input()
    predicates_sorted=sorted(tables, key=operator.itemgetter(0))
    ft = open(sys.argv[1]+'.tables', 'w')
    for predicate in predicates_sorted:
        ft.write(predicate[0]+'\n')
        subgoals_sorted=sorted(predicate[1], key=operator.itemgetter(0))
        for subgoal in subgoals_sorted:
            ft.write(subgoal[0]+'\n')
            answers_sorted=sorted(subgoal[1])
            for answer in answers_sorted:
                ft.write(answer+'\n')
    ft.close()
    tables=[]
