https://rbru.slack.com/archives/C02MSHMQQ30
https://confluence.raiffeisen.ru/pages/viewpage.action?pageId=245709030

Dima's repositories:
https://github.com/zdvpr/java-application-monitoring-and-troubleshooting.git
https://github.com/zdvpr/agile-practices-application

Krivosheev:
https://github.com/eugene-krivosheyev/agile-practices-application
https://github.com/eugene-krivosheyev/java-application-monitoring-and-troubleshooting#readme

День 1
1. Мы стоим на плечах гигантов. Отзывчивость - очень важный показатель, который перевернул архитектуру.
2. Корутины наше будущее, а может и настоящее, если есть возможность.
3. Сделать 2 тренинга: для новичков и продвинутых, а то за двумя зайцами гонимся в отдельных моментах.

День 2
1) Асинхронно-не блокирующая архитекутра. Мы размениваем впремя отклика на длину очереди.
2) Осмысленное понимание метрик

День 3
1) Новые инструменты мониторинга. 
2) Улучшить: Более частые практики меньшего объема, после очередной темы. Это вроде как рекомендации методистов. 
Тренинг более динамичный получится и лучше усваивается информация.

День 4
1) Быстрый старт - AOT. 
2) Бизнес-метрики также стоит определить в формате JMX или Micrometer

### Практика 1 ###
https://github.com/Gertrido/java-application-monitoring-and-troubleshooting/blob/master/metrics.md


s-msk-t-jvm-01

uname --all
cat /etc/os-release
uptime

df -ah
free -m

ps -ef
ps -eaux --forest
ps -eT | grep <pid>

top + 'q'
top + 'f'
top -p <pid>
top -H -p <pid> 

vmstat 1 [-w] # mpstat 1
iostat 1 [-xm]
pidstat 1
netstat 1 [-tulnp]

jps [-lvm]
jcmd <pid> help
jcmd <pid> VM.uptime
jcmd 303568 VM.system_properties
jcmd <pid> VM.flags
jcmd <pid> PerfCounter.print
jcmd <pid> GC.heap_info
jcmd <pid> GC.finalizer_info
jcmd <pid> GC.class_stats
jcmd <pid> GC.class_histogram
jcmd <pid> Thread.print

java -XX:+UnlockDiagnosticVMOptions -XX:+UnlockExperimentalVMOptions -XX:+PrintFlagsFinal -version
jinfo <pid>
jinfo -flag PrintGCDetails <pid> # get jvm flag value
jinfo -flag +PrintGCDetails <pid> # change flag value, makes sense only for _manageable_ ones


### Практика 2 ###

Free HDD space?
df -ah

* Free RAM?
free -m

* How many JVMs running?
ps -ef | grep java

* What DBMS used for application?
смотрим у приложения application.yml, application.properties и параметры

* What JVM version used for application? What are the parameters, properties and arguments used?
jcmd 303568 VM.system_properties | grep -i version
jps []
jcmd 

* What are the health indicator for application?
http://s-msk-t-jvm-01:8080/dbo/actuator/health

* What is the application uptime?
jcmd 303568 VM.uptime

* What is the CPU usage for application?
top -H -p 303568
pidstat | grep 303568

* How many http requests servlet container handled by different URLs?
http://s-msk-t-jvm-01:9090/graph?g0.range_input=6h&g0.expr=http_server_requests_seconds_count&g0.tab=1&g1.range_input=1h&g1.expr=&g1.tab=1

* How many http sessions are active?
prometheus:  tomcat_sessions_active_current_session
netstat -an | grep :8080 | wc -l

* What is the current system load average?
cat /proc/loadavg
графана стандартный дэшборд:
http://s-msk-t-jvm-01:3000/d/RhK186GMz/node-exporter-full?orgId=1

What is the 90% percentile of service response time?
Jmeter логи, но только запускать нужно с аргументами из командной строки -e -o:
jmeter -n -t load.jmx -j log/jmeter/jmeter.log -l log/jmeter/jmeter.jtl -e -o log/jmeter/report
А из GUI логи не формируются, так как нужный аргумент нет возможности задать.

