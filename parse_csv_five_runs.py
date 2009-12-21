#!/usr/bin/python

import re
import sys

pattern = re.compile('test \'(.*)\': cputime average five runs is (.*) \(.*\)')

for line in sys.stdin:
  m = pattern.match(line)
  if m:
    test = m.group(1)
    time = m.group(2)
    print test + " ; " + time
