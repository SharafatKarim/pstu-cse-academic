#import "@preview/mitex:0.2.6": *

== Mahbub Sir

#block(inset: (left: 1em), stroke: (left: 2pt + luma(200)))[
Book = Concepts of Simulation - DS Hira
]

=== 1. CONCEPTS OF SIMULATION\*\*

- Define computer simulation models. Describe the steps in simulation study. \(02) _\[20-21 Final\]_ _\[18-19 Final\]_ _\[17-18 Final\]_ _\[16-17 Final\]_ _\[Jul-Dec-18 Final\]_ _\[19-20 Final\]_
- Define system simulation. Describe different types of simulation models. \(03) _\[17-18 Mid\]_ _\[15-16 Mid\]_ _\[Jul-Dec-18 Final\]_
- What are the advantages of simulation? Describe about the applied area of simulation. \(02) _\[17-18 Mid\]_ _\[15-16 Mid\]_ _\[16-17 Final\]_
- What is real time simulation? _\[16-17 Final\]_
- Describe the iterative process of verification and validation of simulation models. _\[Jul-Dec-18 Final\]_
- Define critical path. Describe the benefits of using simulation of PERT and CPM for planning, scheduling and controlling of a large and complex software project. \(3)  _\[Jul-Dec-18 Final\]_

=== 2. MONTE CARLO METHOD\*\*

- Define Monte-Carlo method. Solve the integrals #mi("I = \\int_{1}^{5} \\frac{x^4}{3} dx") by monte-carlo method. \[USE Random Number 48, 36, 44, 41, 46, 18, 32, 41, 23, 23 for X coordinate and Random Number .52, .18, .30, .88, .21, .25, .57, .82, .9, .63 for Y coordinate, you have a right to do scaling, if required\] \(04)  _\[20-21 Mid\]_
- Define Monte-Carlo method. Solve the integrals #mi("I = \\int_{1}^{5} \\frac{x^4}{3} dx") by monte-carlo method. \[USE Random Number 48, 36, 44, 41, 46, 18, 32, 41, 23, 23 for X coordinate and Random Number .52, .18, .30, .88, .21, .25, .57, .82, .9, .63 for Y coordinate, you have a right to do scaling, if required\] \(04) _\[20-21 Final\]_
- Define Monte-Carlo method. Solve the integrals #mi("I = \\int_{2}^{5} x^3 dx") by monte-carlo method. \[USE Random Number 61 to 70 for X coordinate and Random Number 71 to 80 for Y coordinate, from table\] \(05) _\[18-19 Mid\]_ _\[Jul-Dec-18 Final\]_
- Define Monte-Carlo method. Solve the integrals #mi("I = \\int_{2}^{5} x^3 dx") by monte-carlo method. \[USE Random Number 22, 25, 18, 45, 15, 27, 48, 43, 40, 47 for X coordinate and Random Number .57, .18, .00, .90, .05, .77, .66, .10, .76, .42 for Y coordinate, from table\] \(05) _\[17-18 Mid\]_
- Write down the difference between monte-carlo and stochastic simulation. \(02) _\[19-20 Mid\]_ _\[17-18 Final\]_ _\[Jul-Dec-18 Final\]_
- Define distributed simulation. _\[17-18 Final\]_ _\[Jul-Dec-18 Final\]_
- A drunkard moved from a point to a destination and takes step in four directions, backward, forward, right, and left. The probabilities associated with these are 15%, 40%, 20% and 25% respectively. The distances covered to backward, forward, right, and left are 50 cm, 90 cm, 60 cm and 40 cm respectively. Simulate the walk for 20 steps and find the location at end of 20 steps while starting point is \(0, 0) on the X-Y scales. \[USE Random Number 67, 23, 01, 95, 84, 56, 77, 76, 18, 82, 45, 29, 68, 21, 15, 86, 00, 89, 45\] \(04) _\[20-21 Mid\]_
- A drunkard moved from a point to a destination and takes step in four directions, backward, forward, right, and left. The probabilities associated with these are 10%, 50%, 15% and 25% respectively. The distances covered to backward, forward, right, and left are 30 cm, 80 cm, 60 cm and 40 cm respectively. Simulate the walk for 20 steps and find the location at end of 20 steps while starting point is \(0, 0) on the X-Y scales. \[USE Random Number 67, 23, 01, 95, 84, 56, 77, 76, 18, 82, 45, 55, 29, 68, 21, 15, 86, 00, 89, 43\] \(05) _\[19-20 Mid\]_ _\[18-19 Mid\]_  _\[17-18 Final\]_ _\[Jul-Dec-18 Final\]_
- A drunkard moved from a point to a destination and takes step in four directions, forward, backward, left and right. The probabilities associated with these are 40%, 15%, 22% and 23% respectively. The distances covered to forward, left and right are 75 cm, 45 cm, 60 cm and 60 cm respectively. Simulate the walk for 25 steps and find the location at end of 25 steps while starting point is \(0, 0) on the X-Y scales. \[USE RN 67, 23, 01, 62, 84, 56, 77, 76, 98, 82, 45, 87, 29, 68, 21, 15, 36, 00, 89, 43, 32\] \(05) _\[15-16 Mid\]_ _\[17-18 Mid\]_ _\[16-17 Final\]_
- A machine center has three identical bearings, which fail according to the following probability distribution in table A. The present maintenance policy is to change a bearing as and when it fails. When bearing fails machine center stops, a technician is called to replace the failed bearing with a new one. The time between the failure of the bearing and reporting of the technician \(delay time) is random and is distributed as table B. _\[20-21 Final\]_

