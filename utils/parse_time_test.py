#!/usr/bin/python

import re
import sys

pattern = re.compile('test \'(.*)\': cputime (.*) is ([0-9]*\.?[0-9]*)')

for line in sys.stdin:
  m = pattern.match(line)
  if m:
    test = m.group(1)
    time = m.group(3)
    print test + " ; " + time
