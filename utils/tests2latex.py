#!/usr/bin/python

import sys

def sortedDictValues(adict):
  items = adict.items()
  items.sort()
  return items

def get_speedup(sub, var):
  if sub == 0.0:
    return "$\infty$"
  else:
    return "%.3f" % (float(var) / float(sub))

dir = sys.argv[1]
xsb_variant = dir + "/xsb_variant.csv"
xsb_subsumptive = dir + "/xsb_subsumptive.csv"
yap_variant = dir + "/yap_variant.csv"
yap_subsumptive = dir + "/yap_subsumptive.csv"

print xsb_variant
print xsb_subsumptive
print yap_variant
print yap_subsumptive

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
  test_size = int(test_vector[test_len-1])
  test_data = test_vector[test_len-2]
  test_name = "_".join(test_vector[1:test_len-2]).replace('_', '\\_')

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
  full_test_size = calculate_test_elems(data)
  print_first = True
  print "\multirow{" + str(full_test_size) + "}{*}{" + test + "} & ",

  for data_name, size in data.iteritems():
    total_data = calculate_data_elems(size)
    if print_first is False:
      print "& ",
      print_first = True
    print "\multirow{" + str(total_data) + "}{*}{" + data_name + "} & ",
    print_second = True

    for item in sortedDictValues(size):
      size_name = item[0]
      final = item[1]

      if print_first is False:
        print "& ",
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

      print str(xsbv_time) + " & " + str(xsbs_time) + " & ",
      if xsbv_time == "CRASHED" or xsbs_time == "CRASHED":
        print "-",
      else:
        print get_speedup(xsbs_time, xsbv_time),
      
      print " & " + str(yapv_time) + " & "+ str(yaps_time) + " & ",
      print get_speedup(yaps_time, yapv_time),
      print "\\\\"

      print_first = False
      print_second = False
    print "\\cline{2-9}"
  print "\\hline"

