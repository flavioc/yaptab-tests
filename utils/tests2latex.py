#!/usr/bin/python

import sys

## model checking
# HAS_SIZE = False
# DATA_POS = 1

# tst
HAS_SIZE = True
DATA_POS = 2

def table_configuration():
  if HAS_SIZE:
    return "cc|ccc|ccc"
  else:
    return "c|ccc|ccc"

def data_columns():
  if HAS_SIZE:
    return str(2)
  else:
    return str(1)

def sortedDictValues(adict):
  items = adict.items()
  items.sort()
  return items

def get_speedup(sub, var):
  if sub == 0.0:
    return "$\infty$"
  else:
    return "%.3f" % (float(var) / float(sub))

def get_xsb_time(time):
  if time == "CRASHED":
    return "\\scriptsize{crashed}"
  else:
    return time

dir = sys.argv[1]
xsb_variant = dir + "/xsb_variant.csv"
xsb_subsumptive = dir + "/xsb_subsumptive.csv"
yap_variant = dir + "/yap_variant.csv"
yap_subsumptive = dir + "/yap_subsumptive.csv"

xsbv = open(xsb_variant)
xsbs = open(xsb_subsumptive)
yapv = open(yap_variant)
yaps = open(yap_subsumptive)

tests = {}

while True:
  xsbv_s = xsbv.readline()
  if xsbv_s == "":
    break
  xsbs_s = xsbs.readline()
  yapv_s = yapv.readline()
  yaps_s = yaps.readline()

  xsbv_v = xsbv_s.split(';')
  xsbv_time = xsbv_v[1].strip('\n ')
  xsbs_v = xsbs_s.split(';')
  xsbs_time = xsbs_v[1].strip('\n ')
  yapv_v = yapv_s.split(';')
  yapv_time = yapv_v[1].strip('\n ')
  yaps_v = yaps_s.split(';')
  yaps_time = yaps_v[1].strip('\n ')

  test_vector = xsbv_v[0].split('_')
  test_len = len(test_vector)
  test_data = test_vector[test_len-DATA_POS].strip('\n ')

  if HAS_SIZE:
    test_size = int(test_vector[test_len-1])
    shift_name = test_len - 2
  else:
    shift_name = test_len - 3
    test_size = 1
  test_name = "_".join(test_vector[1:shift_name]).replace('_', '\\_')

  test_obj = False
  try:
    test_obj = tests[test_name]
  except KeyError:
    data = {}
    tests[test_name] = data
    test_obj = data

  data_obj = False
  try:
    data_obj = test_obj[test_data]
  except KeyError:
    size = {}
    test_obj[test_data] = {}
    data_obj = test_obj[test_data]

  final_obj = [xsbv_time, xsbs_time, yapv_time, yaps_time]
  data_obj[test_size] = final_obj

def calculate_test_elems(data):
  total = 0
  for data_name, size in data.iteritems():
    for size_name, final in size.iteritems():
      total = total + 1
  return total

def calculate_data_elems(size):
  total = 0
  for size_name, final in size.iteritems():
    total = total + 1
  return total

for test, data in tests.iteritems():
  print """\\begin{table}[ht]
\\footnotesize{
  \\begin{tabular}{""" + table_configuration() + """}
   \hline
    \hline
    \multicolumn{""" + data_columns() + """}{c|}{\multirow{2}{*}{\small{\\textbf{Data}}}} & \multicolumn{3}{c|}{\small{\\textbf{SLG-WAM}}} & \multicolumn{3}{c}{\small{\\textbf{YapTab}}} \\\\
     \multicolumn{""" + data_columns() + """}{c|}{} & \\textbf{\\textit{Variant}} & \\textbf{\\textit{Subsumptive}} & \\textbf{\\textit{Speedup}} & \\textbf{\\textit{Variant}} & \\textbf{\\textit{Subsumptive}} & \\textbf{\\textit{Speedup}} \\\\
   \hline
   \hline
"""

  count = 0
  yap_total = 0.0
  xsb_total = 0.0
  for data_name, size in data.iteritems():
    total_data = calculate_data_elems(size)
    print "\multirow{" + str(total_data) + "}{*}{\\textbf{" + data_name + "}} & ",
    print_second = True

    for item in sortedDictValues(size):
      size_name = item[0]
      final = item[1]

      if HAS_SIZE:
        if print_second is False:
          print "& ",
        print str(size_name) + " & ",

      xsbv_time = final[0].replace(',', '.')
      xsbs_time = final[1].replace(',', '.')
      yapv_time = final[2].replace(',', '.')
      yaps_time = final[3].replace(',', '.')

      if xsbv_time != "":
        xsbv_time = int(float(xsbv_time))
      else:
        xsbv_time = "CRASHED"
      if xsbs_time != "":
        xsbs_time = int(float(xsbs_time))
      else:
        xsbs_time = "CRASHED"
      yapv_time = int(float(yapv_time))
      yaps_time = int(float(yaps_time))
      if yapv_time == 0:
        yapv_time = 1
      if yaps_time == 0:
        yaps_time = 1
      if xsbs_time == 0:
        xsbs_time = 1
      if xsbv_time == 0:
        xsbv_time = 1

      print str(get_xsb_time(xsbv_time)) + " & " + str(get_xsb_time(xsbs_time)) + " & ",
      if xsbv_time == "CRASHED" or xsbs_time == "CRASHED":
        print "---",
        xsb_speedup = 1.0
      else:
        xsb_speedup_s = get_speedup(xsbs_time, xsbv_time)
        xsb_speedup = float(xsb_speedup_s)
        print xsb_speedup_s,

      print " & " + str(yapv_time) + " & "+ str(yaps_time) + " & ",
      yap_speedup_s = get_speedup(yaps_time, yapv_time)
      yap_speedup = float(yap_speedup_s)
      print yap_speedup_s,
      print "\\\\"

      print_second = False
      count = count + 1
      yap_total = yap_total + yap_speedup
      xsb_total = xsb_total + xsb_speedup
    print "\\hline"
  print "\\hline"
  yap_average_speedup = yap_total / count
  xsb_average_speedup = xsb_total / count
  print "\multicolumn{" + data_columns() + "}{c|}{\\textit{Average}} & \multicolumn{2}{}{} & " + ("%.3f" % xsb_average_speedup) + " & \multicolumn{2}{}{} & " + ("%.3f" % yap_average_speedup) + " \\\\ "

  print """\\hline
\hline
\end{tabular}
}"""
  print "\caption{Results for program \\texttt{" + test + "}.}"
  print "\end{table}"
  print ""
