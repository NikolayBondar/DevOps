#!/bin/bash
lsof -u nikolay -a -p $$ -d 0,1,2 | tr -s " " | cut -d ' ' -f2,3,4,9  > descr.txt