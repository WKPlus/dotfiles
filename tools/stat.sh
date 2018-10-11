#!/bin/bash
#Author: zhaoqifa
sysctl -n hw.ncpu

top -l 1|sed -n '/CPU usage:/p'
mem_free=$(top -l 1|awk '/PhysMem:/{print $10}')
top -l 1|head -10|grep PhysMem

istats
#system_profiler |grep Processor

