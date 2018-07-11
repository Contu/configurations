#!/bin/bash

sudo umount -l $1
rmdir `basename $1`
