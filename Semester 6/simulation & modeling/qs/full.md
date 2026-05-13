### **Mid-Term Examination, July-December-2023 (Program: B. Sc. Engg.(CSE), Session: 2020-21)**

1. Distinguish between analytical solution and simulation. (02)
2. Explain the problem statement of simulation of a single server queuing system. (05)
3. A drunkard moved from a point to a destination and takes step in four directions, backward, forward, right, and left. The probabilities associated with these are 15%, 40%, 20% and 25% respectively. The distances covered to backward, forward, right, and left are 50 cm, 90 cm, 60 cm and 40 cm respectively. Simulate the walk for 20 steps and find the location at end of 20 steps while starting point is (0, 0) on the X-Y scales. [USE Random Number 67, 23, 01, 95, 84, 56, 77, 76, 18, 82, 45, 29, 68, 21, 15, 86, 00, 89, 45] (04)
4. Define Monte-Carlo method. Solve the integrals $I = \int_{1}^{5} \frac{x^4}{3} dx$ by monte-carlo method. [USE Random Number 48, 36, 44, 41, 46, 18, 32, 41, 23, 23 for X coordinate and Random Number .52, .18, .30, .88, .21, .25, .57, .82, .9, .63 for Y coordinate, you have a right to do scaling, if required] (04)

### **Midterm Examination, July-December-2023 (Program: B. Sc. Engg.(CSE), Session: 2020-21, Sessional)**

**SET-A**

1. A six-sided die rolled and produces random numbers 1 to 6. Simulate the Gambling Game with six-sided die rolled in odd trail is treated as H and even trail as T. When the differences between H and T will 20 game over. It costs 1 dollar in each trail. Use Monte Carlo Method and analyze profit-loss. (08)
2. A flying object moves randomly. It moves L, R, F and B in 25%, 35%, 30% and 10% probability. It also has 80% upward and 20% downward tendency. Identify the location of flying object after 50 epochs by Monte Carlo Method. (08)

**SET-B**
3. Write a program that performs a simple M/M/1 queue simulation. This program requires parameters for the Mean Inter Arrival time of customers, Mean Service time as well as the maximum number of customers. The simulation is started with a single-server queue with a FIFO queuing discipline. For M/M/1 queue, the customer inter-arrival time and the service time are both exponentially distributed. This simulation shows the Average delay in queue, Average number in queue, Server utilization, and Time simulation ended. (07)

### **Final Examination of B.Sc. Engg.(CSE), July-December/2023, Session: 2020-21**

1. a. Define simulation with example. Demonstrate different ways in which a system might be studied. Explain the next-event time-advance approach illustrated for the single-server queueing system. (05)
b. Consider a single-server queuing system, there are several IID random variables interarrival times, service times, and customer delays. Describe the problem statement of the single-server queuing system. (05)
c. What is an inventory system? Formulate a simulation of an inventory system in which many of the elements are representative of those found in the actual inventory system. (04)
2. a. Define random variable. How to compute variance, covariance, and correlation for simulation study? Why stochastic process is used to simulate the output data. Illustrate correlation function of the process of delays in queue D1, D2, .....for the M/M/1 queue. (05)
b. Define verification, validation, and credibility in simulation model. Illustrate the timing relationship of validation, verification, and establishing credibility. (05)
c. Describe the eight methods for debugging a simulation model's computer program. (04)
3. a. Write down the properties of the location, scale, and shape parameters of continuous distributions. State the relevant information (application, density function, parameters, and density curve) for the simulation modeling application of the normal continuous distribution. (05)
b. Many random number generators in use today are linear congruential generators, LCGs. Discuss how to obtain the desired random numbers from LCGs? What is the inverse transform function? Let X have an exponential distribution with a mean $\beta$. Generate the desired random variate using the inverse transform function. (06)
c. What is the necessity of statistical analysis with simulation output data? Describe and illustrate the transient and steady-state behaviors of a stochastic process. (03)
4. a. Define computer simulation models. Describe the steps in simulation study. (02)
b. A machine center has three identical bearings, which fail according to the following probability distribution in table A. The present maintenance policy is to change a bearing as and when it fails. When bearing fails machine center stops, a technician is called to replace the failed bearing with a new one. The time between the failure of the bearing and reporting of the technician (delay time) is random and is distributed as table B.

| Bearing Life(Hours) | Probability |
|---|---|
| 1200 | 0.10 |
| 1400 | 0.25 |
| 1600 | 0.30 |
| 1800 | 0.25 |
| 2000 | 0.10 |

| Delay Time(Minutes) | Probability |
|---|---|
| 2 | 0.3 |
| 5 | 0.5 |
| 8 | 0.2 |

It takes 15 minutes to change one bearing, 25 minutes to change two bearing and 35 minutes to change all three bearings. Downtime of the system costs $5 per minutes, direct on job costs of the technician is $30 per hour and the cost of bearing is $30. The maintenance department is interested in evaluating an alternative policy of replacing all the three bearings, whenever a bearing fails. Simulate the present and proposed policy for 10000 hours and choose the better policy. (10)
c. What is normally distributed random numbers? Describe the properties and applications of normally distributed random numbers. (02)
5. a. Write down the qualities of an efficient random number generator. Use mixed congruential method to generate the following sequence of random numbers, A sequence of 10 two digit random numbers such that $r_{n+1} = (19r_n + 1) \text{modulo} 23$; Take $r_0 = 1$. [Take seed values yourself] (03)
b. Define Monte-Carlo method. Solve the integrals $I = \int_{1}^{5} \frac{x^4}{3} dx$ by monte-carlo method. [USE Random Number 48, 36, 44, 41, 46, 18, 32, 41, 23, 23 for X coordinate and Random Number .52, .18, .30, .88, .21, .25, .57, .82, .9, .63 for Y coordinate, you have a right to do scaling, if required] (04)
c. There are a number of moving objects, which chase each other in a serial order like A chases B, B chases C, and C chases D etc. Each object moves towards its target unmindful of the fact that it itself is being targeted by some other object. Depending upon the original location, and speed of motion of the object, each object will take its own time to hit its target. As soon as hit occurs, the chase ends. The initial location of the objects A, B, C, and D are (0,0), (0,10), (0,20), (0,30) respectively and their velocities are 30km/hr, 25km/hr, 20 km/hr and 15km/hr respectively. Object D moves towards a fixed at (30,50), while C moves always in a direction pointing towards D, the object B moves always pointing towards C and object A always pointing towards B. It can be assumed that when the distance between two objects less than 0.005 hit is taken to occur. Identify, which object will hit the target at first and in what time? (07)
6. a. What are the differences between true and pseudo random numbers? Describe the procedure to physically generate random number at the interval with two-digit accuracy. (02)
b. A sequence of 10,000 five digit random numbers has been generated, and an analysis of numbers indicate that there 3075 numbers having five different digits, 4935 having a pair, 1135 having two pairs, 695 having three of a kind, 105 having full house, 54 having four of a kind and one having all five of a kind. Use Poker test to determine if these random numbers are independent at $\alpha = 0.01$. Note that for $\alpha= 0.01$ and N=06 the critical value is 16.8. (06)
c. An ammunition depot, of rectangular shape measuring 500 m of length and 350m of width is under attack by a squadron of bombers. In each sortie 10 bombers drop bombs, one each, on the ammunition depot. If the bomb lands anywhere in the marked area, it is a hit, otherwise it is a miss. All the bombers aim at the center of the area. The point of strike is assumed to be normally distributed around the aiming point with a standard deviation of 500 m in x-direction and 350m in the y-direction. Simulate operation of bombing operation for 20 strikes and determine the percentage number of strikes, which are on the target.
Use Normal Random Number:
For X direction - [.23, -1.16, 0.39, -1.90, -0.78, -0.02, -0.40, -0.66, 1.14, 0.07, 0.53, 0.03, 1.19,0.11, 0.16, -0.82, 0.42, -0.89, 0.49, -0.21]
For Y direction- [0.24, -0.02, 0.64, -1.04, 0.68, -0.47, -0.75, -0.44, 1.21, -0.08, -1.56, 1.49, -1.19, -1.86, 1.21, 0.75, -1.50, 0.19, -1.44, 0.65] (06)

