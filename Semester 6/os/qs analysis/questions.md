Session: 2011-12 (Final Examination Jul-Dec/14)
a. How does an OS work as a resource allocator?   
b. Why is Direct Memory Access (DMA) used?   
c. What are the advantages of multiprocessors systems?   
a. What is a system call? Why should we use APIs rather than system calls?   
b. Suppose you want to copy a file's content into a newly created file. What will be the systems calls for this purpose?   
a. Discuss OS services.   
b. Describe different methods to pass parameters to the OS.   
a. Define process. What are the different parts of a process?   
b. What are different process states? Draw the possible state diagram for a process.   
a. Discuss different types of process scheduler.   
b. Why should the CPU-scheduler be very fast?   
a. Suppose you have processes $P_{0}$, $P_{1}$, $P_{2}$, $P_{3}$, $P_{4}$ and Resources $R_{0}$, $R_{1}$, $R_{2}$, $R_{3}$, $R_{4}$. Draw the resource allocation graph for: une conditions such that $P_{0}$ has $R_{0}$ and requests for $R_{1}$ and $R_{3}$, $P_{1}$ has $R_{4}$ and requests for $R_{3}$ and $R_{2}$, $P_{2}$ has $R_{1}$ and requests for $R_{4}$, $P_{3}$ has $R_{3}$ and requests for $R_{0}$, and requests for $R_{4}$. The resources are single instance resources.   
b. Is the above situation a deadlock? Justify your answer.   
a. What are the issues that should be taken care of during preemptive scheduling?   
b. What are the criteria for CPU scheduling? Which ones should be maximized and minimized?   
For the following processes with the given burst time and arrival time, how can the processes be scheduled using SJF preemptive, SJF nonpreemptive, RR scheduling (Q=3ms)? Draw the Gantt chart. Calculate average waiting time for the processes.   
Suppose the memory has 6 free partitions of 5KB each. 5 Processes arrives as it is given in Question 8. The processes have 7KB, 4KB, 10KB, 8KB and 1KB memory requirements respectively. If it is a nonpreemptive case, how will memory be allocated to the processes using First-fit, Best-fit and Worst-fit algorithms? Calculate internal and external fragmentations for the algorithms.   
Session: 2012-13 (Final Examination-2015, July-Dec)
(a) Define operating system. Justify the statement "An operating system is similar to a government."   
(b) Contrast between a process and a thread. Mention some benefits of using threads.   
(c) What is system program? Explain how OS handles a user application invoking the open() system call with relevant figure.   
(a) What is context switch? "Context switch time is pure overhead"-justify the statement.   
2. (b) Explicate the queuing diagram representation of process scheduling.   
(c) How is a new process created using fork() system call? Using the program shown in Fig. 2(c), explain what the output will be at Line A.   
3. (a) What criteria are used to measure the performance of a CPU scheduling algorithm?   
(b) Consider the following set of processes with the length of the CPU-burst time given in milliseconds: i. Draw two Gantt charts illustrating the execution of these processes using a preemptive priority (a smaller priority number implies a higher priority) & RR (time quantum 1=2) scheduling algorithms. ii. Compute what the average turnaround time will be if the CPU is left, idle for the first 2 unit and then SJF scheduling is used.   
4. (a) "A cycle in the graph is a necessary but not a sufficient condition for the existence of a deadlock"-justify the statement with an appropriate example.   
(b) What do you mean by deadlock? Depict a resource-allocation graph for the following situations: $P=\{P_{1},P_{2},P_{3}\},R=\{R_{1},R_{2},R_{3},R_{4}\}$ and $E=\{P_{1}\rightarrow R_{1},P_{2}\rightarrow R_{3},R_{1}\rightarrow P_{2},R_{2}\rightarrow P_{2}, R_{3}\rightarrow P_{1},R_{3}\rightarrow P_{3},P_{3}\rightarrow R_{3}\}$. Resource Instances: R1 (1), R2 (2), R3 (1), R4 (3). And figure out the cycle if it does contain in the graph.   
(c) Consider a system with 12 magnetic tape drives and three processes P1, P2, P3. Process P1 requires 10 tape drives, process P2 may need as many as 4 tape drives, and process P3 may need up to 9 tape drives. Suppose that at a time t1, process P1 is holding 5 tape drives, process P2 is holding 2 tape drives and process P3 is holding 2 tape drives. i. Is the system in safe state at time t1? Why or why not? ii. Suppose that at time t2, process P2 requests and is allocated one more tape drive. What will be the safety situation?   
5. (a) What four conditions must be fulfilled for a deadlock to occur?   
(b) Semaphore S is an integer variable which is manipulated through two operations, wait () and signal (). How can you overcome the semaphore definition problem by modifying the definition of block wait() and signal () operation?   
(c) Mention three requirements that a solution to the critical section problem must satisfy. Briefly describe the Peterson's solution to this problem.   
6. (a) "The page sizes are always power of 2"-justify the statement.   
(b) State the solution to external fragmentation problem. Explain the segmentation hardware along with an appropriate example.   
(c) A small computer has four page frames. A process makes the following list of page references: 1,2,3,4,1,2,5,1,2,3,4,5. How many page faults would occur using Optimal, FIFO and LRU page replacement algorithms? Which algorithm results in minimum number of page faults and why?   
7. (a) What is the meaning of the term busy waiting?   
(b) What is the advantage of using TLB in paging? Illustrate how TLB is used with page table in paging scheme.   
(c) Given five memory partitions of 100 KB,500 KB, 150KB,350KB & 600 KB(in-order),how would each of the first-fit, best-fit & worst-fit algorithms place processes of 417 KB,110 KB,212 KB & 425 KB(in-order)? Which algorithm makes the most efficient ase of memory and why?   
8. (a) What do you mean by dual mode operation of an operating system?   
(b) Explicate the Consumer -Producer problem. Where is the critical section of this problem?   
(c) Consider the exponential averaging method is used to estimate the length of next CPU burst for a process. Assume $\pi_{0}=10$, $\alpha=0.2$ and the sequence of really observed CPU burst length so far is: 12, 18, 4, 10, 16. What is the sequence of estimated CPU burst length for next CPU burst?   
9. (a) Define indefinite postponement.   
9. (b) "Context switching time is high for swapping"- Justify the statement with an appropriate example.   
(c) Consider a system with 80% hit ratio, 200 nano-seconds time to access memory & 20 nanoseconds time to access TL.B. Calculate the Effective Access Time (EAT).   
Session: 2013-14 (Final Examination-2016, July-Dec)
1. "An operating system is similar to a government."- Justify.   
(a) Do timesharing differs from multiprogramming? If so, How?   
2. (b) Differentiate between multiprogramming and multiprocessing with appropriate examples.   
2. (c) With a neat sketch illustrate the architecture of a Linux system.   
3. (a) "Context switch time is pure overhead"- Justify.   
3. (b) Contrast between preemptive and non-preemptive scheduling with appropriate examples.   
3. (c) Elucidate the queuing diagram representation of process scheduling.   
(d) How is a new process created using fork() system call? How many times does the following program print 'Operating System'?   
(a) What criteria affects the schedulers performance? Which ones should be maximized and minimized?   
4. (b) Illustrate how a smaller time quantum increases context switches with an appropriate example.   
(c) Explain the FCFS, preemptive and non-preemptive version of Shortest-Job-First and Round Robin (time slice = 2) scheduling algorithms with Gantt chart for the four processes given. Compare their average waiting time and turnaround time   
(a) What do you mean by deadlock? What four conditions must be fulfilled for a deadlock to occur?   
(b) Suppose you have processes P1, P2,P3 and resources R1, R2, R3 and R4. Draw the Resource allocation graph for the conditions such that Pi has R2 and requests for R1, P2 has R1, R2 and requests for R3 and P3 has Ra, R2 and requests for R2. The resources are single instance resources.Is the above situation a deadlock? Justify your answer.   
(c) Consider a system with 12 magnetic tape drives and three processes P1, P2, P3. Process Pi requires 10 tape drives, process P2 may need as many as 4 tape drives, and process P3 may need up to 9 tape drives. Suppose that at a time ti, process Pi is holding 5 tape drives, process P2 is holding 2 tape drives and process P3 is holding 2 tape drives. i. Is the system in safe state at time t1? Why or why not? ii. Suppose that at time 12, process P2 requests and is allocated one more tape drive. What will be the safety situation?   
5. (a) "The page sizes are always power of 2" - Justify.   
(b) A parent may terminate the execution of one of it's children. What are the reasons?   
(c) Mention three requirements that a solution to the critical section problem must satisfy. Briefly describe the Peterson's solution to this problem.   
(d) Given five memory partitions of 100 KB,500 KB,150KB,350KB and 600 KB(in -order), how would each of the first-fit, best-fit & worst-fit algorithms place processes of 110 KB,419 KB,210 KB and 423 KB(in-order)? Which algorithm makes the most efficient use of memory and why?   
6. (a) Distinguish between internal and external fragmentation.   
6. (b) With a neat sketch illustrate how TLB is used with page table in paging scheme.   
6. (c) Explain the RAID structure in disk management with various RAID levels of organization in detail.   
(d) A small computer has four page frames. A process makes the following list of page references: 1,2,3,4,5,3,4,1,6,7,8,7,4,7,9,3. How many page faults would occur using Optimal, FIFO and LRU page replacement algorithms? Which algorithm results in minimum number of page faults and why?   
Session: 2016-17 (Final Examination, July-December 2019)
1. A. Illustrate Process Creation in UNIX Operating System with an example.   
1. B. Explain Peterson's Solution for critical section.   
C. Differentiate between Semaphore and Mutex Lock. Illustrate the solution of Readers-Writers problem using Semaphore.   
2. A. Explain Amdahl's Law.   
B. Differentiate between single-threaded process and multi-threaded process. Discuss the challenges in programming for multicore systems.   
2. C. Briefly describe various methods of Implicit Threading.   
3. A. Differentiate between Shared-Memory systems and Message-Passing systems.   
3. B. Explain various kinds of schedulers.   
C. Define Process. Describe multiple parts of Process. Explain states of Process. Describe Process Control Block and explain the necessity of Process Control Block.   
A. Write down the basis for process scheduling. Explain the difference between preemptive and nonpreemptive scheduling.   
B. Suppose that the following processes arrive for execution at the times indicated. Each process will run for the amount of time listed. In answering the questions, use nonpreemptive scheduling, and base all decisions have at the time the decision must be made. a) What is the average turnaround time for these processes with the FCFS scheduling algorithm? b) What is the average furnaround time for these processes with the SJF scheduling algorithm? c) The SJF algorithm is supposed to improve performance, but notice that we chose to run process PI at time 0 because we did not know that two shorter processes would arrive soon. Compute what the average turnaround time will be if the CPU is left idle for the first I unit and then SJF scheduling is used. Remember that processes Pl and P2 are waiting during this idle time, so their waiting time may increase. This algorithm could be called future-knowledge scheduling.   
C. Many CPU-scheduling algorithms are parameterized. For example, the RR algorithm requires a parameter to indicate the time slice. Multilevel feedback queues require parameters to define the number of queues, the scheduling algorithm for each queue, the criteria used to move processes between queues, and so on. These algorithms are thus really sets of algorithms (for example, the set of RR algorithms for all time slices, and so on). One set of algorithms may include another (for example, the FCFS algorithm is the RR algorithm with an infinite time quantum). What (if any) relation holds between the following pairs of algorithm sets? a. Priority and FCFS b. RR and SJF   
Session: 2017-18 (Mid Term Examination: July-December 2020)
How do clustered systems differ from multiprocessor systems? What is required for two machines belonging to a cluster to cooperate to provide a highly available service?   
2. Describe some distributed applications that would be appropriate for a peer-to-peer system.   
The services and functions provided by an operating system can be divided into two main categories. Briefly describe the two categories, and discuss how they differ.   
Describe three general methods for passing parameters to the operating system. What is the main advantage of the microkernel approach to system design? How do user programs and system services interact in a microkernel architecture? What are the disadvantages of using the microkernel approach?   
Session: 2017-18 (Final Examination, July-December/2020)
(a). What are the three main purposes of an operating system? We have stressed the need for an operating system to make efficient use of the computing hardware. When is it appropriate for the operating system to forsake this principle and to "waste" resources? Why is such a system not really wasteful?   
(b). Distinguish between the client-server and peer-to-peer models of distributed systems. Some early computers protected the operating system by placing it in a memory partition that could not be modified by either the user job or the operating system itself. Describe two difficulties that you think could arise with such a scheme.   
(c). What is the purpose of system calls? It is sometimes difficult to achieve a layered approach if two components of the operating system are dependent on each other. Identify a scenario in which it is unclear how to layer two system components that require tight coupling of their functionalities.   
(a). Describe the actions taken by a kernel to context-switch between processes. What are the benefits and the disadvantages of each of the following? Consider both the system level and the programmer level. i. Synchronous and asynchronous communication ii. Automatic and explicit buffering iii. Send by copy and send by reference iv. Fixed-sized and variable-sized messages   
(b). What are two differences between user-level threads and kernel-level threads Under what circumstances does a multithreaded solution using multiple kernel threads provide better performance than a single-threaded solution on a single-processor system?   
(c). A system with two dual-core processors has four processors available for scheduling. A CPU-intensive application is running on this system. All input is performed at program start-up, when a single file must be opened. Similarly, all output is performed just before the program terminates, when the program results must be written to a single file. Between start-up and termination, the program is entirely CPU-bound. Your task is to improve the performance of this application by multithreading it. The application runs on a system that uses the one-to-one threading model (each user thread maps to a kernel thread). i How many threads will you create to perform the input and output? Explain. ii. How many threads will you create for the CPU-intensive portion of the application? Explain.   
(a). Explain the difference between preemptive and non-preemptive scheduling. Consider the following set of processes, with the length of the CPU burst given in milliseconds: (table)... The processes are assumed to have arrived in the order P1, P2, P3, P4, P5, all at time 0. i. Draw four Gantt charts that illustrate the execution of these processes using the following scheduling algorithms: FCFS, SJF, non-preemptive priority (a larger priority number implies a higher priority), and RR (quantum = 2). ii. What is the turnaround time of each process for each of the scheduling algorithms in part a? iii. What is the waiting time of each process for each of these scheduling algorithms? iv. Which of the algorithms results in the minimum average waiting time (over all processes)?   
(b). Discuss how the following pairs of scheduling criteria conflict in certain settings. i. CPU utilization and response time ii. I/O device utilization and CPU utilization iii. Average turnaround time and maximum waiting time   
(a). Is it possible to have concurrency but not parallelism? Explain.   
(b). Explain why Java programs running on Android systems do not use the standard Java API and virtual machine. Original versions of Apple's mobile iOS operating system provided no means of concurrent processing. Discuss three major complications that concurrent processing adds to an operating system.   
(c). The following processes are being scheduled using a preemptive, priority-based, round-robin scheduling algorithm. (table)... Each process is assigned a numerical priority, with a higher number indicating a higher relative priority. The scheduler will execute the highest priority process. For processes with the same priority, a round-robin scheduler will be used with a time quantum of 10 units. If a process is preempted by a higher-priority process, the preempted process is placed at the end of the queue. i. Show the scheduling order of the processes using a Gantt chart. ii. What is the turnaround time for each process? iii. What is the waiting time for each process?   
(a) Why synchronization tools are needed to ensure concurrent access? How to solve the critical section problem using Peterson's solution?   
(b). What are mutex locks? State the solution to the critical section problem using mutex locks. Define liveness in process execution life cycle.   
(a). Write a formal definition of deadlock in a multithreaded application.   
(b). Illustrate and explain the resource-allocation graph, resource-allocation graph with deadlock, and resource-allocation graph with a cycle but no deadlock.   
(c). What are the side effects of preventing deadlock? Describe the data structures which must be maintained to implement the bänker's algorithm for deadlock avoidance.   
Session: 2018-19 (Mid Term Examination: July-December 2021)
What are the three main purposes of an operating system? We have stressed the need for an operating system to make efficient use of the computing hardware. When is it appropriate for the operating system to forsake this principle and to "waste" resources? Why is such a system not really wasteful?   
Identify several advantages and several disadvantages of open-source operating systems. Identify the types of people who would find each aspect to be an advantage or a disadvantage Describe some of the challenges of designing operating systems for mobile devices compared with designing operating systems for traditional PCs.   
What is the purpose of system calls? List five services provided by an operating system, and explain how cach creates convenience for users. In which cases would it be impossible foruser-level programs to provide these services? Explain your answer.   
Contrast and compare an application programming interface (API) and an application binary interface (ABI). Explain why Java programs running on Android systems do not use the standard Java API and virtual machine.   
Session: 2018-19 (Final Examination)
(a) What are the three main purposes of an operating system? How does the distinction between kernel mode and user mode function as a rudimentary form of protection (security)?   
(b) We have stressed the need for an operating system to make efficient use of the computing hardware. When is it appropriate for the operating system to forsake this principle and to "waste" resources? Why is such a system not really wasteful?   
(c) What is the purpose of system calls? What are the two models of inter-process communication? What are the strengths and weaknesses of the two approaches?   
(d) describe three general methods for passing parameters to the operating system What is the main advantage of the microkernel approach to system design? How do user programs and system services interact in a microkernel architecture? What are the disadvantages of using the microkermel approach?   
(a) Define process. Give an example of a situation in which ordinary pipes are more suitable than named pipes and an example of a situation in which named pipes are more suitable than ordinary pipes   
(b) Draw and describe the diagram of process state. Describe the actions taken by a kernel to context-switch between processes. Define data and task parallelism. Describe about different multithreading models.   
(c) Define thread. Show the concurrent execution on a single-core system and parallel multicore system. Using Amdahl's Law, calculate the speedup gain of an application that has a 60 percent parallel component for r two processing cores and ( four processing cores.   

