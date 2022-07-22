#!/bin/bash

awk '/^(ISBN [0-9]-[0-9]{2}-[0-9]{6}-[0-9])$/ {print $0}' isbn.txt