- [ ] Web applications used
```
http://s-msk-t-jvm-01:8080/dbo/swagger-ui.html

http://s-msk-t-jvm-01:8080/dbo/actuator/health
http://s-msk-t-jvm-01:8080/dbo/actuator
http://s-msk-t-jvm-01:8080/dbo/actuator/metrics
http://s-msk-t-jvm-01:8080/dbo/actuator/metrics/jvm.memory.max?tag=area:nonheap&tag=id:Metaspace

http://s-msk-t-jvm-01:8080/dbo/actuator/prometheus

http://s-msk-t-jvm-01:9090/alerts
http://s-msk-t-jvm-01:9090/graph
http://s-msk-t-jvm-01:9090/graph?g0.range_input=15m&g0.tab=0&g0.expr=http_server_requests_seconds_count

http://s-msk-t-jvm-01:3000
```

### Практика 3 ###

# java -XX:+PrintCompilation -XX:+PrintInlining -XX:+PrintAssembly -XX:+PrintOptoAssembly (C2 only)
# java -XX:+LogCompilation -XX:LogFile=jit.log

java -XX:+UnlockDiagnosticVMOptions -XX:+UnlockExperimentalVMOptions -XX:+PrintFlagsFinal -version | grep CodeCache
jinfo -flag UseCodeCacheFlushing <pid>
jinfo -flag InitialCodeCacheSize <pid>
jinfo -flag ReservedCodeCacheSize <pid>

jinfo -flag CICompilerCount <pid>
jinfo -flag BackgroundCompilation <pid>

jinfo -flag TieredCompilation <pid>
jinfo -flag CompileThreshold <pid> # _compile_ threshold applies only when standard compilation: -XX:-TieredCompilation
jinfo -flag Tier3InvocationThreshold <pid> # _invocation_ threshold applies when tiered compilation: -XX:+TieredCompilation
jinfo -flag Tier4InvocationThreshold <pid> # _invocation_ threshold applies when tiered compilation: -XX:+TieredCompilation

jstat -compiler <pid>
jstat -printcompilation <pid> [1000]
jstat -snap <pid> -J-Djstat.showUnsupported=true | grep .ci.

jcmd <pid> Compiler.codecache
jcmd <pid> Compiler.codelist | more

Как посмотреть разогрелся ли наш конкретный метод, мы видели только общее кол-во компиляций?
java -XX:+PrintCompilation -jar dbo-1.0-SNAPSHOT.jar


1. а) Нужно определенное кол-во запусков 2к (tiered) или 10к (иначе). б)  Греть под нагрузкой в) Проверяем по параметрам вытесняется ли скомпилирвоанный код из ССМ
2.  -||-
3. -
4. Разобрать проблемы с последней практикой

4. Задания в письменном виде

nohup \
  java \
    -Xms128m -Xmx128m \
    -XX:+IgnoreUnrecognizedVMOptions -XX:+UnlockDiagnosticVMOptions -XX:+UnlockExperimentalVMOptions \
    -XX:+PrintCompilation -XX:+LogCompilation -XX:LogFile=jit.log \
    -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=heapdump.hprof \
    -XX:+TraceClassLoading -XX:+TraceClassUnloading \
    -Xloggc:gc.log -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=8 -XX:GCLogFileSize=8m \
    -Xlog:gc*,safepoint:gc.log:time,uptime:filecount=10,filesize=128K \
    -XX:NativeMemoryTracking=detail \
    -Dderby.stream.error.file=log/derby.log \
    -Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false \
    -Djava.rmi.server.hostname=s-msk-t-jvm-01 -Dcom.sun.management.jmxremote.port=9999 -Dcom.sun.management.jmxremote.rmi.port=9999 \
    -jar dbo-1.0-SNAPSHOT.jar \
      --spring.profiles.active=qa \
      --server.port=8080 \
      --spring.datasource.hikari.maximumPoolSize=1 \
> /dev/null


https://chriswhocodes.com/vm-options-explorer.html