#table(columns: 2, align: (auto, auto),
  table.header([Bearing Life\(Hours)], [Probability]),
  [1200], [0.10],
  [1400], [0.25],
  [1600], [0.30],
  [1800], [0.25],
  [2000], [0.10],
)

#table(columns: 2, align: (auto, auto),
  table.header([Delay Time\(Minutes)], [Probability]),
  [2], [0.3],
  [5], [0.5],
  [8], [0.2],
)

It takes 15 minutes to change one bearing, 25 minutes to change two bearing and 35 minutes to change all three bearings. Downtime of the system costs \$5 per minutes, direct on job costs of the technician is \$30 per hour and the cost of bearing is \$30. The maintenance department is interested in evaluating an alternative policy of replacing all the three bearings, whenever a bearing fails. Simulate the present and proposed policy for 10000 hours and choose the better policy. \(10) _\[20-21 Final\]_ _\[18-19 Final\]_

- An ammunition depot, of rectangular shape measuring 500 m of length and 350m of width is under attack by a squadron of bombers. In each sortie 10 bombers drop bombs, one each, on the ammunition depot. If the bomb lands anywhere in the marked area, it is a hit, otherwise it is a miss. All the bombers aim at the center of the area. The point of strike is assumed to be normally distributed around the aiming point with a standard deviation of 500 m in x-direction and 350m in the y-direction. Simulate operation of bombing operation for 20 strikes and determine the percentage number of strikes, which are on the target. \
Use Normal Random Number: \
For X direction - \[.23, -1.16, 0.39, -1.90, -0.78, -0.02, -0.40, -0.66, 1.14, 0.07, 0.53, 0.03, 1.19,0.11, 0.16, -0.82, 0.42, -0.89, 0.49, -0.21\] \
For Y direction- \[0.24, -0.02, 0.64, -1.04, 0.68, -0.47, -0.75, -0.44, 1.21, -0.08, -1.56, 1.49, -1.19, -1.86, 1.21, 0.75, -1.50, 0.19, -1.44, 0.65\] \(06) _\[20-21 Final\]_ _\[17-18 Final\]_ _\[16-17 Final\]_
- An ammunition depot, of rectangular shape measuring 500 m of length and 350m of width is under attack by a squadron of bombers. In each sortie 10 bombers drop bombs, one each, on the ammunition depot. If the bomb lands anywhere in the marked area, it is a hit, otherwise it is a miss. All the bombers aim at the center of the area. The point of strike is assumed to be normally distributed around the aiming point with a standard deviation of 500 m in x-direction and 350m in the y-direction. Simulate operation of bombing operation for 20 strikes and determine the percentage number of strikes, Which are on the target. \[USE Random Number 21 to 40 for X coordinate and Random Number 41 to 60 for Y coordinate, from table\] \(05) _\[18-19 Mid\]_ _\[Jul-Dec-18 Final\]_
- What is normally distributed random numbers? Describe the properties and applications of normally distributed random numbers. \(02) _\[20-21 Final\]_ _\[18-19 Final\]_ _\[17-18 Final\]_

