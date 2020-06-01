Java Application Monitoring and Troubleshooting
===============================================

_4. Java Application as a Runtime White Box: App running, JVM and modern applicaition internals monitoring, troubleshooting, faults analysing and tuning._ 21hrs.

# Attendee prerequisites
- [ ] Training «1. Java Application Building» completion

# Training Objectives
- [ ] Understanding modern application architecture and defect hotspots
- [ ] Hands-on skill of localizing defects based on overall picture
- [ ] Hands-on skill of workload generation for basic verification tasks
- [ ] Understanding JVM classes, memory and threading architecture
- [ ] Hands-on skill of reporting JVM crashes and internal errors
- [ ] Hands-on skill of profiling memory-intensive applications
- [ ] Understanding modern IO architecture and its pitfalls
- [ ] Hands-on skill of profiling application IO
- [ ] Understanding RDBMS data storage interaction architecture
- [ ] Hands-on skill of profiling persistent data-driven applications
- [ ] Understanding typical caching issues within modern applications
- [ ] Hands-on skill of profiling applications caching
- [ ] Understanding microservices distributed architecture and pitfalls
- [ ] Hands-on skill of tracing and profiling distributed application

# Prerequisites
### Hardware
- [ ] RAM ≥ 8Гб
- [ ] Wi-Fi with Internet access
## Software
- [ ] [git](https://git-scm.com/downloads)
- [ ] [JDK8](https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
- [ ] [IDEA (trial Ultimate)](https://www.jetbrains.com/idea/download/)
- [ ] [Maven](https://maven.apache.org/download.cgi)
- [ ] [Docker](https://www.docker.com/products/docker-desktop)
## Network Access
- [ ] github.org :443 :80
- [ ] repo1.maven.org :443 :80
- [ ] jcenter.bintray.com :443 :80

# Agenda
## Training introducing and focusing (1 hrs)
- [ ] Schedule
- [ ] Trainer
- [ ] Training overview
- [ ] Rules
### Hands-on: teams and their demand
- [ ] Pairs forming and introduction
- [ ] Attendees prerequisites check
- [ ] Topics focus demand from attendees
- [ ] Additional topics demand form attendees

## Sound-check (0.5)
### Hands-on
- [ ] Fork App repo and clone this fork
```bash
git clone --branch master --depth 1 https://github.com/ACCOUNT/agile-practices-application
```
- [ ] Open project with IDEA
- [ ] Project JDK set
- [ ] Sourcepath and classpathes
- [ ] Maven full build
### Demo
- [ ] Application requirements overview
- [ ] Application architecture overview
- [ ] DevOps pipeline overview

## What should QA control? (1.5)
### Demo for typical enterprise applicaition architecture
- Layers: UI, API, BL, DAL 
- Frameworks
- Application caches
- Thread Pools
- JPA subsystem
- JPA caches
- JDBC subsystem
- Connection Pools 
- Container
- JVM: threads, in- and off-memory, GC, IO/NIO
- Message queues
- DBMS
- OS
- Hardware
### Hands-on
- [ ] Localize and name typical issues

## How to generate application workload to reproduce issues? (1.5)
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

## How to deal with JVM crashes? (1)
### JVM crash dump
- [ ] When and how?
- [ ] Structure
- [ ] Analysing
### Demo
- [ ] JVM crash dump analysing
### JVM crash reporting
- [ ] Report structure
### Hands-on
- [ ] Reproducing JVM crash
- [ ] Reporting JVM crash

## How to deal with typical JVM threading issues? (2.5)
### JVM threading architecture
- [ ] Threads
- [ ] Sheduler and preemtive concurrency
- [ ] Sheduling overhead
- [ ] Green and native threads
- [ ] Thread states
- [ ] Types of blocking/waiting
- [ ] Thread pooling patterns
### Demo
- [ ] Making thread dump and analysing with IDE
- [ ] Making thread dump and analysing with Profiler
- [ ] Monitoring threads online with local JMX Profiler
- [ ] Monitoring threads online with remote JMX Profiler
### Application threading architecture
- [ ] Threading patterns for connections
- [ ] Threading patterns for logic processing
- [ ] Data access concurrency architectures
- [ ] Cooperative concurrency application arhitecture
### Hands-on
- [ ] Given workload
- [ ] Analyse thread dump
- [ ] Analyse thread states
- [ ] Make issue hypothesis report and resolving plan
### Typical issues and resolution
- [ ] Paralllism issues
- [ ] Concurrency issues

## How to deal with typical JVM memory issues? (2.5)
### JVM memory architecture
- [ ] On-heap and off-heap architectures
- [ ] GC algorithms
- [ ] Memory structures for typical GCs
### Heap dumps
- [ ] Creating
- [ ] Analysing
### Demo
- [ ] Online memory profiling
- [ ] Heap dump analysing
### Hands-on
- [ ] Given workload
- [ ] Analyse heap dump
- [ ] Analyse profiling reports
- [ ] Make issue hypothesis report and resolving plan
### Typical issues and resolution
- [ ] Leaks
- [ ] OOME for different generations
### GC issues
- [ ] stop-the-world problem
- [ ] GC trade-off for latency and thoughput
- [ ] Resolution
### Demo
- [ ] GC tuning
### Hands-on
- [ ] Given workload
- [ ] Analyse GC settings
- [ ] Analyse performace report
- [ ] Make issue hypothesis report and resolving plan

## How to deal with typical IO issues? (2.5)
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
- [ ] Analyse IO operations
- [ ] Analyse profiling reports
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
### Hands-on
- [ ] Given workload
- [ ] Analyse IO operations
- [ ] Analyse profiling reports
- [ ] Make issue hypothesis report and resolving plan

## How to deal with typical data storage issues? (2.5)
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
- [ ] Analyse profiling reports
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
### Hands-on
- [ ] Given workload
- [ ] Analyse DB operations
- [ ] Analyse profiling reports
- [ ] Make issue hypothesis report and resolving plan
### DB architecture
- [ ] DB request processing
- [ ] DB execution plan
- [ ] Constraints
- [ ] Indexes
- [ ] Transactions implementation architectures
- [ ] "Vacuum" side effects
### Demo
- [ ] Profiling DB request
### Hands-on
- [ ] Given workload
- [ ] Analyse DB schema
- [ ] Analyse requests profiles
- [ ] Make issue hypothesis report and resolving plan

## How to deal with typical caching issues? (1.5)
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
### Hands-on
- [ ] Given workload
- [ ] Analyse caches architecture
- [ ] Analyse caches statisitcs
- [ ] Make issue hypothesis report and resolving plan

## How to deal with typical distributed system issues? (2.5)
### First Law of Distributed Objects
- [ ] Distributed systems: Seasons in the abbys
- [ ] CAP thesis
- [ ] Data storage architectures overview in CAP terms
### Microservices architecture patterns and trade-offs
- [ ] Why microservices?
- [ ] Data encapsulation
- [ ] Gateway
- [ ] Services discovery
- [ ] Data duplication
- [ ] Distributed transactions
### Monitoring and tracing
- [ ] Monitoring patterns
- [ ] Tracing patterns
### Demo
- [ ] Business operation in microservices environment tracing
### Hands-on
- [ ] Given workload
- [ ] Analyse distributed architecture
- [ ] Analyse call trace
- [ ] Play "hell monkey"
- [ ] Make issue hypothesis report and resolving plan

## Buffer (1.5)
- [ ] Daily retrospectives
