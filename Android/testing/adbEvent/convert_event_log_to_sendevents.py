#!/usr/bin/env python
import sys
import re
import datetime

#line_re = re.compile(r"^(\d\d\d\d-\d\d-\d\d \d\d:\d\d:\d\d\.\d+) (\S+) (\S+) (\S+)$")
line_re = re.compile(r"^(\d\d\d\d-\d\d-\d\d \d\d:\d\d:\d\d\.\d+) (\S+): (\S+) (\S+) (\S+)$")
event_log = sys.stdin
last_ts = None
for line in event_log:
    match = line_re.match(line.strip())
    if match:
        ts, ip, etype, ecode, data = match.groups()
        ts = datetime.datetime.strptime(ts, "%Y-%m-%d %H:%M:%S.%f")
        try:
            etype, ecode, data = int(etype, 16), int(ecode, 16), int(data, 16)
        except ValueError:
            print "# %s" % line
            continue
        if last_ts:
            delta = ts - last_ts
            sleeptime = '%.3f' % (delta.total_seconds())
            if float(sleeptime):
                print "sleep %s" % sleeptime
        last_ts = ts
        print "sendevent %s %s %s %s" % (ip, etype, ecode, data)
    else:
        print "# %s" % line
