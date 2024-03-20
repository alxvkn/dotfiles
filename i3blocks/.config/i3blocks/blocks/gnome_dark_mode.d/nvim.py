#!/bin/python

import os, glob, sys
from pynvim import attach

paths = glob.glob(f'/run/user/' + str(os.getuid()) + '/nvim.*')

for p in paths:
    nvim = attach('socket', path=p)
    nvim.command('set bg=' + sys.argv[1])
