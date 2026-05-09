# OS Prev QS Analysis

<!-- TOC start (generated with https://github.com/derlin/bitdowntoc) -->

> Table of Contents - Click to follow...

- [OS Prev QS Analysis](#os-prev-qs-analysis)
  - [Mahbub Sir's Part](#mahbub-sirs-part)
    - [Chapter 1: Introduction](#chapter-1-introduction)
    - [Chapter 2: Operating-System Structures](#chapter-2-operating-system-structures)
    - [Chapter 3: Processes](#chapter-3-processes)
    - [Chapter 4: Threads & Concurrency](#chapter-4-threads-concurrency)
    - [Chapter 5: CPU Scheduling](#chapter-5-cpu-scheduling)
  - [Muhtasim Sir's Part](#muhtasim-sirs-part)
    - [Chapter 6: Synchronization Tools](#chapter-6-synchronization-tools)
    - [Chapter 7: Synchronization Examples](#chapter-7-synchronization-examples)
    - [Chapter 8: Deadlocks](#chapter-8-deadlocks)
    - [Chapter 9: Main Memory](#chapter-9-main-memory)

<!-- TOC end -->

<!-- TOC --><a name="os-prev-qs-analysis"></a>

<!-- TOC --><a name="mahbub-sirs-part"></a>

> This analysis may contain errors and is not guaranteed to be 100% accurate. Please use it as a reference and cross-check with the original question papers for any discrepancies!

## Mahbub Sir's Part

> Focus on Exercise, Objective (প্রতিটি অধ্যায়ের শুরুতে থাকে কিছু)

<!-- TOC --><a name="chapter-1-introduction"></a>

### Chapter 1: Introduction

**Short Questions**

- What are the three main purposes of an operating system? **(Book's Exercise 1.1)** ★★★
- We have stressed the need for an operating system to make efficient use of the computing hardware. When is it appropriate for the operating system to forsake this principle and to "waste" resources? Why is such a system not really wasteful? **(Book's Exercise 1.2)** ★★★
- "An operating system is similar to a government." - Justify. ★★
- Illustrate the transition from user mode to kernel mode. How does the distinction between kernel mode and user mode function as a rudimentary form of protection (security)? **(Book's Exercise 1.5)** ★★
- Describe the general organization of a computer system and the role of interrupts. ★
- Describe the components in a modern multiprocessor computer system. ★
- What do you mean by dual-mode operation of an operating system? ★
- Does timesharing differ from multiprogramming? If so, how? ★

**Descriptive Questions**

- Identify several advantages and several disadvantages of open-source operating systems. Identify the types of people who would find each aspect to be an advantage or a disadvantage. **(Book's Exercise 1.27)** ★★
- Distinguish between the client-server and peer-to-peer models of distributed systems. Describe some distributed applications that would be appropriate for a peer-to-peer system. **(Book's Exercise 1.11, 1.26)** ★★
- Define operating system. Identify services provided by an operating system. ★★
- Some early computers protected the operating system by placing it in a memory partition that could not be modified by either the user job or the operating system itself. Describe two difficulties that you think could arise with such a scheme. **(Book's Exercise 1.7)** ★
- How do clustered systems differ from multiprocessor systems? What is required for two machines belonging to a cluster to cooperate to provide a highly available service? **(Book's Exercise 1.12)** ★
- Describe some of the challenges of designing operating systems for mobile devices compared with designing operating systems for traditional PCs. **(Book's Exercise 1.24)** ★
- Differentiate between multiprogramming and multiprocessing with appropriate examples. ★
- How does an OS work as a resource allocator? ★
- Why is Direct Memory Access (DMA) used? ★
- What are the advantages of multiprocessors systems? ★

<!-- TOC --><a name="chapter-2-operating-system-structures"></a>

### Chapter 2: Operating-System Structures

**Short Questions**

- What is the purpose of system calls? **(Book's Exercise 2.1)** ★★★ **[17-18 FINAL] [18-19 MID] [18-19 FINAL] [19-20 FINAL] [20-21 FINAL]**
- Describe three general methods for passing parameters to the operating system. **(Book's Exercise 2.10)** ★★★ **[17-18 MID] [18-19 FINAL] [20-21 FINAL]**
- Why do some systems store the operating system in firmware, while others store it on disk? **(Book's Exercise 2.7)** ★ **[20-21 FINAL]**
- What is a system program? ★ **[12-13 FINAL]**
- Why should we use APIs rather than system calls? ★ **[11-12 FINAL]**
- Contrast and compare an application programming interface (API) and an application binary interface (ABI). **(Book's Exercise 2.16)** ★ **[18-19 MID]**
- Why are applications operating system specific? ★ **[19-20 FINAL]**
- What system calls have to be executed by a command interpreter or shell in order to start a new process on a UNIX system? **(Book's Exercise 2.3)** ★ **[20-21 FINAL]**

**Descriptive Questions**

- It is sometimes difficult to achieve a layered approach if two components of the operating system are dependent on each other. Identify a scenario in which it is unclear how to layer two system components that require tight coupling of their functionalities. **(Book's Exercise 2.18)** ★★ **[17-18 FINAL]**
- What is the main advantage of the microkernel approach to system design? How do user programs and system services interact in a microkernel architecture? What are the disadvantages of using the microkernel approach? **(Book's Exercise 2.19)** ★★ **[17-18 MID] [18-19 FINAL]**
- Compare and contrast monolithic, layered, microkernel, modular, and hybrid strategies for designing operating systems. ★★ **[19-20 FINAL] [20-21 FINAL]**
- Explain why Java programs running on Android systems do not use the standard Java API and virtual machine. **(Book's Exercise 2.22)** ★★ **[17-18 FINAL] [18-19 MID]**
- The services and functions provided by an operating system can be divided into two main categories. Briefly describe the two categories, and discuss how they differ. **(Book's Exercise 2.9)** ★ **[17-18 MID]**
- List five services provided by an operating system, and explain how each creates convenience for users. In which cases would it be impossible for user-level programs to provide these services? Explain your answer. **(Book's Exercise 2.6)** ★ **[18-19 MID]**
- Explain how OS handles a user application invoking the `open()` system call with relevant figure. ★ **[12-13 FINAL]**
- Suppose you want to copy a file's content into a newly created file. What will be the systems calls for this purpose? ★ **[11-12 FINAL]**

<!-- TOC --><a name="chapter-3-processes"></a>

### Chapter 3: Processes

**Short Questions**

- Define Process. What are the different parts of a process? ★★★ **[11-12 FINAL] [16-17 FINAL] [19-20 FINAL]**
- What are different process states? Draw the possible state diagram for a process. ★★★ **[11-12 FINAL] [16-17 FINAL] [18-19 FINAL]**
- What is process control block (PCB)? Describe Process Control Block and explain the necessity of Process Control Block. ★★ **[16-17 FINAL] [19-20 FINAL]**
- Describe the actions taken by a kernel to context-switch between processes. **(Book's Exercise 3.8)** ★★ **[17-18 FINAL] [18-19 FINAL]**
- What is context switch? "Context switch time is pure overhead" - justify the statement. ★★ **[12-13 FINAL] [13-14 FINAL]**
- Define cooperating process. ★ **[19-20 FINAL]**

**Descriptive Questions**

- Differentiate between Shared-Memory systems and Message-Passing systems. ★★★ **[16-17 FINAL]**
- How is a new process created using `fork()` system call? How many times does the associated program print 'Operating System' / explain what the output will be at Line A. ★★ **[12-13 FINAL] [13-14 FINAL]**
- Explicate the queuing diagram representation of process scheduling. ★★ **[12-13 FINAL] [13-14 FINAL]**
- Define remote procedure calls. Describe and contrast interprocess communication using shared memory and message passing. ★★ **[19-20 FINAL] [20-21 FINAL]**
- Describe how processes are created and terminated in an operating system, including developing programs using the appropriate system calls that perform these operations. ★ **[19-20 FINAL]**
- Illustrate Process Creation in UNIX Operating System with an example. ★ **[16-17 FINAL]**
- What are the two models of inter-process communication? What are the strengths and weaknesses of the two approaches? **(Book's Exercise 3.17)** ★ **[18-19 FINAL]**
- Give an example of a situation in which ordinary pipes are more suitable than named pipes and an example of a situation in which named pipes are more suitable than ordinary pipes. **(Book's Exercise 3.14)** ★ **[18-19 FINAL]**
- What are the benefits and the disadvantages of each of the following? Synchronous and asynchronous communication; Automatic and explicit buffering; Send by copy and send by reference; Fixed-sized and variable-sized messages. **(Book's Exercise 3.17)** ★ **[17-18 FINAL]**

<!-- TOC --><a name="chapter-4-threads-concurrency"></a>

### Chapter 4: Threads & Concurrency

**Short Questions**

- Define thread. Identify the basic components of a thread, and contrast threads and processes. ★★★ **[12-13 FINAL] [19-20 FINAL] [20-21 FINAL]**
- What resources are used when a thread is created? How do they differ from those used when a process is created? **(Book's Exercise 4.6)** ★ **[20-21 FINAL]**
- What are two differences between user-level threads and kernel-level threads? **(Book's Exercise 4.4)** ★ **[17-18 FINAL]**
- Define data and task parallelism. ★ **[18-19 FINAL]**

**Descriptive Questions**

- Differentiate between single-threaded process and multi-threaded process. Describe the major benefits and significant challenges of designing multithreaded processes. ★★★ **[16-17 FINAL] [19-20 FINAL] [20-21 FINAL]**
- Explain Amdahl's Law. Calculate the speedup gain of an application that has a 60 percent parallel component for two processing cores and four processing cores. **(Book's Exercise 4.2)** ★★ **[16-17 FINAL] [18-19 FINAL]**
- Draw multi-threading models. Describe about different multithreading models. ★★ **[18-19 FINAL] [19-20 FINAL]**
- Describe about Java Threads. Illustrate different approaches to implicit threading, including thread pools, fork-join, and Grand Central Dispatch. ★★ **[16-17 FINAL] [19-20 FINAL] [20-21 FINAL]**
- Under what circumstances does a multithreaded solution using multiple kernel threads provide better performance than a single-threaded solution on a single-processor system? **(Book's Exercise 4.9)** ★ **[17-18 FINAL]**
- A system with two dual-core processors has four processors available for scheduling. A CPU-intensive application is running... How many threads will you create to perform the input and output? How many threads will you create for the CPU-intensive portion? Explain. **(Book's Exercise 4.16)** ★ **[17-18 FINAL]**
- Original versions of Apple's mobile iOS operating system provided no means of concurrent processing. Discuss three major complications that concurrent processing adds to an operating system. **(Book's Exercise 3.3)** ★ **[17-18 FINAL]**
- Is it possible to have concurrency but not parallelism? Explain. **(Book's Exercise 4.13)** ★ **[17-18 FINAL]**

<!-- TOC --><a name="chapter-5-cpu-scheduling"></a>

### Chapter 5: CPU Scheduling

**Short Questions**

- Explain the difference between preemptive and nonpreemptive scheduling. **(Book's Exercise 5.2)** ★★★ **[16-17 FINAL] [17-18 FINAL] [19-20 FINAL] [20-21 FINAL]**
- What criteria affects the schedulers performance? Which ones should be maximized and minimized? ★★★ **[11-12 FINAL] [12-13 FINAL] [13-14 FINAL]**
- Why CPU scheduling needed? Write down the basis for process scheduling. ★★ **[16-17 FINAL] [19-20 FINAL]**
- Explain various kinds of schedulers. ★★ **[16-17 FINAL]**
- What is dispatcher? ★ **[19-20 FINAL]**
- Define indefinite postponement (Starvation). ★ **[12-13 FINAL]**

**Descriptive Questions**

- Consider the given set of processes (with arrival, burst, and priority). Draw Gantt charts for FCFS, SJF, non-preemptive priority, and RR. Calculate turnaround time, waiting time, and identify the minimum average waiting time. **(Book's Exercise 5.4, 5.17)** ★★★ **[12-13 FINAL] [13-14 FINAL] [17-18 FINAL] [18-19 FINAL] [19-20 FINAL]**
- Suppose that the given processes arrive for execution at the times indicated. What is the average turnaround time for FCFS and SJF? Compute the average turnaround time if the CPU is left idle for the first 1 unit and then SJF scheduling is used (future-knowledge scheduling). **(Book's Exercise 5.3)** ★★★ **[16-17 FINAL] [18-19 FINAL] [19-20 FINAL]**
- The following processes are being scheduled using a preemptive, priority-based, round-robin scheduling algorithm. Show the scheduling order using a Gantt chart. What is the turnaround and waiting time for each process? **(Book's Exercise 5.5, 5.18)** ★★★ **[17-18 FINAL] [20-21 FINAL]**
- Explain the issues related to multiprocessor and multicore scheduling. ★★ **[19-20 FINAL] [20-21 FINAL]**
- Discuss how the following pairs of scheduling criteria conflict in certain settings: CPU utilization and response time; Average turnaround time and maximum waiting time; I/O device utilization and CPU utilization. **(Book's Exercise 5.12)** ★ **[17-18 FINAL]**
- Illustrate how a smaller time quantum increases context switches with an appropriate example. ★ **[13-14 FINAL]**
- Consider the exponential averaging method is used to estimate the length of next CPU burst. What is the sequence of estimated CPU burst lengths for the given history? ★ **[12-13 FINAL]**
- Many CPU-scheduling algorithms are parameterized. What relation holds between Priority and FCFS, and between RR and SJF? **(Book's Exercise 5.7)** ★ **[16-17 FINAL]**
- Consider a variant of the RR scheduling algorithm in which the entries in the ready queue are pointers to the PCBs. What would be the effect? What are major advantages and disadvantages? How would you modify to achieve the same effect without duplicate pointers? **(Book's Exercise 5.21)** ★ **[18-19 FINAL]**

***

<!-- TOC --><a name="muhtasim-sirs-part"></a>

## Muhtasim Sir's Part

> Sir won't be repeating questions, so I guess focusing on the basics would be more beneficial...

<!-- TOC --><a name="chapter-6-synchronization-tools"></a>

### Chapter 6: Synchronization Tools

**Short Questions**

- What causes data inconsistency during concurrent access? What is critical-section problem? ★★★ **[17-18 FINAL] [18-19 FINAL] [19-20 FINAL] [20-21 FINAL]**
- Mention three requirements that a solution to the critical section problem must satisfy. ★★★ **[12-13 FINAL] [13-14 FINAL] [18-19 FINAL]**
- What are mutex locks? What is spinlock? ★★★ **[17-18 FINAL] [18-19 FINAL] [19-20 FINAL] [20-21 FINAL]**
- Define liveness in process execution life cycle. State the effect of liveness failure in the process execution life cycle. ★★★ **[17-18 FINAL] [18-19 FINAL] [19-20 FINAL] [20-21 FINAL]**
- What is the meaning of the term busy waiting? **(Book's Exercise 6.2)** ★ **[12-13 FINAL]**

**Descriptive Questions**

- Explain Peterson's Solution for critical section. Mention the limitation of Peterson's solution for addressing the critical section problem. ★★★ **[12-13 FINAL] [13-14 FINAL] [16-17 FINAL] [17-18 FINAL] [18-19 FINAL] [20-21 FINAL]**
- Differentiate between Semaphore and Mutex Lock. Review the limitations of semaphore solution to the critical section problem. ★★★ **[16-17 FINAL] [19-20 FINAL] [20-21 FINAL]**
- State the solution to the critical section problem using mutex locks. ★★ **[17-18 FINAL] [18-19 FINAL] [20-21 FINAL]**
- Explicate the Consumer-Producer problem. Where is the critical section of this problem? Develop a model of a system consisting of cooperating sequential processes or threads with the producer-consumer problem. ★★ **[12-13 FINAL] [19-20 FINAL]**
- Explain the strategy, high-level synchronization construct-the monitor type, for dealing with such errors. ★★ **[19-20 FINAL] [20-21 FINAL]**
- Semaphore S is an integer variable which is manipulated through two operations, `wait()` and `signal()`. How can you overcome the semaphore definition problem by modifying the definition of `wait()` and `signal()` operation? ★ **[12-13 FINAL]**

<!-- TOC --><a name="chapter-7-synchronization-examples"></a>

### Chapter 7: Synchronization Examples

**Short Questions**

- Formulate the readers-writers problem as a classical synchronization problem. ★★ **[19-20 FINAL]**

**Descriptive Questions**

- Define and demonstrate the dining-philosophers problem as a synchronization problem. State the semaphore and monitor solutions of the dining-philosophers problem. ★★★ **[18-19 FINAL] [19-20 FINAL] [20-21 FINAL]**
- Illustrate the solution of Readers-Writers problem using binary and mutex semaphore. ★★ **[16-17 FINAL] [19-20 FINAL]**

<!-- TOC --><a name="chapter-8-deadlocks"></a>

### Chapter 8: Deadlocks

**Short Questions**

- What four conditions must be fulfilled for a deadlock to occur? Point out the 4 necessary conditions, which hold simultaneously in a system, for a deadlock situation. ★★★ **[12-13 FINAL] [13-14 FINAL] [18-19 FINAL] [19-20 FINAL] [20-21 FINAL]**
- What is a system model? Define deadlock with a multithreaded application example. ★★★ **[17-18 FINAL] [18-19 FINAL] [19-20 FINAL] [20-21 FINAL]**
- List the methods for handling deadlock. What is deadlock avoidance? ★★ **[20-21 FINAL]**

**Descriptive Questions**

- Illustrate and explain the resource-allocation graph, resource-allocation graph with deadlock, and resource-allocation graph with a cycle but no deadlock. ★★★ **[17-18 FINAL] [18-19 FINAL] [19-20 FINAL] [20-21 FINAL]**
- What are the side effects of preventing deadlock? Describe the data structures which must be maintained to implement the banker's algorithm for deadlock avoidance. ★★★ **[17-18 FINAL] [18-19 FINAL]**
- How to detect deadlock in a system? Illustrate and explain the data structures, which must be maintained, the process, and an example of the deadlock detection algorithm with several instances of each resource type. ★★★ **[18-19 FINAL] [19-20 FINAL] [20-21 FINAL]**
- Suppose you have processes P1, P2, P3 and resources R1, R2, R3 and R4. Draw the Resource allocation graph... Is the above situation a deadlock? Justify your answer. ★★ **[11-12 FINAL] [13-14 FINAL]**
- Consider a system with 12 magnetic tape drives and three processes P1, P2, P3... Suppose at time t1... Is the system in a safe state at time t1? Why or why not? (Banker's Algorithm Problem variant). ★★ **[12-13 FINAL] [13-14 FINAL]**
- "A cycle in the graph is a necessary but not a sufficient condition for the existence of a deadlock" - justify the statement with an appropriate example. ★ **[12-13 FINAL]**
- Illustrate safe, unsafe, and deadlocked state spaces with an example. ★ **[20-21 FINAL]**

<!-- TOC --><a name="chapter-9-main-memory"></a>

### Chapter 9: Main Memory

**Short Questions**

- Distinguish logical versus physical address space. What is a memory management unit (MMU)? Explain the function of the memory management unit. ★★★ **[18-19 FINAL] [19-20 FINAL] [20-21 FINAL]**
- "The page sizes are always power of 2" - Justify. **(Book's Exercise 9.2)** ★★ **[12-13 FINAL] [13-14 FINAL]**
- Distinguish between internal and external fragmentation. **(Book's Exercise 9.11)** ★★ **[13-14 FINAL]**
- "Context switching time is high for swapping" - Justify the statement with an appropriate example. ★ **[12-13 FINAL]**

**Descriptive Questions**

- What is paging? Explain and illustrate the paging model of logical and physical memory, and a memory-management scheme that permits a process's physical address space to be noncontiguous. ★★★ **[18-19 FINAL] [19-20 FINAL] [20-21 FINAL]**
- Given five memory partitions of 100 KB, 500 KB, 150 KB, 350 KB and 600 KB (in order)... how would each of the first-fit, best-fit & worst-fit algorithms place processes of 110 KB, 419 KB, 210 KB and 423 KB... Which algorithm makes the most efficient use of memory and why? **(Book's Exercise 9.6, 9.13)** ★★★ **[11-12 FINAL] [12-13 FINAL] [13-14 FINAL]**
- Provide a paging example for a 32-byte memory with 4-byte pages. ★★ **[18-19 FINAL]**
- What is the advantage of using TLB in paging? Illustrate how TLB is used with page table in paging scheme. ★★ **[12-13 FINAL] [13-14 FINAL]**
- For improving the utilization of the CPU and the speed of the computer's response to its users, list various ways to manage memory in the operating system. ★ **[18-19 FINAL]**
- Describe a mechanism for enforcing memory protection in order to prevent a program from modifying the memory associated with other programs. **(Book's Exercise 9.16)** ★ **[19-20 FINAL]**
- State the solution to external fragmentation problem. Explain the segmentation hardware along with an appropriate example. ★ **[12-13 FINAL]**
- Consider a system with 80% hit ratio, 200 nano-seconds time to access memory & 20 nanoseconds time to access TLB. Calculate the Effective Access Time (EAT). **(Book's Exercise 9.25)** ★ **[12-13 FINAL]**
