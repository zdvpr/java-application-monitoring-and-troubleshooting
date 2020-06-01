Java Application Monitoring and Troubleshooting
===============================================

_4. Java Application as a Runtime White Box: App running, JVM and applicaition monitoring, troubleshooting, faults analysing and tuning._ 24 hrs / 3 days.

# Training Objectives
- [ ] Understanding modern application architecture and defect hotspots
- [ ] Understanding JVM classes, memory and threading architecture
- [ ] Hands-on skill of monitoring memory-intensive applications
- [ ] Understanding modern IO architecture and its pitfalls
- [ ] Hands-on skill of monitoring persistent data-driven applications
- [ ] Hands-on skill of monitoring applications caching

# Agenda
Starred items are optional.

---

## Training introducing and focusing (0.5 hrs)
- [ ] Schedule
- [ ] Trainer
- [ ] Training overview
- [ ] Rules
### Hands-on: teams and their demand
- [ ] Pairs forming and introduction
- [ ] Attendees prerequisites check
- [ ] Topics focus demand from attendees
- [ ] Additional topics demand form attendees

## Java Platform crash course (2)
### Designnig application data
- [ ] Primitive Types
- [ ] Structures with class and enum
### Desigining application behavior
- [ ] OOAD overview
- [ ] Types: class, abstract class, interface
### Implementing application
- [ ] Working with _instance and its reference_: create and GC
- [ ] Working with _thread_: Thread API, states, pooling
### Building application
- [ ] Build cycle raw
- [ ] Build cycle with Maven
### Running application
- [ ] Run with JVM
- [ ] What Quality Attributes does JVM provide for application?
### Monitoring application
- [ ] JMX overview
### Teamwork
- [ ] Start *checklist* by tier: JVM metrics
### Hands-on
- [ ] Simple memory-intensive threaded application loading and monitoring

## Modern applications architecture and deployment (2)
### Tiers to monitor and control overvirew
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