3. Consider a variant of the RR scheduling algorithm in which the entries in the ready queue are pointers to the PCBS What would be the effect of putting two pointers to the same process in the ready queue What would be two major advantages and two disadvantages of this scheme How would you modify the basic RR algorithm to achieve the same effect without the duplicate pointers?   

Suppose that the following processes arrive for execution at the tunes indicated. Each process will run for the amount of time listed. In answering the questions, use nonpreemptive scheduling, and base all decisions on the information you have at the time the decision must be made (table)... What is the average turnaround time for these processes with the FCFS scheduling algorithm? What is the average turnaround time for these processes with the SJF scheduling algorithm? The SJF algorithm is supposed to improve performance, but notice that we chose to run process Pl at time 0 because we did not know that two shorter processes would arrive soon. Compute what the average turnaround time will be if the CPU is left idle for the first 1 unit and then SJF scheduling is used. Remember that processes PI and P2 are waiting during this idle time, so their waiting time may increase. This algorithm could be called future-knowledge scheduling.   
Consider the following set of processes, with the length of the CPU burst given in milliseconds: (table)... The processes are assumed to have arrived in the order P1, P2, P3, P4, P5, all at time 0 iDraw four Gantt charts that illustrate the execution of these processes using the following scheduling algorithms: FCFS, SJF, nonpreemptive priority (a larger priority number implies a higher priority), and RR (quantum=2). What is the turnaround time of each process for each of the scheduling algorithms in part a? What is the waiting time of each process for each of these scheduling algorithms? Which of the algorithms results in the minimum average waiting time (over all processes)?   
(a) How to arise data inconsistency in concurrent access? What is critical-section problem? Explain the requirements which must be satisfied to solve the critical-section problem   
(b) Mention the limitation of Peterson's solution for addressing the critical section problem. What are mutex locks? State the solution to the critical section problem using mutex locks.   
(c) State the effect of liveness failure in the process execution life cycle. Write a formal definition of deadlock in a multithreaded application. Point out the necessary conditions, which hold simultaneously in a system, for deadlock situation.   
7. (a) Illustrate and explain the resource-allocation graph, resource-allocation graph with deadlock, and resource-allocation graph with a cycle but no deadlock.   
(b) Describe the data structures which must be maintained to implement the banker's algorithm for deadlock avoidance. How to detect deadlock in a system with only a single instance of each resource type?   
(a) Define and demonstrate the dining-philosophers problem as a synchronization problem. State the semaphore and monitor solutions of the dining-philosophers problem.   
(b) For improving the utilization of the CPU and the speed of the computer's response to its users, list various ways to manage memory in the operating system. Distinguish logical and physical addresses, and mention the function of the memory management unit, MMU, for generating addresses.   
(c) What is paging? Explain and illustrate the paging model of logical and physical memory, and paging example for a 32-byte memory with 4-byte pages.   
Session: 2019-20 (Final Examination July-December/2022)
(a) Define operating system. Identify services provided by an operating system.   
(b) What is system call? Illustrate how system calls are used to provide operating system services.   
(c) Why applications are operating system specific? Identify the separate components of a process and illustrate how they are represented and scheduled in an operating system.   
(d) Define process. Describe how processes are created and terminated in an operating system, including the appropriate system calls that perform these operations.   
(a) What is process control block (PCB)? Describe and contrast inter-process communication using shared memory and message passing.   
(b) Define thread. Identify the basic components of a thread, and contrast threads and processes.   
(c) Draw multi-threading models. Describe the major benefits and significant challenges of designing multi-threaded processes.   
(d) Describe about Java Threads. Illustrate different approaches to implicit threading, including thread pools, fork-join, and Grand Central Dispatch.   
(a) Define cooperating process. Develop a model of a system consisting of cooperating sequential process or threads with the producer-consumer problem.   
(b) i) What is critical-section problem? Explain the requirements which must be satisfied to solve the critical-section problem. Review the limitations of semaphore solution to the critical section problem.   
3. (b) ii) Explain the strategy, high-level synchronization construct-the monitor type, for dealing with such errors.   
(c) What is spinlock? State the effect of liveness failure in the process execution life cycle.   
(a) Write a formal definition of deadlock in a multithreaded application. Point out the necessary conditions, which hold simultaneously in a system, for deadlock situation.   
(b) Illustrate and explain the resource-allocation graph, resource-allocation graph with deadlock, and resource-allocation graph with a cycle but no deadlock. How to detect deadlock in a system? Illustrate and explain the data structures, which must be inaintained. process, and example of the deadlock detection algorithm with several instances of each resource type.   
(a) Formulate the readers-writers problem as a classical synchronization problem. Discuss the solution of the problem using binary and mutex semaphore.   
(b) Define and demonstrate the dining-philosophers problem as a synchronization problem. State the semaphore and monitor solutions of the dining-philosophers problem.   
5. (c) Describe a mechanism for enforcing memory protection in order to prevent a program from modifying the memory associated with other programs   
5. (d) Compare and contrast monolithic, layered, Microkernel, modular, and hybrid strategies for designing operating systems.   
(a) Why CPU scheduling needed? Describe various CPU scheduling algorithms.   
(b) Suppose that the following processes arrive for execution at the times indicated. Each process will run for the amount of time listed. In answering the questions, use nonpreemptive scheduling, and base all decisions on the information you have at the time the decision must be made. (table)... i) What is the average turnaround time for these processes with the FCFS scheduling algorithm? ii) What is the average turnaround time for these processes with the SJF scheduling algorithm? iii) The SJF algorithm is supposed to improve performance, but notice that we chose to run process P1 at time 0 because we did not know that two shorter processes would arrive soon. Compute what the average turnaround time will be if the CPU is left idle for the first 1 unit and then SJF scheduling is used. Remember that processes Pl and P2 are waiting during this idle time, so their - waiting time may increase. This algorithm could be called future-knowledge scheduling.   
(c) What is dispatcher? Explain the issues related to multiprocessor and multicore scheduling.   

