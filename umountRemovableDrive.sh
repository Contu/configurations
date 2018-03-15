#!/bin/bash

sudo umount $1
rmdir `basename $1`
