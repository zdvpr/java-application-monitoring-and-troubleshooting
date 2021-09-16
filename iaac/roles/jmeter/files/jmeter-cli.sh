#!/bin/sh

rm -rf log/jmeter
mkdir -p log/jmeter/report
jmeter -n -t load.jmx -j log/jmeter/jmeter.log -l log/jmeter/jmeter.jtl -e -o log/jmeter/report
