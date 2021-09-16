#!/bin/sh

rm -rf log/jmeter
mkdir -p log/jmeter/report
jmeter -t load.jmx -j log/jmeter/jmeter.log