=== 3. SIMULATION OF CONTINUOUS SYSTEMS\*\*

- Define the simulation of continuous system. Describe the disadvantages of analog simulation. _\[18-19 Final\]_ _\[19-20 Final\]_
- Define analog simulation. Describe the simulation of an exterior ballistics with an example. \(6) _\[17-18 Final\]_
- Consider a chemical reaction of two gas #mi("H_2") and #mi("O_2") react to produce #mi("H_2O"). The rate of the reaction is depending upon the ratio in which #mi("H_2") and #mi("O_2") are mixed and some other factor like temperature, pressure and humidity which remains constant during the reaction. There will also happen backward reaction where #mi("H_2O") decomposes back into #mi("H_2") and #mi("O_2"). If #mi("C_1"), #mi("C_2") and #mi("C_3") are the amount of #mi("H_2, O_2 \\text{and } H_2O") at any instant of time t, the rate of increase of #mi("H_2, O_2 \\text{and } H_2O") are given by the following differential equations: \
#mi("\\frac{dC_1}{dt} = K_2C_3 - K_1C_1C_2") \
#mi("\\frac{dC_2}{dt} = K_2C_3 - K_1C_1C_2") \
#mi("\\frac{dC_3}{dt} = 2K_1C_1C_2 - 2K_2C_3") \
Where #mi("K_1") and #mi("K_2") are constants. If #mi("K_1=0.025; K_2=0.01 \\text{ and at time } t=0, C_1=50.00 m^3, C_2=25.00 m^3, C_3=0.00 m^3, \\Delta t=0.2 \\text{ minute}"). Simulate the experiment for 3 minute to determine the amount of #mi("H_2, O_2 \\text{and } H_2O"). \(05) _\[15-16 Mid\]_  _\[17-18 Final\]_ _\[Jul-Dec-18 Final\]_ _\[19-20 Final\]_
- Let us consider a case where two chemicals #mi("ch_1") and #mi("ch_2") react to produce a third chemical #mi("ch_3"). The rate of reaction will depend upon a large number of factors like the ratio in which #mi("ch_1") and #mi("ch_2") are mixed, the temperature, the pressure and the humidity etc. In addition to the forward reaction where #mi("ch_1") and #mi("ch_2") react to produce #mi("ch_3") , there may also be backward reaction, where the #mi("ch_3") decomposes back into #mi("ch_1") and #mi("ch_2"). Let the rate of formation of #mi("ch_3") be proportional to the product of the amount of #mi("ch_1") and #mi("ch_2") present in the mixture and let the rate of decomposition of #mi("ch_3") be proportional to its amount in the mixture. If #mi("c_1, c_2") and #mi("c_3") are the amount of #mi("ch_1, ch_2") and #mi("ch_3") at any instant of time #mi("t"), the rate of change of #mi("c_1, c_2") and #mi("c_3") are given by the following differential equations: \
#mi("\\frac{dc_1}{dt} = k_2c_3 - k_1c_1c_2") \
#mi("\\frac{dc_2}{dt} = k_2c_3 - k_1c_1c_2") \
#mi("\\frac{dc_3}{dt} = 2k_1c_1c_2 - 2k_2c_3") \
Where #mi("k_1") and #mi("k_2") are constants. If the temperature, pressure and humidity are constant and have no effect on the rate of reaction and #mi("k_1 = 0.025, k_2 = 0.01, c_1 = 50.00, c_2 = 25.00, c_3 = 0.00 \\text{ and } \\Delta_t = 1 \\text{ sec}"); simulate the chemical reaction for 20 sec. \(07) _\[16-17 Final\]_
- In a pure pursuit, there is a target bomber which moves along a predetermine path \(given on table below) and there is a pursuer aircraft who follows the target bombers, redirecting itself towards the target bombers at fixed intervals of time. \
Target bombers moving path:

