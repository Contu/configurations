#!/bin/bash

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/mpd.pid ] && mpd