### **Final Examination: July-December 2023, Sessional (Course Code: CIT 324)**

**Section A**

1. You are tasked with generating pseudo-random numbers using the Mid-Square Method and using those numbers to perform the Kolmogorov-Smirnov (K-S) test for uniformity. Start with a 4-digit seed (e.g., 5731). (10)
2. You are tasked with evaluating the quality of a random number generator using the Multiplicative Congruential Method (MCM) and verifying its uniformity using the Chi-Square goodness-of-fit test. (10)
3. You are tasked with analyzing the randomness of a sequence of numbers generated using the Additive Congruential Method (ACM). To evaluate the independence of these random numbers, you will implement a Chi-Square test for autocorrelation. (10)
4. Implement the Poker Test to assess the randomness of numbers generated by a Multiplicative Congruential Generator (MCG). (10)

**Section B**
5. You are tasked with simulating a mobile robot that follows a predefined path using the Pure Pursuit algorithm. The robot should start at an initial position and navigate towards a sequence of waypoints using the pure pursuit strategy. Your solution must include a real-time animation of the robot moving along the path. (20)
6. You are tasked with simulating the chemical reaction between hydrogen (H2) and oxygen (O2) to form water (H2O). The balanced chemical reaction is: 2H2 + O2 -> 2H2O. Given an initial amount of hydrogen (h2_molecules) and oxygen (o2_molecules), simulate the reaction until no more water can be formed (i.e., one or both reactants are exhausted). Then, determine the equilibrium state - the remaining molecules of hydrogen, oxygen, and water. Your task is to: 1. Simulate the reaction in Python. 2. Output the number of remaining hydrogen, oxygen, and the amount of water formed when the reaction stops (reaches equilibrium). (20)
7. In the Serial Chase Problem, multiple entities (such as agents, cars, or robots) are positioned on a circular path. Each entity is programmed to chase the next one in the sequence, forming a closed loop. Each chaser always moves directly toward its target at a constant speed. Task: Write a simulation program to model the Serial Chase Problem for n entities placed evenly on a 2D circular path. Your simulation should: 1. Initialize n entities equally spaced on a unit circle. 2. Each entity should continuously move toward the next one (e.g., entity 1 chases entity 2, entity 2 chases entity 3, ..., and entity n chases entity 1). 3. Update positions using a small time step $\Delta t$ and simulate until all entities converge to a single point or until a maximum number of iterations is reached. 4. Display or output the trajectories of each entity. 5. (Optional) Visualize the simulation using a plotting library. (20)
8. A machine center has three identical bearings, which fail according to the following probability distribution in table A. The present maintenance policy is to change a bearing as and when it fails. When bearing fails machine center stops, a technician is called to replace the failed bearing with a new one. The time between the failure of the bearing and reporting of the technician (delay time) is random and is distributed as table B.

| Bearing Life(Hours) | Probability |
|---|---|
| 1200 | 0.10 |
| 1400 | 0.25 |
| 1600 | 0.30 |
| 1800 | 0.25 |
| 2000 | 0.10 |

| Delay Time(Minutes) | Probability |
|---|---|
| 2 | 0.3 |
| 5 | 0.5 |
| 8 | 0.2 |

It takes 15 minutes to change one bearing, 25 minutes to change two bearing and 35 minutes to change all three bearings. Downtime of the system costs $5 per minutes, direct on job costs of the technician is $30 per hour and the cost of bearing is $30. The maintenance department is interested in evaluating an alternative policy of replacing all the three bearings, whenever a bearing fails. Simulate the present and proposed policy for 10000 hours and choose the better policy. (20)

**Section C**
9. Write a program that performs a simple M/M/1 queue simulation. This program requires parameters for the Mean Inter Arrival time of customers, the Mean Service time as well as the maximum number of customers. The simulation starts with a single-server queue with a FIFO queuing discipline. For M/M/1 queue, the customer inter-arrival time and the service time are both exponentially distributed. This simulation shows Average delay in queue, Average number in queue, Server utilization, and Time simulation ended. (10)
10. LCG is considered one of the basic yet best methods to generate Pseudo-Random Numbers. Write a program that generates a random number using the LCG. (10)

**Section D**
11. There were a few waves in the COVID-19 pandemic. Let a wave occur every 100 days in Bangladesh, on average. After a wave occurs, find the probability using the Exponential distribution that it will take more than 120 days for the next wave to occur. Simulate several Exponential distributions using rate parameters 0.5, 1.0, 2.0, and 4.0. (10)
12. There are several general approaches to generating a univariate Random Variable from the distribution function. Write a program that generates the desired number of random variates using the inverse transform function. (20)
13. Viva-Voce (20)

### **Midterm Examination of B.Sc. Engg.(CSE), July-Decem.2022, Session: 2019-20**

1. Define the following terminologies: i) System ii) Model iii) Simulation iv) Analytical solution. Demonstrate different ways in which a system might be studied. (03)
2. What are the steps of simulation for a single-server queueing system? Describe the problem statement and intuitive explanation of a single-server queueing system. (05)
3. Write down the difference between monte-carlo and stochastic simulation. (02)
4. A drunkard moved from a point to a destination and takes step in four directions, backward, forward, right, and left. The probabilities associated with these are 10%, 50%, 15% and 25% respectively. The distances covered to backward, forward, right, and left are 30 cm, 80 cm, 60 cm and 40 cm respectively. Simulate the walk for 20 steps and find the location at end of 20 steps while starting point is (0, 0) on the X-Y scales. [USE Random Number 67, 23, 01, 95, 84, 56, 77, 76, 18, 82, 45, 55, 29, 68, 21, 15, 86, 00, 89, 43] (05)