#table(columns: 10, align: (auto, auto, auto, auto, auto, auto, auto, auto, auto, auto),
  table.header([Time, t], [0], [1], [2], [3], [4], [5], [6], [7], [8]),
  [xb\(t)], [100], [100], [120], [129], [140], [149], [158], [168], [179],
  [yb\(t)], [0], [3], [6], [10], [15], [20], [26], [32], [37],
)

#table(columns: 8, align: (auto, auto, auto, auto, auto, auto, auto, auto),
  table.header([Time, t], [9], [10], [11], [12], [13], [14], [15]),
  [xb\(t)], [188], [198], [209], [219], [226], [234], [240],
  [yb\(t)], [34], [30], [27], [23], [19], [16], [14],
)

The fighter aircraft following the enemy bombers with speed at 25KM/min to destroy it. The fighter aircraft is at position xf, yf \(0, 60) when it sights the bomber that is at time t=0, the time at which the pursuit begins. The fighter corrects its direction after a fixed interval of one minute, so as to point towards a bomber and shoots the bomber by firing a missile as soon as it is within a distance of 12 KM. The pursuit ends. In case the bomber is not shot within 15 minutes of the pursuit, the pursuit is abandoned. Simulate the problem to determine the pursuit is end/abandoned. _\[16-17 Final\]_

- In a pure pursuit, there is a target bombers which moves along a predetermine path \(given on table below) and there is a pursuer aircraft who follows the target bombers, redirecting itself towards the target bombers at fixed intervals of time. \
Target bombers moving path:

#table(columns: 10, align: (auto, auto, auto, auto, auto, auto, auto, auto, auto, auto),
  table.header([Time,t], [0], [1], [2], [3], [4], [5], [6], [7], [8]),
  [xb\(t)], [160], [161], [167], [172], [181], [189], [199], [215], [239],
  [yb\(t)], [0], [4], [9], [11], [14], [24], [34], [41], [52],
)

#table(columns: 8, align: (auto, auto, auto, auto, auto, auto, auto, auto),
  table.header([Time,t], [9], [10], [11], [12], [13], [14], [15]),
  [xb\(t)], [245], [254], [265], [271], [289], [293], [300],
  [yb\(t)], [45], [41], [36], [39], [34], [28], [12],
)

The fighter aircraft following the enemy bombers with speed at 30KM/min to destroy it. The fighter aircraft is at position xf, yf \(50, 50) when it sights the bomber that is at time t=0, the time at which the pursuit begins. The fighter corrects its direction after a fixed interval of one minute, so as to point towards a bomber and shoots the bomber by firing a missile as soon as it is within a distance of 10 KM. The pursuit ends. In case the bomber is not shot within 15 minutes of the pursuit, the pursuit is abandoned. Simulate the problem to determine the pursuit is end/abandoned. \(12)  _\[19-20 Final\]_ _\[Jul-Dec-18 Final\]_

- There are a number of moving objects, which chase each other in a serial order like A chases B, B chases C, and C chases D etc. Each object moves towards its target unmindful of the fact that it itself is being targeted by some other object. Depending upon the original location, and speed of motion of the object, each object will take its own time to hit its target. As soon as hit occurs, the chase ends. The initial location of the objects A, B, C, and D are \(0,0), \(0,10), \(0,20), \(0,30) respectively and their velocities are 30km/hr, 25km/hr, 20 km/hr and 15km/hr respectively. Object D moves towards a fixed at \(30,50), while C moves always in a direction pointing towards D, the object B moves always pointing towards C and object A always pointing towards B. It can be assumed that when the distance between two objects less than 0.005 hit is taken to occur. Identify, which object will hit the target at first and in what time? \(07) _\[19-20 Final\]_ _\[18-19 Final\]_

