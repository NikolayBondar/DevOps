#!/bin/bash

route add -net 212.100.54.0   netmask 255.255.255.192 eth0
route add -net 212.100.54.64  netmask 255.255.255.192 eth1
route add -net 212.100.54.128 netmask 255.255.255.192 eth2
route add -net 212.100.54.192 netmask 255.255.255.192 eth3