### **Mid-Term Examination, July-December-2021, Session: 2018-19**

1. A drunkard moved from a point to a destination and takes step in four directions, backward, forward, right, and left. The probabilities associated with these are 10%, 50%, 15% and 25% respectively. The distances covered to backward, forward, right, and left are 30 cm, 80 cm, 60 cm and 40 cm respectively. Simulate the walk for 20 steps and find the location at end of 20 steps while starting point is (0, 0) on the X-Y scales. [USE Random Number 1 to 20 from table] (05)
2. An ammunition depot, of rectangular shape measuring 500 m of length and 350m of width is under attack by a squadron of bombers. In each sortie 10 bombers drop bombs, one each, on the ammunition depot. If the bomb lands anywhere in the marked area, it is a hit, otherwise it is a miss. All the bombers aim at the center of the area. The point of strike is assumed to be normally distributed around the aiming point with a standard deviation of 500 m in x-direction and 350m in the y-direction. Simulate operation of bombing operation for 20 strikes and determine the percentage number of strikes, Which are on the target. [USE Random Number 21 to 40 for X coordinate and Random Number 41 to 60 for Y coordinate, from table] (05)
3. Define Monte-Carlo method. Solve the integrals $I = \int_{2}^{5} x^3 dx$ by monte-carlo method. [USE Random Number 61 to 70 for X coordinate and Random Number 71 to 80 for Y coordinate, from table] (05)

### **Mid-Term Examination, July-December-2020, Session: 2017-18**

1. Define system simulation. Describe different types of simulation models. (03)
2. What are the advantages of simulation? Describe about the applied area of simulation. (02)
3. A drunkard moved from a point to a destination and takes step in three directions, forward, backward, left and right. The probabilities associated with these are 40%, 15%, 22% and 23% respectively. The distances covered to forward, left and right are 75 cm, 45 cm, 60 cm and 60 cm respectively. Simulate the walk for 25 steps and find the location at end of 25 steps while starting point is (0, 0) on the X-Y scales. [USE RN 67, 23, 01, 62, 84, 56, 77, 76, 98, 82, 45, 87, 29, 68, 21, 15, 36, 00, 89, 43, 15, 56, 89, 43, 32] (05)
4. Define Monte-Carlo method. Solve the integrals $I = \int_{2}^{5} x^3 dx$ by monte-carlo method. [USE Random Number 22, 25, 18, 45, 15, 27, 48, 43, 40, 47 for X coordinate and Random Number .57, .18, .00, .90, .05, .77, .66, .10, .76, .42 for Y coordinate, from table] (05)

### **Mid-Term Examination, July-December-2018, Session: 2015-16**

1. Define system simulation. Describe different types of simulation models. (03)
2. What are the advantages of simulation? Describe about the applied area of simulation. (02)
3. A drunkard moved from a point to a destination and takes step in four directions, forward, backward, left and right. The probabilities associated with these are 40%, 15%, 22% and 23% respectively. The distances covered to forward, left and right are 75 cm, 45 cm, 60 cm and 60 cm respectively. Simulate the walk for 25 steps and find the location at end of 25 steps while starting point is (0, 0) on the X-Y scales. [USE RN 67, 23, 01, 62, 84, 56, 77, 76, 98, 82, 45, 87, 29, 68, 21, 15, 36, 00, 89, 43, 32] (05)
4. Consider a chemical reaction of two gas $H_2$ and $O_2$ react to produce $H_2O$. The rate of the reaction is depending upon the ratio in which $H_2$ and $O_2$ are mixed and some other factor like temperature, pressure and humidity which remains constant during the reaction. There will also happen backward reaction where $H_2O$ decomposes back into $H_2$ and $O_2$. If $C_1$, $C_2$ and $C_3$ are the amount of $H_2, O_2 \text{and } H_2O$ at any instant of time t, the rate of increase of $H_2, O_2 \text{and } H_2O$ are given by the following differential equations:
$\frac{dC_1}{dt} = K_2C_3 - K_1C_1C_2$
$\frac{dC_2}{dt} = K_2C_3 - K_1C_1C_2$
$\frac{dC_3}{dt} = 2K_1C_1C_2 - 2K_2C_3$
Where $K_1$ and $K_2$ are constants. If $K_1=0.025; K_2=0.01 \text{ and at time } t=0, C_1=50.00 m^3, C_2=25.00 m^3, C_3=0.00 m^3, \Delta t=0.2 \text{ minute}$. Simulate the experiment for 3 minute to determine the amount of $H_2, O_2 \text{and } H_2O$. (05)

### **Final Examination, July-December-2021, Session: 2018-19**

1. a. Define the following terminologies: i) System ii) Model iii) Simulation iv) Analytical solution. Demonstrate different ways in which a system might be studied. (04)
b. What are the steps of simulation for a single-server queueing system? Describe the problem statement and intuitive explanation of a single-server queueing system. (10)
2. a. What is random variable? Compute variance and covariance based on a set of random variates. Why stochastic process is used to simulate the output data? Illustrate correlation function of the process of delays in queue D1, D2, .....for the M/M/1 queue. (07)
b. Explain hypothesis testing including null and alternative hypothesis for mean. What is the difference type I error and type II error? Explain and illustrate the strong law of large number. (07)
3. a. Write the properties of location, scale, and shape parameters of continuous distributions. What is inverse transform function? Let X have the exponential distribution with mean $\beta$. Generate the desired random variate using the inverse transform function. (07)
b. What is Monte Carlo Method? Write down the difference between monte-carlo and stochastic simulation. (02)
c. Define Monte-Carlo method. Solve the integrals $I = \int_{1}^{5} \frac{x^4}{3} dx$ by monte-carlo method. [USE Random Number 48, 36, 44, 41, 46, 18, 32, 41, 23, 23 for X coordinate and Random Number .52, .18, .30, .88, .21, .25, .57, .82, .9, .63 for Y coordinate, you have a right to do scaling, if required] (05)
4. a. Define computer simulation models. Write down the qualities of an efficient random number generator. (02)
b. A machine center has three identical bearings, which fail according to the following probability distribution in table A. The present maintenance policy is to change a bearing as and when it fails. When bearing fails machine center stops, a technician is called to replace the failed bearing with a new one. The time between the failure of the bearing and reporting of the technician (delay time) is random and is distributed as table B.