=== 4. RANDOM NUMBERS

- Why the random numbers generated by computer are called pseudo random numbers? Discuss the pitfalls of congruence method of generating random numbers. \(02) _\[18-19 Final\]_ _\[19-20 Final\]_
- Write down the properties of random numbers. _\[Jul-Dec-18 Final\]_
- Write down the qualities of an efficient random number generator. _\[20-21 Final\]_ _\[18-19 Final\]_
- Define random variables. What are the purposes of testing the uniformity and independence of random values? \(02) _\[18-19 Final\]_ _\[19-20 Final\]_
- What are the differences between true and pseudo random numbers? Describe the procedure to physically generate random number at the interval with two-digit accuracy. \(02) _\[20-21 Final\]_
- Why it is needed to test the randomness of pseudo random numbers? Write down the different types of testing system of randomness. \(02) _\[16-17 Final\]_
- Use mixed congruential method to generate the following sequence of random numbers, A sequence of 10 two digit random numbers such that #mi("r_{n+1} = (19r_n + 1) \\text{modulo} 23"); Take #mi("r_0 = 1"). \[Take seed values yourself\] \(03) _\[20-21 Final\]_
- The following sequence of random numbers have been generated 0.037, 0.55, 0.71, 0.97, 0.65, 0.29, 0.84, 0.78, 0.23, 0.17; Use Kolmogorov-Smirnov test with #mi("\\alpha= 0.05") to determine, If these numbers are uniformly distributed over the interval 0 to 1. Note that for #mi("\\alpha= 0.05") and N=10 the critical value is 0.410. \(5) _\[17-18 Final\]_ _\[Jul-Dec-18 Final\]_
- Generate two digit 40 random numbers between 0 to 50 by a multiplicative congruential method. Apply Chi-Squared test to verify the randomness. Where, the accepted value of Chi-square for four degree of freedom at 95% confidence level is 9.448. \(6)  _\[Jul-Dec-18 Final\]_
- Perform the Kolmogorov-Smirnov test to testify the uniformity of following random numbers at 95% level of significance. 0.37, 0.1, 0.5, 0.88, 0.37, 0.29, 0.84, 0.78, 0.08, 0.46 at #mi("\\alpha = 0.01") and #mi("N= 10"), critical values is 0.368; At #mi("\\alpha = 0.05") and #mi("N= 10"), critical values is 0.410. \(05)

Table: Chi-square Distribution

#table(columns: 10, align: (auto, auto, auto, auto, auto, auto, auto, auto, auto, auto),
  table.header([d.f.], [.995], [.99], [.975], [.95], [.9], [.1], [.05], [.025], [.01]),
  [1], [0.00], [0.00], [0.00], [0.00], [0.02], [2.71], [3.84], [5.02], [6.63],
  [2], [0.01], [0.02], [0.05], [0.10], [0.21], [4.61], [5.99], [7.38], [9.21],
  [3], [0.07], [0.11], [0.22], [0.35], [0.58], [6.25], [7.81], [9.35], [11.34],
  [4], [0.21], [0.30], [0.48], [0.71], [1.06], [7.78], [9.49], [11.14], [13.28],
  [5], [0.41], [0.55], [0.83], [1.15], [1.61], [9.24], [11.07], [12.83], [15.09],
  [6], [0.68], [0.87], [1.24], [1.64], [2.20], [10.64], [12.59], [14.45], [16.81],
  [7], [0.99], [1.24], [1.69], [2.17], [2.83], [12.02], [14.07], [16.01], [18.48],
  [8], [1.34], [1.65], [2.18], [2.73], [3.49], [13.36], [15.51], [17.53], [20.09],
  [9], [1.73], [2.09], [2.70], [3.33], [4.17], [14.68], [16.92], [19.02], [21.67],
  [10], [2.16], [2.56], [3.25], [3.94], [4.87], [15.99], [18.31], [20.48], [23.21],
  [11], [2.60], [3.05], [3.82], [4.57], [5.58], [17.28], [19.68], [21.92], [24.72],
  [12], [3.07], [3.57], [4.40], [5.23], [6.30], [18.55], [21.03], [23.34], [26.22],
  [13], [3.57], [4.11], [5.01], [5.89], [7.04], [19.81], [22.36], [24.74], [27.69],
  [14], [4.07], [4.66], [5.63], [6.57], [7.79], [21.06], [23.68], [26.12], [29.14],
  [15], [4.60], [5.23], [6.26], [7.26], [8.55], [22.31], [25.00], [27.49], [30.58],
  [16], [5.14], [5.81], [6.91], [7.96], [9.31], [23.54], [26.30], [28.85], [32.00],
  [17], [5.70], [6.41], [7.56], [8.67], [10.09], [24.77], [27.59], [30.19], [33.41],
  [18], [6.26], [7.01], [8.23], [9.39], [10.86], [25.99], [28.87], [31.53], [34.81],
  [19], [6.84], [7.63], [8.91], [10.12], [11.65], [27.20], [30.14], [32.85], [36.19],
  [20], [7.43], [8.26], [9.59], [10.85], [12.44], [28.41], [31.41], [34.17], [37.57],
  [_\[19-20 Final\]_], [], [], [], [], [], [], [], [], [],
)

