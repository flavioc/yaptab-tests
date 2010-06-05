#!/usr/bin/python

import re
import sys

#pattern = re.compile('test \'(.*)\': cputime (.*) is ([0-9]*\.?[0-9]*)')
pattern = re.compile('test \'(.*)\': (.*)')

for line in sys.stdin:
  m = pattern.match(line)
  if m:
    test = m.group(1)
    timestr = m.group(2)
    pat2 = re.compile('cputime (.*) is ([0-9]*\.?[0-9]*)')
    m2 = pat2.match(timestr)
    if m2:
      time = m2.group(2)
      print test + " ; " + time
    else:
      print test + " ; "