| Bearing Life(Hours) | Probability |
|---|---|
| 1200 | 0.10 |
| 1400 | 0.25 |
| 1600 | 0.30 |
| 1800 | 0.25 |
| 2000 | 0.10 |

| Delay Time(Minutes) | Probability |
|---|---|
| 2 | 0.3 |
| 5 | 0.5 |
| 8 | 0.2 |

It takes 15 minutes to change one bearing, 25 minutes to change two bearing and 35 minutes to change all three bearings. Downtime of the system costs $5 per minutes, direct on job costs of the technician is $30 per hour and the cost of bearing is $30. The maintenance department is interested in evaluating an alternative policy of replacing all the three bearings, whenever a bearing fails. Simulate the present and proposed policy for 10000 hours and choose the better policy. (10)
c. What is normally distributed random numbers? Describe the properties and applications of normally distributed random numbers. (02)
5. a. Define the simulation of continuous system. Describe the disadvantages of analog simulation.
b. There are a number of moving objects, which chase each other in a serial order like A chases B, B chases C, and C chases D etc. Each object moves towards its target unmindful of the fact that it itself is being targeted by some other object. Depending upon the original location, and speed of motion of the object, each object will take its own time to hit its target. As soon as hit occurs, the chase ends. The initial location of the objects A, B, C, and D are (0,0), (0,10), (0,20), (0,30) respectively and their velocities are 30km/hr, 25km/hr, 20 km/hr and 15km/hr respectively. Object D moves towards a fixed at (30,50), while C moves always in a direction pointing towards D, the object B moves always pointing towards C and object A always pointing towards B. It can be assumed that when the distance between two objects less than 0.005 hit is taken to occur. Identify, which object will hit the target at first and in what time? (10)
c. Why the random numbers generated by computer are called pseudo random numbers? Discuss the pitfalls of congruence method of generating random numbers. (02)
6. a. Define random variables. What are the purposes of testing the uniformity and independence of random values? (02)
b. i. A sequence of 100 random numbers is given below. Use Chi-Square test with $\alpha = 0.05$ to test these numbers are uniformly distributed. (12)

| | | | | | | | | | |
|---|---|---|---|---|---|---|---|---|---|
| 21 | 81 | 92 | 28 | 96 | 20 | 68 | 52 | 79 | 84 |
| 82 | 62 | 12 | 08 | 92 | 83 | 74 | 85 | 60 | 49 |
| 48 | 37 | 65 | 74 | 22 | 11 | 28 | 10 | 55 | 82 |
| 72 | 95 | 08 | 85 | 79 | 95 | 86 | 11 | 16 | 52 |
| 70 | 55 | 50 | 87 | 67 | 51 | 72 | 38 | 29 | 62 |
| 71 | 12 | 07 | 75 | 56 | 34 | 40 | 67 | 24 | 86 |
| 18 | 82 | 41 | 29 | 63 | 06 | 84 | 01 | 20 | 06 |
| 06 | 33 | 14 | 79 | 25 | 65 | 57 | 47 | 74 | 68 |
| 54 | 35 | 81 | 07 | 88 | 96 | 70 | 85 | 29 | 13 |
| 12 | 91 | 26 | 57 | 30 | 22 | 90 | 03 | 13 | 31 |

ii. Define autocorrelation. Test the autocorrelation of the given numbers (6(b)i) by employing the chi-squared test with 99% confidence level.

### **Final Examination of B.Sc. Engg. CSE July-December/2020, Session: 2017-18**

1. (a) Define computer simulation models. Describe the steps in simulation study. (02)
(b) A drunkard moved from a point to a destination and takes step in four directions, backward, forward, right, and left. The probabilities associated with these are 10%, 50%, 15% and 25% respectively. The distances covered to backward, forward, right, and left are 30 cm, 80 cm, 60 cm and 40 cm respectively. Simulate the walk for 20 steps and find the location at end of 20 steps while starting point is (0, 0) on the X-Y scales.[Use Random Number: 6, 2, 0, 6, 2, 8, 5, 7, 7, 9, 8, 4, 8, 2, 6, 2, 1, 3, 0, 8, 4] (06)
(c) An ammunition depot, of rectangular shape measuring 500 m of length and 350m of width is under attack by a squadron of bombers. In each sortie 10 bombers drop bombs, one each, on the ammunition depot. If the bomb lands anywhere in the marked area, it is a hit, otherwise it is a miss. All the bombers aim at the center of the area. The point of strike is assumed to be normally distributed around the aiming point with a standard deviation of 500 m in x-direction and 350m in the y-direction. Simulate operation of bombing operation for 20 strikes and determine the percentage number of strikes, Which are on the target. Use Normal Random Number:
For X direction - [.23, -1.16, 0.39, -1.90, -0.78, -0.02, -0.40, -0.66, 1.14, 0.07, 0.53, 0.03, 1.19,0.11, 0.16, -0.82, 0.42, -0.89, 0.49, -0.21]
For Y direction- [0.24, -0.02, 0.64, -1.04, 0.68, -0.47, -0.75, -0.44, 1.21, -0.08, -1.56, 1.49, -1.19, -1.86, 1.21, 0.75, -1.50, 0.19, -1.44, 0.65] (06)
2. (a) Describe the iterative process of verification and validation of simulation models. (02)
(b) Define the following terminologies: (i) Arrival rate (ii) Service rate (02)
(c) In a pure pursuit, there is a target bombers which moves along a predetermine path (given on table below) and there is a pursuer aircraft who follows the target bombers, redirecting itself towards the target bombers at fixed intervals of time.
Target bombers moving path:

| Time, t | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
|---|---|---|---|---|---|---|---|---|---|
| xb(t) | 160 | 161 | 167 | 172 | 181 | 189 | 199 | 215 | 239 |
| yb(t) | 0 | 4 | 9 | 11 | 14 | 24 | 34 | 41 | 52 |

| Time, t | 9 | 10 | 11 | 12 | 13 | 14 | 15 |
|---|---|---|---|---|---|---|---|
| xb(t) | 245 | 254 | 265 | 271 | 289 | 293 | 300 |
| yb(t) | 45 | 41 | 36 | 39 | 34 | 28 | 12 |

