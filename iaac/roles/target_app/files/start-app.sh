#!/bin/sh

nohup \
  java \
    -Xms128m -Xmx128m \
    -XX:+IgnoreUnrecognizedVMOptions -XX:+UnlockDiagnosticVMOptions -XX:+UnlockExperimentalVMOptions \
    -XX:ReservedCodeCacheSize=100m \
    -XX:+PrintCompilation -XX:+LogCompilation -XX:LogFile=jit.log.xml \
    -XX:+TraceClassLoading -XX:+TraceClassUnloading \
    -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=heapdump.hprof \
    -Xloggc:gc.log -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=8 -XX:GCLogFileSize=8m \
    -Xlog:gc*,safepoint:gc.log:time,uptime:filecount=10,filesize=128K \
    -XX:NativeMemoryTracking=detail \
    -Dderby.stream.error.file=log/derby.log \
    -Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false \
    -Djava.rmi.server.hostname=127.0.0.1 -Dcom.sun.management.jmxremote.port=9999 -Dcom.sun.management.jmxremote.rmi.port=9999 \
    -jar dbo-1.0-SNAPSHOT.jar \
      --spring.profiles.active=qa \
      --server.port=8080 \
> /dev/null 2>&1 &