6. (d) Consider the following set of processes, with the length of the CPU burst given in milliseconds: (table)... The processes are assumed to have arrived in the order P1, P2, P3, P4, P5,-all at time 0. i) Draw four Gantt charts that illustrate the execution of these processes using the following scheduling algorithms: FCFS, SJF, nonpreemptive priority (a larger priority number implies a higher priority), and RR (quantum = 2). ii) What is the turnaround time of each process for each of the scheduling algorithms in part a? iii) What is the waiting time of each process for each of these scheduling algorithms? iv) Which of the algorithms results in the minimum average waiting time (over all processes)?   

Session: 2020-21 (Final Examination July-December/2023)
(a) Describe the general organization of a computer system and the role of interrupts. Describe the components in a modern multiprocessor computer system.   
(b) Illustrate the transition from user mode to kernel mode. How does the distinction between kernel mode and user mode function as a rudimentary form of protection (security)?   
1. (c) Compare and contrast monolithic, layered, microkernel, modular, and hybrid strategies for designing operating systems.   
(d) Identify several advantages and several disadvantages of open-source operating systems. Identify the types of people who would find each aspect to be an advantage or a disadvantage.   

2. (a) Identify the separate components of a process and illustrate how they are represented and scheduled in an operating system.   

(b) Define remote procedure calls. Describe and contrast interprocess communication using shared memory and message passing.   
(c) Identify the basic components of a thread, and contrast threads and processes. Describe the major benefits and significant challenges of designing multithreaded processes.   
(d) What resources are used when a thread is created? How do they differ from those used when a process is created? Illustrate different approaches to implicit threading, including thread pools, fork-join, and Grand Central Dispatch.   
(a) Describe various CPU scheduling algorithms. Assess CPU scheduling algorithms based on scheduling criteria.   
(b) Explain the difference between preemptive and nonpreemptive scheduling. Explain the issues related to multiprocessor and multicore scheduling.   
(c) The following processes are being scheduled using a preemptive, priority-based, round-robin scheduling algorithm. (table)... Each process is assigned a numerical priority, with a higher number indicating a higher relative priority. The scheduler will execute the highest priority process. For processes with the same priority, a round-robin scheduler will be used with a time quantum of 10 units. If a process is preempted by a higher priority process, the preempted process is placed at the end of the queue. i. Show the scheduling order of the processes using a Gantt chart. ii. What is the turnaround time for each process? iii. What is the waiting time for each process?   
(a) What causes data inconsistency during concurrent access? What is the critical-section problem? Explain the requirements that must be met to solve the critical section problem.   
(b) Mention the limitation of Peterson's solution for addressing the critical section problem. State the solution to the critical section problem using mutex locks. Review the limitations of semaphore solution to the critical section problem. Explain the strategy, high-level synchronization construct- the monitor type, for dealing with such errors.   

(c) What is spinlock? State the effect of liveness failure in the process execution life cycle.   

(a) What is a system model? Define deadlock with a multithreaded application example. Point out the necessary conditions, which hold simultaneously in a system, for a deadlock situation.   
(b) List the methods for handling deadlock. Mention the possible side effects of preventing deadlock. What is deadlock avoidance? Illustrate safe, unsafe, and deadlocked state spaces with an example.   
(c) How to detect deadlock in a system? Illustrate and explain the data structures, which must be maintained, the process, and an example of the deadlock detection algorithm with several instances of each resource type.   
(a) Define and demonstrate the dining-philosophers problem as a synchronization problem. State the semaphore and monitor solutions of the dining-philosophers problem.   
(b) Distinguish logical versus physical address space. What is a memory management unit? Explain the paging process, a memory-management scheme that permits a process's physical address space to be noncontiguous.   
(c) What is the purpose of system calls? What system calls have to be executed by a command interpreter or shell in order to start a new process on a UNIX system?   
(d) Why do some systems store the operating system in firmware, while others store it on disk? Describe three general methods for passing parameters to the operating system.   