The fighter aircraft following the enemy bombers with speed at 30KM/min to destroy it. The fighter aircraft is at position xf, yf (100, 50) when it sights the bomber that is at time t=0, the time at which the pursuit begins. The fighter corrects its direction after a fixed interval of one minute, so as to point towards a bomber and shoots the bomber by firing a missile as soon as it is within a distance of 12 KM. The pursuit ends. In case the bomber is not shot within 10 minutes of the pursuit, the pursuit is abandoned. Simulate the problem to determine the pursuit is end/abandoned. (10)
3. (a) Define distributed simulation. Write down the difference between monte-carlo and stochastic simulation. (4)
(b) Consider a chemical reaction of two gas $H_2$ and $O_2$ react to produce $H_2O$. The rate of the reaction is depending upon the ratio in which $H_2$ and $O_2$ are mixed and some other factor like temperature, pressure and humidity which remains constant during the reaction. There will also happen backward reaction where $H_2O$ decomposes back into $H_2$ and $O_2$. If $C_1$, $C_2$ and $C_3$ are the amount of $H_2, O_2 \text{and } H_2O$ at any instant of time t, the rate of increase of $H_2, O_2 \text{and } H_2O$ are given by the following differential equations:
$\frac{dC_1}{dt} = K_2C_3 - K_1C_1C_2$
$\frac{dC_2}{dt} = K_2C_3 - K_1C_1C_2$
$\frac{dC_3}{dt} = 2K_1C_1C_2 - 2K_2C_3$
Where $K_1$ and $K_2$ are constants. If $K_1=0.025; K_2=0.01 \text{ and at time } t=0, C_1=50.00 m^3, C_2=25.00 m^3, C_3=0.00 m^3, \Delta t=0.2 \text{ minute}$. Simulate the experiment for 3 minute to determine the amount of $H_2, O_2 \text{and } H_2O$. (5)
(c) A sequence of 10,000 five digit random numbers has been generated, and an analysis of numbers indicate that there 3075 numbers having five different digits, 4935 having a pair, 1135 having two pairs, 695 having three of a kind, 105 having full house, 54 having four of a kind and one having all five of a kind. Use Poker test to determine if these random numbers are independent at $\alpha = 0.01$. Note that for $\alpha= 0.01$ and N=06 the critical value is 16.8. (5)
4. (a) What is normally distributed random numbers? Describe the application of normally distributed random numbers. (3)
(b) The following sequence of random numbers have been generated 0.037, 0.55, 0.71, 0.97, 0.65, 0.29, 0.84, 0.78, 0.23, 0.17; Use Kolmogorov-Smirnov test with $\alpha= 0.05$ to determine, If these numbers are uniformly distributed over the interval 0 to 1. Note that for $\alpha= 0.05$ and N=10 the critical value is 0.410. (5)
(c) Define analog simulation. Describe the simulation of an exterior ballistics with an example. (6)
5. (a) What is a stochastic process? Write the probability mass function of Poisson distribution. List several applications of Poisson distribution. (7)
(b) Write the density function of the normal curve. Generate ten random observations from Normal distribution with a mean 15 and standard deviation 5. (7)
6. (a) How to address the COVID-19 scenario using Exponential distribution. Illustrate the Exponential curves on the following scenarios: (i) Exponential growth and Exponential decay. (ii) Infection begins to taper off when herd immunity is reached. (iii) Confirmed cases will rise again if restrictions are lifted too soon. (7)
(b) What is the application of SIR model? Illustrate and state the general SIR schematic. Show and explain the maximum number of infected, $I_{max}$ and solution curves. (7)

### **Final Examination of B.Sc. Engg. (CSE), July-December 2019, Session 2016-17**

1. a) Define Simulation. Describe the applications of simulation in computer science. (2)
b) A drunkard moved from a point to a destination and takes step in four directions, forward, backward, to left and right. The probabilities associated with these are 40%, 10%, 25% and 25%. The distances covered in forward, backward, to left and right are 75 cm, 45 cm, 60 cm and 60 cm respectively. Simulate the walk for 20 steps and fond the location at end of 20 steps while starting point is (0,0) on the X-Y scales. [Use Random Number: 6,2,0,6,2,8,5,7,7,9,8,4,8,2,6,2,1,3,0,8,4] (5)
c) What is real time simulation? Describe the steps in simulation study. (2)
d) In the bombing problems, the ammunition depot area is a circle of 5000m radius. The point of impact is normally distributed around the aiming point with standard deviation of 500m in X direction and 300m in the Y direction. Simulate the bombing operation for 20 strike and find the percentage of strikes on target. Use Normal Random Number:
For X direction - [.23, -1.16, 0.39, -1.90, -0.78, -0.02, -0.40, -0.66, 1.14, 0.07, 0.53, 0.03, 1.19,0.11, 0.16, -0.82, 0.42, -0.89, 0.49, -0.21]
For Y direction- [0.24, -0.02, 0.64, -1.04, 0.68, -0.47, -0.75, -0.44, 1.21, -0.08, -1.56, 1.49, -1.19, -1.86, 1.21, 0.75, -1.50, 0.19, -1.44, 0.65] (5)
2. a. Let us consider a case where two chemicals $ch_1$ and $ch_2$ react to produce a third chemical $ch_3$. The rate of reaction will depend upon a large number of factors like the ratio in which $ch_1$ and $ch_2$ are mixed, the temperature, the pressure and the humidity etc. In addition to the forward reaction where $ch_1$ and $ch_2$ react to produce $ch_3$ , there may also be backward reaction, where the $ch_3$ decomposes back into $ch_1$ and $ch_2$. Let the rate of formation of $ch_3$ be proportional to the product of the amount of $ch_1$ and $ch_2$ present in the mixture and let the rate of decomposition of $ch_3$ be proportional to its amount in the mixture. If $c_1, c_2$ and $c_3$ are the amount of $ch_1, ch_2$ and $ch_3$ at any instant of time $t$, the rate of change of $c_1, c_2$ and $c_3$ are given by the following differential equations:
$\frac{dc_1}{dt} = k_2c_3 - k_1c_1c_2$
$\frac{dc_2}{dt} = k_2c_3 - k_1c_1c_2$
$\frac{dc_3}{dt} = 2k_1c_1c_2 - 2k_2c_3$
Where $k_1$ and $k_2$ are constants. If the temperature, pressure and humidity are constant and have no effect on the rate of reaction and $k_1 = 0.025, k_2 = 0.01, c_1 = 50.00, c_2 = 25.00, c_3 = 0.00 \text{ and } \Delta_t = 1 \text{ sec}$; simulate the chemical reaction for 20 sec. (07)
b. In a pure pursuit, there is a target bomber which moves along a predetermine path (given on table below) and there is a pursuer aircraft who follows the target bombers, redirecting itself towards the target bombers at fixed intervals of time.
Target bombers moving path:

| Time, t | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
|---|---|---|---|---|---|---|---|---|---|
| xb(t) | 100 | 100 | 120 | 129 | 140 | 149 | 158 | 168 | 179 |
| yb(t) | 0 | 3 | 6 | 10 | 15 | 20 | 26 | 32 | 37 |

| Time, t | 9 | 10 | 11 | 12 | 13 | 14 | 15 |
|---|---|---|---|---|---|---|---|
| xb(t) | 188 | 198 | 209 | 219 | 226 | 234 | 240 |
| yb(t) | 34 | 30 | 27 | 23 | 19 | 16 | 14 |

