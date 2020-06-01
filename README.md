Java Application Monitoring and Troubleshooting Basics
======================================================
_4. Java Application as a Runtime White Box: App running, JVM and application monitoring, troubleshooting, faults analysing and tuning._ 24 hrs / 3 days.

# Training Objectives
- [ ] Understanding modern application architecture and defect hotspots
- [ ] Understanding JVM classes, memory and threading architecture
- [ ] Hands-on skill of monitoring modern applications
- [ ] Understanding modern IO architecture and its pitfalls
- [ ] Hands-on skill of monitoring persistent data-driven applications

# Prerequisites
## Hardware
- [ ] RAM ≥ 8Гб
- [ ] Wi-Fi with Internet access
## Software
- [ ] [git](https://git-scm.com/downloads)
- [ ] [JDK8](https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
- [ ] [Jetbrains IDEA](https://www.jetbrains.com/idea/download/)
## Network Access
- [ ] github.org :443 :80
- [ ] repo1.maven.org :443 :80
- [ ] jcenter.bintray.com :443 :80

# Agenda
_* starred items are optional_

## Training introducing and focusing (30m)
- [ ] Schedule
- [ ] Trainer
- [ ] Training overview
- [ ] Rules

## Hands-on: Teams and their demand (15m)
- [ ] Pairs forming and introduction
- [ ] Attendees prerequisites check
- [ ] Topics focus demand from attendees
- [ ] Additional topics demand form attendees

## Java Platform crash course (2hr)
<!--- TODO Rosetta stone visuals: concept - metaphor - code -->
### Why Java?
- [ ] Platform Goals
- [ ] JVM
- [ ] JRE
- [ ] JDK
### What do any application doing?
- [ ] Data input
- [ ] Data processing
- [ ] Data storing
- [ ] Data output
### How we do model the data?
- [ ] Primitive Types
- [ ] Structures with class and enum
### How we do model the behavior?
- [ ] OOAD overview
- [ ] Types: class, abstract class, interface
- [ ] Methods and call stack
### How do we implement application? Key concepts
- [ ] Working with _class_: dynamic classloading
- [ ] Working with _instance and its reference_: create and GC
- [ ] Working with _thread_: Thread API, states, pooling
### Where data is stored? Core data scopes
- [ ] Local/method/stack variables
- [ ] Object properties/state: request, thread-local, session, singleton/application
- [ ] Persistent: file, embedded/local database
- [ ] Integration: remote filesystem, remote database, remote system procedure call, remote message queue
### [Teamwork](#teamwork-nfrs-and-metrics-checklist)
### How do we build an application?
- [ ] Phisical point ov view for java application
- [ ] Classes, packages and JARs
- [ ] classpath x2
- [ ] Build cycle raw
- [ ] Build cycle with Maven
### How do we run an application?
- [ ] Run with JVM
- [ ] Ways for application run-time parameterization: jvm parameters, program arguments, sys/app properties
- [ ] Key JVM parameters for memory setup
### How do we monitor a java application internals?
- [ ] JMX simple tooling demo: JVisualVM
- [ ] JMX architecture overview
### [Hands-on](hands-on-simple-application-building-running-and-monitoring)

## Teamwork: NFRs and metrics checklist (15m)
- [ ] What Quality Attributes/NFRs does JVM provide for application?
- [ ] What Quality Attributes/NFRs does we satisfy with application monitoring?
- [ ] Start metrics [checklist](METRICS-CHECKLIST.md) by tier: JVM metrics

## Hands-on: Simple application building, running and monitoring (30m)
### Given
- [ ] Satisfied [prerequisites](#Prerequisites) 
- [ ] Forked simple project [codebase](https://github.com/eugene-krivosheyev/java-application-monitoring-and-troubleshooting)
- [ ] Cloned simple project
```shell script
cd
git clone https://github.com/YOUR_ACCOUNT/java-application-monitoring-and-troubleshooting
cd java-application-monitoring-and-troubleshooting
git checkout <group_branch, e.g. 2020-06-raiffeisen>
```
### When
- [ ] Project application built locally with maven
```shell script
mvn clean verify
```
- [ ] Project application ran locally with CLI
```shell script
java -cp 
```
- [ ] JVisualVM profiler connected to running app
```shell script
$JAVA_HOME/bin/jvisualvm
```
- [ ] OS-specific monitoring tool shows application process details
```shell script
linux$ top [-pid jvmpid]
windows> taskmgr
```
### Then
- [ ] What is the default encoding for I/O?
- [ ] What is the default heap size for app running?
- [ ] How many java threads is active within JVM? 
- [ ] How many OS threads is active within OS JVM process? 
- [ ] What is the minimal possible heap size for app running?

---

## Modern applications architecture and deployment (2)
<!--- TODO jps and cli staff -->
### Tiers to monitor and control overview
- Docker Containers
- Application Layers: UI, API, BL, DAL 
- Application Frameworks
- Application caches
- Thread Pools
- JPA subsystem
- JPA caches
- JDBC subsystem
- Connection Pools 
- JVM: threads, in- and off-memory, GC, IO/NIO
- Message queues
- DBMS
- OS
- Hardware
### Hands-on
- [ ] Name monitoring and logging APIs/protocols for tires
### How to monitor tiers
- [ ] Monitoring and logging APIs/protocols for tires overview

## Typical JVM memory issues (3)
### JVM memory architecture
- [ ] On-heap and off-heap architectures
- [ ] GC algorithms
- [ ] Memory structures for typical GCs
### Heap dumps and key memory metrics
- [ ] Creating
- [ ] Analysing
### Demo
- [ ] Memory parameters tuning
- [ ] Analyse metrics with Prometheus
- [ ] Heap dump analysing
### Hands-on
- [ ] Add new metrics to *checklist* by tier: JVM
- [ ] Given workload
- [ ] Analyse metrics with Prometheus
- [ ] Analyse remote heap dump
- [ ] Make issue hypothesis report and resolving plan
### Typical issues and resolution
- [ ] Leaks
- [ ] OOME for different generations
### GC issues
- [ ] stop-the-world problem
- [ ] GC trade-off for latency and thoughput
### Demo
- [ ] GC statistics monitoring
### Teamwork
- [ ] New metrics to *checklist* by tier: JVM
### Hands-on
- [ ] Given workload
- [ ] Analyse GC settings
- [ ] Analyse GC statistics with Prometheus
- [ ] Make issue hypothesis report and resolving plan

## Typical JVM threading issues (3)
### JVM threading architecture
- [ ] Threads
- [ ] Sheduler and preemtive concurrency
- [ ] Sheduling overhead
- [ ] Green and native threads
- [ ] Thread states
- [ ] Types of blocking/waiting
### Demo
- [ ] Making thread dump and analysing with IDE
- [ ] Making thread dump and analysing with Profiler
- [ ] Monitoring threads online with local JMX Profiler
- [ ] Analyse thread statistics with Prometheus
### Application threading architecture
- [ ] Thread pooling patterns
- [ ] Threading patterns for connections
- [ ] Threading patterns for logic processing
- [ ] Data access concurrency architectures
- [ ] Cooperative concurrency application arhitecture
### Typical issues and resolution
- [ ] Paralllism issues and patterns
- [ ] Concurrency issues and patterns
### Teamwork
- [ ] New metrics to *checklist* by tier: JVM
### Hands-on
- [ ] Given workload
- [ ] Analyse thread statistics with Prometheus
- [ ] Make issue hypothesis report and resolving plan

## Typical JVM IO issues (3)
### Blocking IO architecture
- [ ] Syncronous IO concept
- [ ] Building blocks
### Demo
- [ ] Sync remote call implementation
### Typical issues
- [ ] Encoding
- [ ] Buffering
- [ ] Blocking for user data
- [ ] Excessive IO classes objects allocation
- [ ] Closing resources
- [ ] Pooling resources
### Hands-on
- [ ] Given workload
- [ ] Analyse IO operations with Prometheus and logs
- [ ] Make issue hypothesis report and resolving plan
### Non-blocking IO architecture
- [ ] Asyncronous IO concept
- [ ] NIO building blocks
### Demo
- [ ] Async remote call implementation
### Typical issues
- [ ] Code complexity
- [ ] Error handling
- [ ] Response time
### Teamwork
- [ ] New metrics to *checklist* by tier: JVM, OS
### Hands-on
- [ ] Given workload
- [ ] Analyse IO operations with Prometheus and logs
- [ ] Make issue hypothesis report and resolving plan

## Typical data storage issues (3)
### JDBC architecture
- [ ] JDBC API
- [ ] Driver types
- [ ] Prefetching tuning
- [ ] Prepared statements
- [ ] Batch operattions
- [ ] Transactions
- [ ] Isolation levels
- [ ] Connection pools
### Demo
- [ ] Database CRUD implementaion with low-level JDBC API
- [ ] Database CRUD implementaion with Spring JDBC Template
### Hands-on
- [ ] Given workload
- [ ] Analyse DB operations
- [ ] Make issue hypothesis report and resolving plan
### JPA architecture
- [ ] JPA API
- [ ] Caching levels
- [ ] JPA transactions architecture
### Spring JPA architecture
- [ ] Spring Data JPA
- [ ] Transaction management
### Demo
- [ ] Database CRUD implementaion with Spring Data JPA
### Teamwork
- [ ] New metrics to *checklist* by tier: JPA, JVM
### Hands-on
- [ ] Given workload
- [ ] Analyse DB operations
- [ ] Make issue hypothesis report and resolving plan

## Typical JVM containerization issues (1)
### Containerization architectue
- [ ] Docker overview
- [ ] Docker containers
- [ ] Docker images
- [ ] Image provisioning and repositories
### Demo
- [ ] Application containerization
- [ ] Configurating container and resource limits
- [ ] Running and monitoring container
### Containerization issues
- [ ] Memory issues and patterns
- [ ] Disk I/O issues and patterns
### Teamwork
- [ ] New metrics to *checklist* by tier: JVM, OS
### Hands-on
- [ ] Given workload
- [ ] Modify container configuration with K8s сonfig
- [ ] Analyse system metrics with Prometheus
- [ ] Make issue hypothesis report and resolving plan

## Final retro (0.5)
- [ ] Value taken
- [ ] Process Improvement Actions 
- [ ] Training Improvement Actions

---

## Typical caching issues (1.5)*
### Caching concept
- [ ] Why caches?
- [ ] Caching architecture: levels
### Demo
- [ ] Caching proxy
- [ ] Java Cache API
- [ ] Spring application caching
- [ ] JPA cache levels
- [ ] DB caches
### Typical issues
- [ ] Cold start
- [ ] Hit statistics
- [ ] Cache resetting and inconsistency
### Teamwork
- [ ] New metrics to *checklist* by tier: caches
### Hands-on
- [ ] Given workload
- [ ] Analyse application caches configuration
- [ ] Analyse caches statisitcs
- [ ] Make issue hypothesis report and resolving plan

## Generating application workload (1.5)*
### Load test design
- [ ] Black-box approach
- [ ] Load test structure
- [ ] Load tests suite
- [ ] Metrics to analyse
### Load test types
- [ ] Load
- [ ] Stress
- [ ] Spike
- [ ] Redundancy
### Demo with JMeter tool
- [ ] Agent architecture
- [ ] Test plan
- [ ] Configuring reports
- [ ] Running workload
- [ ] Report analysis
### Hands-on
- [ ] Congiuring workload plan
- [ ] Running workload
- [ ] Analysing reports
- [ ] Issue hypothesis

## Distributed logging (1.5)*
### Intro to Java logging solutions
- [ ] Java logging libraries hell
- [ ] SLF4J and Logback overview
- [ ] Logging architecture
- [ ] Application configuration
### Hands-on
- [ ] Configuring application local logging
### Distributed logging collection and processing
- [ ] Distributed logging collection architecture with ELK stack
- [ ] Application configuration
- [ ] Searching and analysing logs
### Demo
- [ ] Configuring application distributed logging
### Hands-on
- [ ] Given configuration
- [ ] Load tests run
- [ ] Analysing logs with ELK

## System monitoring (1.5)*
### Distributed monitoring arhitecture
- [ ] Prometheus architecture overview
- [ ] Metrics sources and agents
- [ ] Analysing monitoring dashboards and alerts
### Teamwork
- [ ] New metrics *checklist* by tier: system and OS
### Demo
- [ ] Configuring hardware metrics dasboard and alerts with Prometheus
### Hands-on 
- [ ] Given configuration
- [ ] Load tests run
- [ ] Analysing metrics and alerts with Prometheus
### Teamwork
- [ ] New metrics to *checklist* by tier: JVM
### Demo
- [ ] Configuring JVM through JMX metrics with Prometheus
### Hands-on 
- [ ] Given configuration
- [ ] Load tests run
- [ ] Analysing metrics and alerts with Prometheus
- [ ] Make issue hypothesis report and resolving plan

## Typical RDBMS issues (1.5)*
### DB architecture
- [ ] DB request processing
- [ ] DB execution plan
- [ ] Constraints
- [ ] Indexes
- [ ] Transactions implementation architectures
- [ ] "Vacuum" side effects
### Demo
- [ ] Profiling DB request with explain
### Teamwork
- [ ] New metrics to *checklist* by tier: DBMS, OS
### Hands-on
- [ ] Given workload
- [ ] Analyse DB schema
- [ ] Analyse requests profiles
- [ ] Make issue hypothesis report and resolving plan

## Typical CI/CD [pipeline overview](https://paper.dropbox.com/doc/Delivery-Pipeline-ci-cd-devops--A1GO2JqCDUodW3pUl3K0fsRxAQ-OBLCVRSkMek24U7IXIHbq)
