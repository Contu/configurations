#!/bin/bash

kill -9 `ps aux|grep -i "python2 /usr/bin/offlineimap"|head -1|awk '{print $2}'`

offlineimap -o