The fighter aircraft following the enemy bombers with speed at 25KM/min to destroy it. The fighter aircraft is at position xf, yf (0, 60) when it sights the bomber that is at time t=0, the time at which the pursuit begins. The fighter corrects its direction after a fixed interval of one minute, so as to point towards a bomber and shoots the bomber by firing a missile as soon as it is within a distance of 12 KM. The pursuit ends. In case the bomber is not shot within 15 minutes of the pursuit, the pursuit is abandoned. Simulate the problem to determine the pursuit is end/abandoned.
3. a) When the mid square random number generators produce unexpected result? Write down the qualities of an efficient random number generator. (04)
b) The following sequence of random numbers have been generated 0.037, 0.55, 0.71, 0.97, 0.65, 0.29, 0.84, 0.78, 0.23, 0.17; Use Kolmogorov-Smirnov test with $\alpha= 0.05$ to determine, If these numbers are uniformly distributed over the interval 0 to 1. Note that for $\alpha= 0.05$ and N=10 the critical value is 0.410. (05)
c) Write down the qualities of an efficient random number generator. Use the multiplicative congruential method to generate a sequence of 10 three-digit random numbers. Let, $r_0 = 117, a = 3, m = 1000$. (05)
4. a) Why it is needed to test the randomness of pseudo random numbers? Write down the different types of testing system of randomness. (02)
b) A sequence of 10,000 five digit random numbers has been generated, and an analysis of numbers indicate that there 3075 numbers having five different digits, 4935 having a pair, 1135 having two pairs, 695 having three of a kind, 105 having full house, 54 having four of a kind and one having all five of a kind. Use Poker test to determine if these random numbers are independent at $\alpha = 0.01$. Note that for $\alpha= 0.01$ and N=06 the critical value is 16.8. (05)
c) The two-digit random numbers generated by a random variable are given below. Determine Chi-Square. Is it acceptable at 95% confidence level? [Use Chi-test table is at page 4]

| | | | | | | | | | |
|---|---|---|---|---|---|---|---|---|---|
| 21 | 81 | 92 | 28 | 96 | 20 | 68 | 52 | 79 | 84 |
| 82 | 62 | 12 | 08 | 92 | 83 | 74 | 85 | 60 | 49 |
| 48 | 37 | 65 | 74 | 22 | 11 | 28 | 10 | 55 | 82 |
| 72 | 95 | 08 | 85 | 79 | 95 | 86 | 11 | 16 | 52 |
| 70 | 55 | 50 | 87 | 67 | 51 | 72 | 38 | 29 | 62 |
| 71 | 12 | 07 | 75 | 56 | 34 | 40 | 67 | 24 | 86 |
| 18 | 82 | 41 | 29 | 63 | 06 | 84 | 01 | 20 | 06 |
| 06 | 33 | 14 | 79 | 25 | 65 | 57 | 47 | 74 | 68 |
| 54 | 35 | 81 | 07 | 88 | 96 | 70 | 85 | 29 | 13 |
| 12 | 91 | 26 | 57 | 30 | 22 | 90 | 03 | 13 | 31 |

1. a) What is stochastic process? (02)
b) A pair of dice is rolled once. The sum of the two numbers on the dice represents the outcome for a random variable x. Determine the probability distribution of x. What is the probability that x is even? (04)
c) Why is Gaussian distribution called bell curve? (02)
d) Generate five random observations from Normal distribution with mean = 5 and standard deviation 4. (04)
e) Give some applications of Poisson distribution. (02)
2. a) Define the following terminologies: (i) Arrival rate (ii) Service rate (iii) Reneging. (06)
b) Explain and illustrate the cost of customer waiting time and the idle capacity. (03)
c) A factory has a large number of semiautomatic machines. On 50% of the working days none of the machine fail. On 30% of the days one machine fails and on 20% of the days two machines fail. The maintenance staff on the average puts 65% of the machines in order in one day, 30% in two days, and the remaining 5% in three days. Estimate the average length of queue, average waiting time, and the server loading that is the fraction of time for which server is busy. (03)
d) According to two servers in parallel queuing system, illustrate a mixture of components A and B pass through workstation I. (02)

### **Final Exam of B. Sc. Engg. (CSE), July-Dec. 2018**

1. (a). Discuss about the component used in next event time-advance approach. (4)
(b). Show the comparison between i) analytical solution and simulation ii) static simulation and dynamic simulation. (4)
(c). For a single server queuing system, inter-arrival times of customer are 0.2, 0.8, 0.4, 2.0, 1.0, 0.2, 0.5, 1.0 and service times are 1.5, 1.0, 0.6, 1.2, and 0.6. Show the snapshot of computer representation at time 0 and at each of the 6 succeeding event times. (6)
2. (a). What are differences between next event time advance approach and fixed increment time advance approach? (3)
(b). What are the limitations of mid-square method? Evaluate the performance of Mid-square method if seeds are 6785, 1379, 1357. (4)
(c). Generate a sequence of 15 random numbers between 20 to 30 such that $r_{n+1} = (7r_n + 15) \bmod m$, where $r_0 = 11, m = \text{prime number}$. (4)
3. (a). Perform the Kolmogorov-Smirnov test to testify the uniformity of following random numbers at 95% level of significance. 0.37, 0.1, 0.5, 0.88, 0.37, 0.29, 0.84, 0.78, 0.08, 0.46. At $\alpha = 0.01$ and $N= 10$, critical values is 0.368; At $\alpha = 0.05$ and $N= 10$, critical values is 0.410 (4)
(b). Generate two digit 40 random numbers between 0 to 50 by a multiplicative congruential method. Apply Chi-Squared test to verify the randomness. Where, the accepted value of Chi-square for four degree of freedom at 95% confidence level is 9.448. (6)
(c) What do you mean by system simulation? Write down the properties of random numbers. (2)
4. (a) Define computer simulation models. Describe the steps in simulation study. (2)
(b) Define distributed simulation. Describe the iterative process of verification and validation of simulation models. (4)
(c) A drunkard moved from a point to a destination and takes step in four directions, backward, forward, right, and left. The probabilities associated with these are 10%, 50%, 15% and 25% respectively. The distances covered to backward, forward, right, and left are 30 cm, 80 cm, 60 cm and 40 cm respectively. Simulate the walk for 20 steps and find the location at end of 20 steps while starting point is (0, 0) on the X-Y scales. [USE Random Number 1 to 20 from table] (8)
5. (a) Write down the difference between monte-carlo and stochastic simulation. (2)
(b) An ammunition depot, of circular shape measuring 500 m of radius is under attack by a squadron of bombers. In each sortie 10 bombers drop bombs, one each, on the ammunition depot. If the bomb lands anywhere in the marked area, it is a hit, otherwise it is a miss. All the bombers aim at the center of the area. The point of strike is assumed to be normally distributed around the aiming point with a standard deviation of 500 m in x-direction and 300m in the y-direction. Simulate operation of bombing operation for 20 strikes and determine the percentage number of strikes, Which are on the target. [USE Random Number 21 to 40 for X coordinate and Random Number 41 to 60 for Y coordinate, from table] (8)
(c) Define Monte-Carlo method. Solve the integrals $I = \int_{2}^{5} x^3 dx$ by monte-carlo method. [USE Random Number 61 to 70 for X coordinate and Random Number 71 to 80 for Y coordinate, from table] (4)
6. (a) Define critical path. Describe the benefits of using simulation of PERT and CPM for planning, scheduling and controlling of a large and complex software project. (3)
(b) In a pure pursuit, there is a target bombers which moves along a predetermine path (given on table below) and there is a pursuer aircraft who follows the target bombers, redirecting itself towards the target bombers at fixed intervals of time.
Target bombers moving path:

