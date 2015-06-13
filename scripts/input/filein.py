#!/usr/bin/env python3.4
#Originally from Python cookbook 3rd Edition (thank you!)
import fileinput

with fileinput.input() as f_input:
    for line in f_input:
        print(line, end='')


