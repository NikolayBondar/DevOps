#!/bin/bash

file=$1
awk '/^[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4} [0-9]{2}\/[0-9]{2}$/ {print $0}' $file