| Time, t | 0 | 1 | 2 | 3 | 5 | 6 | 7 | 8 |
|---|---|---|---|---|---|---|---|---|
| xb(t) | 160 | 161 | 167 | 172 | 181 | 199 | 215 | 239 |
| yb(t) | 0 | 9 | 11 | 14 | 24 | 34 | 41 | 52 |

| Time, t | 9 | 10 | 11 | 12 | 13 | 14 | 15 |
|---|---|---|---|---|---|---|---|
| xb(t) | 245 | 254 | 265 | 271 | 289 | 293 | 300 |
| yb(t) | 45 | 41 | 36 | 39 | 34 | 28 | 12 |

The fighter aircraft following the enemy bombers with speed at 30KM/min to destroy it. The fighter aircraft is at position xf, yf (50, 50) when it sights the bomber that is at time t=0, the time at which the pursuit begins. The fighter corrects its direction after a fixed interval of one minute, so as to point towards a bomber and shoots the bomber by firing a missile as soon as it is within a distance of 10 KM. The pursuit ends. In case the bomber is not shot within 15 minutes of the pursuit, the pursuit is abandoned. Simulate the problem to determine the pursuit is end/abandoned. (6)
(c) Consider a chemical reaction of two gas $H_2$ and $O_2$ react to produce $H_2O$. (Same equation as previous iterations). Simulate the experiment for 3 minute to determine the amount of $H_2, O_2 \text{and } H_2O$. (5)

### **Final Examination (LAB), July-December: 2019**

**Part A (Open Source ; Hard copy only)**

1. Simulation of a pure pursuit problem (40)
2. Simulation of exterior ballistics (40)
3. Perform chi-squared test of uniformity and auto correlation on two-digit random number generated by multiplicative congruential method. (40)
4. Simulate an industrial reliability problem (40)
5. Simulate a counter service (40)
6. Simulate a profit analysis problem (40)
7. Simulate an inventory problem (40)
8. Simulate a manufacturing system (40)

**Part B**
9. Generate five random observations from each of the following distributions.
a. Exponential with mean=5
b. Erlang with mean=5 and k=3
c. Norman with mean=5 and standard deviation=4 (10)
10. Continuous Assessments in Laboratory (10)
13. Viva-Voce (10)

### **Midterm Examination, July-December-2021 (Sessional)**

1. Calculate the area of an irregular figure by Monte Carlo Method. (7.5)
2. Simulate the Gambling Game by Monte Carlo Method and analyze profit-loss. (7.5)
3. Find the value of a numerical integration by Monte Carlo Method of any differential equation. (7.5)
4. Determination of the value of $\pi$ by Monte Carlo Method. (7.5)
5. Solve Random walk by Monte Carlo Method. (7.5)
6. Simulate Reliability Problem. (7.5)
7. Implement Kolmogorov test with midsquare random numbers. (7.5)
8. Implement Chi-Square test with multiplicative congruential random numbers. (7.5)
9. Implement chi-square test for autocorrelation with additive congruential random numbers. (7.5)
10. Implement poker test with multiplicative congruential random numbers. (7.5)

Here are all the questions from the newly added document (`simu 19-20.pdf`), transcribed exactly as they appear, with markdown formatting and tables included:

### **Final Examination of B.Sc. Engg.(CSE), July-December/2022, Session: 2019-20**

**1.**
a. Define system with example. Distinguish analytical solution versus simulation. Demonstrate different ways in which a system might be studied. (05)
b. Explain the next-event time-advance approach illustrated for the single-server queueing system. (04)
c. List the steps of simulation for a single-server queueing system? Consider a single-server queuing system, there are several IID random variables interarrival times, service times, and customer delays. Describe the problem statement of the single-server queuing system. (05)

**2.**
a. How to compute variance, covariance, and correlation for simulation study. Why stochastic process is used to simulate the output data. Illustrate correlation function of the process of delays in queue D1, D2, .....for the M/M/1 queue. (05)
b. Define verification, validation, and credibility in simulation model. Mention the issues in an accreditation decision. Show the timing relationship of validation, verification, and establishing credibility. Derive the mathematical formulation in a good estimate of the mean of the system using both validation and output analysis. (06)
c. Explain the inspection approach of statistical procedure for comparing real-world observation and simulation output data. (03)

**3.**
a. List some sources of randomness for common simulation applications. Write the properties of location, scale, and shape parameters of continuous distributions (04)
b. Many random number generators in use today are linear congruential generator, LCGs. Explain, how to obtain the desired random numbers from LCGs. What is inverse transform function? Let X have the exponential distribution with mean $\beta$, Generate the desired random variate using the inverse transform function. (06)
c. What is the necessity of statistical analysis on simulation output data? Describe and illustrate transient and steady-state behavior of a stochastic process. (04)

**4.**
a. Define computer simulation models. Describe the steps in simulation study. (02)
b. In a pure pursuit, there is a target bombers which moves along a predetermine path (given on table below) and there is a pursuer aircraft who follows the target bombers, redirecting itself towards the target bombers at fixed intervals of time.
Target bombers moving path:

| Time,t | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
|---|---|---|---|---|---|---|---|---|---|
| xb(t) | 160 | 161 | 167 | 172 | 181 | 189 | 199 | 215 | 239 |
| yb(t) | 0 | 4 | 9 | 11 | 14 | 24 | 34 | 41 | 52 |

| Time,t | 9 | 10 | 11 | 12 | 13 | 14 | 15 |
|---|---|---|---|---|---|---|---|
| xb(t) | 245 | 254 | 265 | 271 | 289 | 293 | 300 |
| yb(t) | 45 | 41 | 36 | 39 | 34 | 28 | 12 |