- A sequence of 100 random numbers is given below. Use Chi-Square test with #mi("\\alpha = 0.05") to test these numbers are uniformly distributed. \(12)

#table(columns: 10, align: (auto, auto, auto, auto, auto, auto, auto, auto, auto, auto),
  table.header([], [], [], [], [], [], [], [], [], []),
  [21], [81], [92], [28], [96], [20], [68], [52], [79], [84],
  [82], [62], [12], [08], [92], [83], [74], [85], [60], [49],
  [48], [37], [65], [74], [22], [11], [28], [10], [55], [82],
  [72], [95], [08], [85], [79], [95], [86], [11], [16], [52],
  [70], [55], [50], [87], [67], [51], [72], [38], [29], [62],
  [71], [12], [07], [75], [56], [34], [40], [67], [24], [86],
  [18], [82], [41], [29], [63], [06], [84], [01], [20], [06],
  [06], [33], [14], [79], [25], [65], [57], [47], [74], [68],
  [54], [35], [81], [07], [88], [96], [70], [85], [29], [13],
  [12], [91], [26], [57], [30], [22], [90], [03], [13], [31],
)

_\[18-19 Final\]_ _\[16-17 Final\]_

- Define autocorrelation. Test the autocorrelation of the given numbers \(above question) by employing the chi-squared test with 99% confidence level.

#table(columns: 10, align: (auto, auto, auto, auto, auto, auto, auto, auto, auto, auto),
  table.header([21], [81], [92], [23], [96], [20], [68], [57], [79], [84]),
  [82], [62], [12], [08], [92], [83], [74], [85], [60], [49],
  [48], [37], [65], [74], [22], [11], [28], [10], [55], [82],
  [72], [95], [08], [85], [79], [95], [86], [11], [16], [52],
  [70], [55], [50], [87], [67], [51], [72], [38], [29], [62],
  [71], [12], [07], [75], [56], [34], [40], [67], [24], [86],
  [18], [82], [41], [29], [63], [06], [84], [01], [20], [06],
  [06], [33], [14], [79], [25], [65], [57], [47], [74], [68],
  [54], [35], [81], [07], [88], [96], [70], [85], [29], [13],
  [12], [91], [26], [57], [30], [22], [90], [03], [13], [31],
)

N.B: You can use chi-squared table below as required.  _\[18-19 Final\]_  _\[19-20 Final\]_

- A sequence of 10,000 five digit random numbers has been generated, and an analysis of numbers indicate that there 3075 numbers having five different digits, 4935 having a pair, 1135 having two pairs, 695 having three of a kind, 105 having full house, 54 having four of a kind and one having all five of a kind. Use Poker test to determine if these random numbers are independent at #mi("\\alpha = 0.01"). Note that for #mi("\\alpha= 0.01") and N=06 the critical value is 16.8. \(06) _\[20-21 Final\]_ _\[17-18 Final\]_ _\[16-17 Final\]_

