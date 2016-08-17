#!/bin/bash -ex
./convert_event_log_to_sendevents.py < event.log > event.sh
rm event.log