The fighter aircraft following the enemy bombers with speed at 30KM/min to destroy it. The fighter aircraft is at position xf, yf (50, 50) when it sights the bomber that is at time t=0, the time at which the pursuit begins. The fighter corrects its direction after a fixed interval of one minute, so as to point towards a bomber and shoots the bomber by firing a missile as soon as it is within a distance of 10 KM. The pursuit ends. In case the bomber is not shot within 15 minutes of the pursuit, the pursuit is abandoned. Simulate the problem to determine the pursuit is end/abandoned. (12)

**5.**
a. Define the simulation of continuous system. Describe the disadvantages of analog simulation. (02)
b. Why the random numbers generated by computer are called pseudo random numbers? Discuss the pitfalls of congruence method of generating random numbers. (02)
c. Consider a chemical reaction of two gas $H_2$ and $O_2$ react to produce $H_2O$. The rate of the reaction is depending upon the ratio in which $H_2$ and $O_2$ are mixed and some other factor like temperature, pressure and humidity which remains constant during the reaction. There will also happen backward reaction where $H_2O$ decomposes back into $H_2$ and $O_2$. If $C_1, C_2$ and $C_3$ are the amount of $H_2, O_2$ and $H_2O$ at any instant of time t, the rate of increase of $H_2, O_2$ and $H_2O$ are given by the following differential equations:
$\frac{dC_1}{dt} = K_2C_3 - K_1C_1C_2$
$\frac{dC_2}{dt} = K_2C_3 - K_1C_1C_2$
$\frac{dC_3}{dt} = 2K_1C_1C_2 - 2K_2C_3$
Where, $K_1$ and $K_2$ are constants. If $K_1=0.025, K_2 = 0.01$ and at time t = 0, $C_1 = 50.00 m^3, C_2 = 25.00 m^3, C_3 = 0.00 m^3, \Delta t = 0.2$ minute. Simulate the experiment for 3 minute to determine the amount of $H_2, O_2$ and $H_2O$. (10)

**6.**
a. Define random variables. What are the purposes of testing the uniformity and independence of random values? (02)
b. Define autocorrelation. A sequence of 100 random numbers is given below. Use Chi-Square test with 99% confidence level. Test the autocorrelation of the given numbers employing the chi-squared test. (07)

| 21 | 81 | 92 | 23 | 96 | 20 | 68 | 57 | 79 | 84 |
|---|---|---|---|---|---|---|---|---|---|
| 82 | 62 | 12 | 08 | 92 | 83 | 74 | 85 | 60 | 49 |
| 48 | 37 | 65 | 74 | 22 | 11 | 28 | 10 | 55 | 82 |
| 72 | 95 | 08 | 85 | 79 | 95 | 86 | 11 | 16 | 52 |
| 70 | 55 | 50 | 87 | 67 | 51 | 72 | 38 | 29 | 62 |
| 71 | 12 | 07 | 75 | 56 | 34 | 40 | 67 | 24 | 86 |
| 18 | 82 | 41 | 29 | 63 | 06 | 84 | 01 | 20 | 06 |
| 06 | 33 | 14 | 79 | 25 | 65 | 57 | 47 | 74 | 68 |
| 54 | 35 | 81 | 07 | 88 | 96 | 70 | 85 | 29 | 13 |
| 12 | 91 | 26 | 57 | 30 | 22 | 90 | 03 | 13 | 31 |

N.B: You can use chi-squared table below as required.

c. Perform the Kolmogorov-Smirnov test to testify the uniformity of following random numbers at 95% level of significance. 0.37, 0.1, 0.5, 0.88, 0.37, 0.29, 0.84, 0.78, 0.08, 0.46 at $\alpha = 0.01$ and $N= 10$, critical values is 0.368; At $\alpha = 0.05$ and $N= 10$, critical values is 0.410. (05)

Table: Chi-square Distribution

| d.f. | .995 | .99 | .975 | .95 | .9 | .1 | .05 | .025 | .01 |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 0.00 | 0.00 | 0.00 | 0.00 | 0.02 | 2.71 | 3.84 | 5.02 | 6.63 |
| 2 | 0.01 | 0.02 | 0.05 | 0.10 | 0.21 | 4.61 | 5.99 | 7.38 | 9.21 |
| 3 | 0.07 | 0.11 | 0.22 | 0.35 | 0.58 | 6.25 | 7.81 | 9.35 | 11.34 |
| 4 | 0.21 | 0.30 | 0.48 | 0.71 | 1.06 | 7.78 | 9.49 | 11.14 | 13.28 |
| 5 | 0.41 | 0.55 | 0.83 | 1.15 | 1.61 | 9.24 | 11.07 | 12.83 | 15.09 |
| 6 | 0.68 | 0.87 | 1.24 | 1.64 | 2.20 | 10.64 | 12.59 | 14.45 | 16.81 |
| 7 | 0.99 | 1.24 | 1.69 | 2.17 | 2.83 | 12.02 | 14.07 | 16.01 | 18.48 |
| 8 | 1.34 | 1.65 | 2.18 | 2.73 | 3.49 | 13.36 | 15.51 | 17.53 | 20.09 |
| 9 | 1.73 | 2.09 | 2.70 | 3.33 | 4.17 | 14.68 | 16.92 | 19.02 | 21.67 |
| 10 | 2.16 | 2.56 | 3.25 | 3.94 | 4.87 | 15.99 | 18.31 | 20.48 | 23.21 |
| 11 | 2.60 | 3.05 | 3.82 | 4.57 | 5.58 | 17.28 | 19.68 | 21.92 | 24.72 |
| 12 | 3.07 | 3.57 | 4.40 | 5.23 | 6.30 | 18.55 | 21.03 | 23.34 | 26.22 |
| 13 | 3.57 | 4.11 | 5.01 | 5.89 | 7.04 | 19.81 | 22.36 | 24.74 | 27.69 |
| 14 | 4.07 | 4.66 | 5.63 | 6.57 | 7.79 | 21.06 | 23.68 | 26.12 | 29.14 |
| 15 | 4.60 | 5.23 | 6.26 | 7.26 | 8.55 | 22.31 | 25.00 | 27.49 | 30.58 |
| 16 | 5.14 | 5.81 | 6.91 | 7.96 | 9.31 | 23.54 | 26.30 | 28.85 | 32.00 |
| 17 | 5.70 | 6.41 | 7.56 | 8.67 | 10.09 | 24.77 | 27.59 | 30.19 | 33.41 |
| 18 | 6.26 | 7.01 | 8.23 | 9.39 | 10.86 | 25.99 | 28.87 | 31.53 | 34.81 |
| 19 | 6.84 | 7.63 | 8.91 | 10.12 | 11.65 | 27.20 | 30.14 | 32.85 | 36.19 |
| 20 | 7.43 | 8.26 | 9.59 | 10.85 | 12.44 | 28.41 | 31.41 | 34.17 | 37.57 |