== Masud Sir

#block(inset: (left: 1em), stroke: (left: 2pt + luma(200)))[
Book = Simulation Modeling and Analysis \(Averill M. Law)
]

=== Chapter 1 Basic Simulation Modeling

- Distinguish between analytical solution and simulation. \(02) _\[20-21 Mid\]_
- Explain the problem statement of simulation of a single server queuing system. \(05) _\[20-21 Mid\]_
- 1.1 The Nature of Simulation
- 1.2 Systems, Models, and Simulation
- 1.3 Discrete-Event Simulation
- 1.3.1 Time-Advance Mechanisms
- 1.3.2 Components and Organization of Discrete-Event Simulation Model
- 1.4 Simulation of a Single-Server Queueing System
- 1.4.1 Problem Statement
- 1.4.2 Intuitive Explanation
- 1.4.3 Program Organization and Logic
- 1.4.4 C Program
- 1.4.5 Simulation Output and Discussion
- 1.4.6 Alternative Stopping Rules
- 1.4.7 Determining the Events and Variables
- 1.5 Simulation of an Inventory System
- 1.5.1 Problem Statement
- 1.5.2 Program Organization and Logic
- 1.5.3 C Program
- 1.5.4 Simulation Output and Discussion
- 1.6 Parallel/Distributed Simulation and the High Level Architecture
- 1.6.1 Parallel Simulation
- 1.6.2 Distributed Simulation and the High Level Architecture
- 1.7 Steps in a Sound Simulation Study
- 1.8 Advantages, Disadvantages, and Pitfalls of Simulation
- Appendix 1A: Fixed-Increment Time Advance
- Appendix 1B: A Primer on Queueing Systems
- 1B.1 Components of a Queueing System
- 1B.2 Notation for Queueing Systems
- 1B.3 Measures of Performance for Queueing Systems
- Problems

=== Chapter 4 Review of Basic Probability and Statistics

- *4.1* Introduction
- *4.2* Random Variables and Their Properties
- *4.3* Simulation Output Data and Stochastic Processes
- *4.4* Estimation of Means, Variances, and Correlations
- *4.5* Confidence Intervals and Hypothesis Tests for the Mean
- *4.6* The Strong Law of Large Numbers
- *4.7* The Danger of Replacing a Probability Distribution by its Mean
- Appendix 4A: Comments on Covariance-Stationary Processes
- Problems

=== Chapter 5 Building Valid, Credible, and Appropriately Detailed

- *5.1* Introduction and Definitions
- *5.2* Guidelines for Determining the Level of Model Detail
- *5.3* Verification of Simulation Computer Programs
- *5.4* Techniques for Increasing Model Validity and Credibility
- *5.4.1* Collect High-Quality Information and Data on the System
- *5.4.2* Interact with the Manager on a Regular Basis
- *5.4.3* Maintain a Written Assumptions Document and Perform a Structured Walk-Through
- *5.4.4* Validate Components of the Model by Using Quantitative Techniques
- *5.4.5* Validate the Output from the Overall Simulation Model
- *5.4.6* Animation
- *5.5* Management’s Role in the Simulation Process
- *5.6* Statistical Procedures for Comparing Real-World Observations and Simulation Output Data
- *5.6.1* Inspection Approach
- *5.6.2* Confidence-Interval Approach Based on Independent Data
- *5.6.3* Time-Series Approaches
- *5.6.4* Other Approaches
- Problems

=== Chapter 6 Selecting Input Probability Distributions

- 6.1 Introduction
- 6.2 Useful Probability Distributions
- 6.2.1 Parameterization of Continuous Distributions
- 6.2.2 Continuous Distributions
- 6.2.3 Discrete Distributions
- 6.2.4 Empirical Distributions
- 6.3 Techniques for Assessing Sample Independence
- 6.4 Activity I: Hypothesizing Families of Distributions
- 6.4.1 Summary Statistics
- 6.4.2 Histograms
- 6.4.3 Quantile Summaries and Box Plots
- 6.5 Activity II: Estimation of Parameters
- 6.6 Activity III: Determining How Representative the Fitted Distributions Are
- 6.6.1 Heuristic Procedures
- 6.6.2 Goodness-of-Fit Tests
- 6.7 The ExpertFit Software and an Extended Example
- 6.8 Shifted and Truncated Distributions
- 6.9 Bézier Distributions
- 6.10 Specifying Multivariate Distributions, Correlations, and Stochastic Processes
- 6.10.1 Specifying Multivariate Distributions
- 6.10.2 Specifying Arbitrary Marginal Distributions and Correlations
- 6.10.3 Specifying Stochastic Processes
- 6.11 Selecting a Distribution in the Absence of Data
- 6.12 Models of Arrival Processes
- 6.12.1 Poisson Processes
- 6.12.2 Nonstationary Poisson Processes
- 6.12.3 Batch Arrivals
- 6.13 Assessing the Homogeneity of Different Data Sets
- AppendixProblems
- 6A:Tables of MLEs for the Gamma and Beta Distributions

=== Chapter 7 Random-Number Generators

- 7.1 Introduction
- 7.2 Linear Congruential Generators
- 7.2.1 Mixed Generators
- 7.2.2 Multiplicative Generators
- 7.3 Other Kinds of Generators
- 7.3.1 More General Congruences
- 7.3.2 Composite Generators
- 7.3.3 Feedback Shift Register Generators
- 7.4 Testing Random-Number Generators
- 7.4.1 Empirical Tests
- 7.4.2 Theoretical Tests
- 7.4.3 Some General Observations on Testing
- AppendixAppendixProblems
- 7A:7B:Portable C Code for a PMMLCG
- Portable C Code for a Combined MRG

=== Chapter 8 Generating Random Variates

- 8.1 Introduction
- 8.2 General Approaches to Generating Random Variates
- 8.2.1 Inverse Transform
- 8.2.2 Composition
- 8.2.3 Convolution
- 8.2.4 Acceptance-Rejection
- 8.2.5 Ratio of Uniforms
- 8.2.6 Special Properties
- 8.3 Generating Continuous Random Variates
- 8.3.1 Uniform
- 8.3.2 Exponential
- 8.3.3 m-Erlang
- 8.3.4 Gamma
- 8.3.5 Weibull
- 8.3.6 Normal
- 8.3.7 Lognormal
- 8.3.8 Beta
- 8.3.9 Pearson Type V
- 8.3.10 Pearson Type VI
- 8.3.11 Log-Logistic
- 8.3.12 Johnson Bounded
- 8.3.13 Johnson Unbounded
- 8.3.14 Bézier
- 8.3.15 Triangular
- 8.3.16 Empirical Distributions
- 8.4 Generating Discrete Random Variates
- 8.4.1 Bernoulli
- 8.4.2 Discrete Uniform
- 8.4.3 Arbitrary Discrete Distribution
- 8.4.4 Binomial
- 8.4.5 Geometric
- 8.4.6 Negative Binomial
- 8.4.7 Poisson
- 8.5 Generating Random Vectors, Correlated Random Variates, and Stochastic Processes
- 8.5.1 Using Conditional Distributions
- 8.5.2 Multivariate Normal and Multivariate Lognormal
- 8.5.3 Correlated Gamma Random Variates
- 8.5.4 Generating from Multivariate Families
- 8.5.5 Generating Random Vectors with Arbitrarily Specified Marginal Distributions and Correlations
- 8.5.6 Generating Stochastic Processes
- 8.6 Generating Arrival Processes
- 8.6.1 Poisson Processes
- 8.6.2 Nonstationary Poisson Processes
- 8.6.3 Batch Arrivals
- AppendixAppendixProblems
- 8A:8B:Validity of the Acceptance-Rejection
- Method
- Setup for the Alias Method