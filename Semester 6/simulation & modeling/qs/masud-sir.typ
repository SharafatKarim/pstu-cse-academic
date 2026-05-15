#import "@preview/mitex:0.2.6": *

= Masud Sir's Solve with Gemini 1.5 Pro

== *Mid-Term Examination 20-21*

*1. Distinguish between analytical solution and simulation. \(02)* \
If the logical and quantitative relationships that compose a mathematical model are simple enough, it is possible to use mathematical methods \(such as algebra or calculus) to evaluate them and obtain an exact *analytical solution*. However, most real-world systems are highly complex, making their mathematical models too complex for an analytical solution to be computationally efficient or even possible. In these instances, the model must be studied by means of *simulation*, which uses a computer to evaluate the model numerically and gather data to estimate the desired true characteristics.

*2. Explain the problem statement of simulation of a single server queuing system. \(05)* \
The simulation of a single-server queuing system involves modeling a system where customers arrive with *independent and identically distributed \(IID) interarrival times* and require *IID service times*. A customer who arrives to find the server idle enters service immediately; if the server is busy, the customer joins the end of a single, first-in, first-out \(FIFO) queue. The simulation initializes in the "empty-and-idle" state at time zero, and it runs until a fixed number \(#mi("n")) of customers have completed their delays in the queue. The objective is to estimate three key performance measures: the expected average delay in queue for the #mi("n") customers \(#mi("d(n)")), the expected time-average number of customers in the queue \(#mi("q(n)")), and the expected proportion of time the server is busy, known as server utilization \(#mi("u(n)")).

#line(length: 100%)

== *Final Examination 20-21*

*1. a. Define simulation with example. Demonstrate different ways in which a system might be studied. Explain the next-event time-advance approach illustrated for the single-server queueing system. \(05)* \
*Simulation* is the use of a computer to evaluate a model numerically to estimate the desired true characteristics of a complex system. For example, a manufacturing company contemplating a large plant expansion can simulate the plant's operation as it currently exists and compare it against a simulation of the expanded facility to determine if productivity gains justify the costs. \
A system might be studied by experimenting with the *actual system* itself, or if that is too costly or disruptive, by experimenting with a *model of the system*. Models can be classified as *physical models* \(e.g., miniature scale models) or *mathematical models*. A mathematical model can then be evaluated using an *analytical solution* or via *simulation*. \
In the *next-event time-advance approach* for a single-server queuing system, the simulation clock is initialized to zero and the time of future events \(such as customer arrivals) are determined. The simulation clock is then advanced to the time of the most imminent future event. The state of the system is updated to account for the event, future event times are recalculated, and the clock jumps to the next event time, skipping over periods of inactivity until a stopping condition is met.

*1. b. Consider a single-server queuing system, there are several IID random variables interarrival times, service times, and customer delays. Describe the problem statement of the single-server queuing system. \(05)* \
_\(This addresses the exact same concepts as Mid-Term Question 2)._ \
The problem entails a system characterized by *IID interarrival times* and *IID service times*. Customers are served immediately if the server is idle, or wait in a FIFO queue if the server is busy. The system begins completely empty and idle. The model runs until #mi("n") customers complete their delays, generating outputs to estimate the expected average delay in the queue, the expected time-average number of customers in the queue, and the expected server utilization.

*1. c. What is an inventory system? Formulate a simulation of an inventory system in which many of the elements are representative of those found in the actual inventory system. \(04)* \
An *inventory system* is an operation where a company stocks products to satisfy customer demand. A representative simulation of an inventory system models a company deciding how many items to stock for the next #mi("n") months. The times between customer demands are exponentially distributed, and the demand sizes take on a discrete probability distribution. The company evaluates the inventory at the beginning of each month and uses a *stationary #mi("(s, S)") ordering policy*: if the inventory level is less than #mi("s"), an order is placed to bring it up to #mi("S"); otherwise, no order is placed. When an order is placed, it arrives after a delivery lag that is uniformly distributed. The goal of the simulation is to evaluate ordering, holding, and shortage costs across #mi("n") months to determine which #mi("(s, S)") policy minimizes the expected average cost per month.

*2. a. Define random variable. How to compute variance, covariance, and correlation for simulation study? Why stochastic process is used to simulate the output data. Illustrate correlation function of the process of delays in queue D1, D2, .....for the M/M/1 queue. \(05)* \
In a simulation, a *random variable* represents probabilistic components used to model system uncertainty, mapped out using probability distributions. _\(Note: The exact statistical equations for variance and covariance are not explicitly defined in the provided text. Generally, variance measures the spread of a random variable, while covariance measures the joint variability between two random variables)._ The text does provide the formula for *correlation*, which is computed as #mi("Cor(X, Y) = Cov(X, Y) / \\sqrt{Var(X) Var(Y)}"). \
Because simulation models use random variables as inputs, the output data they produce are also random variables. We use a *stochastic process*—defined as a collection of "similar" random variables ordered over time—to represent and analyze these outputs. For the M/M/1 queue, the stochastic process of delays in queue is defined by #mi("D_1 = 0"), and #mi("D_{i+1} = \\max\\{D_i + S_i - A_{i+1}, 0\\}"). As a result of this relationship, the successive delays #mi("D_i") and #mi("D_{i+1}") are *positively correlated*.

*2. b. Define verification, validation, and credibility in simulation model. Illustrate the timing relationship of validation, verification, and establishing credibility. \(05)*

- *Verification* is the process of determining whether the simulation's "assumptions document" has been correctly translated into a computer program; essentially, it is debugging the code.
- *Validation* is the process of determining whether a simulation model is an accurate representation of the actual system for the particular objectives of the study.
- *Credibility* is established when the manager and other key project personnel accept the model and its results as "correct".
- *Timing Relationship:* These elements operate interdependently. Verification occurs primarily during the programming phase. Validation spans across multiple phases, checking both the initial assumptions document and the programmed model against the actual system. Establishing credibility runs continuously from the beginning of data analysis through validation, ultimately resulting in management using the results for decision-making.

*2. c. Describe the eight methods for debugging a simulation model's computer program. \(04)*

+ *Write and debug the computer program in modules or subprograms* rather than attempting to write and test a massive program all at once.
+ *Conduct a structured walk-through* where multiple members of the modeling team review the program statement by statement.
+ *Run the simulation under a variety of input parameter settings* and compare the output against exact theoretical calculations or simple measures of performance to verify reasonableness.
+ *Perform a "trace"* to display the state of the simulated system just after each event occurs, comparing the output to hand calculations to verify logic.
+ *Compare the model to simplified analytical models*; if the simulation matches exact mathematical characteristics of a simplified queue, it increases confidence in the complex model's logic.
+ *Observe an animation of the simulation output* to detect logical errors that numerical data might miss \(e.g., cars colliding in a simulated intersection).
+ *Compute the sample mean and variance for the simulation's input probability distributions* and compare them with the desired historical data to ensure random values are being generated accurately.
+ *Use a commercial simulation package* to greatly reduce the amount of manual programming required.

*3. a. Write down the properties of the location, scale, and shape parameters of continuous distributions. State the relevant information \(application, density function, parameters, and density curve) for the simulation modeling application of the normal continuous distribution. \(05)* \
_\(Note: The provided text discusses continuous distributions and briefly notes that a location parameter #mi("\\gamma") specifies a minimum bounds condition where the value #mi("X > \\gamma"). However, it does not explicitly define scale and shape parameters, nor does it detail the specific density functions and curves of the Normal Distribution. The following relies on general statistical knowledge)._ \
In probability distributions, a *location parameter* dictates the shift of the distribution along the horizontal axis. A *scale parameter* dictates the statistical spread or dispersion \(stretching or shrinking the curve). A *shape parameter* dictates the fundamental form and skewness of the curve. The *Normal continuous distribution* is applied widely to model natural phenomena or aggregated sums. Its parameters are #mi("\\mu") \(mean, which serves as the location parameter) and #mi("\\sigma") \(standard deviation, which serves as the scale parameter). Its density curve is a perfectly symmetric, bell-shaped curve centered at the mean.

*3. b. Many random number generators in use today are linear congruential generators, LCGs. Discuss how to obtain the desired random numbers from LCGs? What is the inverse transform function? Let X have an exponential distribution with a mean #mi("\\beta"). Generate the desired random variate using the inverse transform function. \(06)* \
_\(Note: The exact algorithmic formula for Linear Congruential Generators is omitted in the provided text, but generally, LCGs yield a sequence of pseudo-random numbers using a recursive modulo mathematical function to output values that can be scaled to #mi("U(0,1)"))._ \
The *inverse transform method* is a variate-generation technique where exactly one generated #mi("U(0, 1)") random number is used to produce exactly one value of the desired random variable. It monotonically transforms the random number to match the target distribution's cumulative distribution function. \
To generate an *exponential random variate* with a mean of #mi("\\beta") using the inverse transform method, you generate a #mi("U(0, 1)") random variate #mi("U"), and then apply the algorithm to return the value *#mi("-\\beta \\ln U")*. \(Returning #mi("-\\beta \\ln(1 - U)") is also valid).

*3. c. What is the necessity of statistical analysis with simulation output data? Describe and illustrate the transient and steady-state behaviors of a stochastic process. \(03)* \
*Necessity of statistical analysis:* Because simulation models are driven by random samples from probability distributions, the outputs generated are just particular realizations of random variables that can possess large variances. Using just a single run of arbitrary length can yield estimates that differ greatly from the true system characteristics, leading to a significant risk of making erroneous inferences. \
*Transient vs. Steady-state behaviors:* The output of a stochastic process starts with a *transient distribution* which is heavily dependent on both the initial conditions used to start the simulation and the specific discrete time point #mi("i"). *Steady-state behavior* begins at a finite time index further down the line \(e.g., #mi("k+1")) when the distributions of the random variables become approximately the same, having shaken off the bias of the initial conditions. This is illustrated by plotting transient densities that rapidly shift over the time axis before gradually smoothing out and stabilizing along a constant mean curve as the system reaches "steady state".

#line(length: 100%)

== *Midterm Examination of B.Sc. Engg.\(CSE), July-Decem.2022*

*1. Define the following terminologies and demonstrate different ways in which a system might be studied. \(03)*

- *System:* A collection of entities \(e.g., people or machines) that act and interact together toward the accomplishment of some logical end.
- *Model:* A logical or mathematical representation of a system used to gain an understanding of how the corresponding system behaves.
- *Simulation:* The use of a computer to evaluate a mathematical model numerically, gathering data in order to estimate the desired true characteristics of the complex system.
- *Analytical solution:* An exact closed-form solution obtained by using mathematical methods \(such as algebra, calculus, or probability theory) to evaluate a model's relationships.
- *Ways to study a system:* A system can be studied by experimenting with the *actual system* itself or by experimenting with a *model* of the system. Models can be physical \(scale models) or mathematical. A mathematical model can then be evaluated using an *analytical solution* \(if simple enough) or via *simulation* \(if the system is highly complex).

*2. What are the steps of simulation for a single-server queueing system? Describe the problem statement and intuitive explanation of a single-server queueing system. \(05)*

- *Problem Statement:* The simulation involves a system where customers arrive with independent and identically distributed \(IID) interarrival times and require IID service times. The system starts completely empty and idle. If a customer arrives and the server is idle, they enter service immediately; if the server is busy, the customer joins the tail of a first-in, first-out \(FIFO) queue. The objective is to run the model until #mi("n") customers complete their delays to estimate the expected average delay in queue, the expected time-average number of customers in the queue, and the expected server utilization.
- *Intuitive Explanation:* The simulation continuous behavior is tracked by capturing "snapshots" of the system state variables \(server status, number of customers in queue, and customer arrival times) at discrete event times #mi("e_0, e_1, e_2 \\dots") \(either customer arrivals or departures). At each jump in time, areas under the curve for variables like queue length #mi("Q(t)") and server status #mi("B(t)") are updated to calculate continuous-time statistics.
- *Steps of Simulation \(Next-Event Time-Advance Approach):*
  + Initialize the simulation clock to 0 and system state \(server idle, queue empty).
  + Determine the time of the most imminent future event \(e.g., the next arrival) from the event list.
  + Advance the simulation clock to the time of this next event.
  + Update the system state and statistical counters based on the specific event type.
  + Generate the time of future events \(e.g., service completion times) and add them to the event list.
  + Repeat the cycle until the simulation's stopping condition is met, then trigger the report generator.

#line(length: 100%)

== *Final Examination, July-December-2021*

*1. a. & b. Define terminologies, ways to study a system, and single-server queueing steps/problem statement. \(14)* \
_\(These questions are identical to Questions 1 and 2 from the Midterm. See above for the complete answers)._

*2. a. What is random variable? Compute variance and covariance based on a set of random variates. Why stochastic process is used to simulate the output data? Illustrate correlation function of the process of delays in queue D1, D2, .....for the M/M/1 queue. \(07)*

- *Random Variable:* Represents probabilistic components mapping out the uncertainty in a simulation model \(e.g., interarrival or service times).
- *Compute Variance and Covariance:* Based on a set of #mi("n") random variates, the sample variance #mi("S^2(n)") is computed as #mi("S^2(n) = \\frac{\\sum_{i=1}^n [X_i - \\bar{X}(n)]^2}{n - 1}"). The sample covariance #mi("\\hat{C}_{XY}(n)") between two sets of variates is computed as #mi("\\hat{C}_{XY}(n) = \\frac{\\sum_{j=1}^n [X_j - \\bar{X}(n)][Y_j - \\bar{Y}(n)]}{n - 1}").
- *Why Stochastic Process:* Because simulation models use random variables as input, the output data they produce are also random variables. A stochastic process \(a collection of random variables ordered over time) is used to represent these outputs so they can be analyzed statistically.
- *Correlation Function Illustration:* For the M/M/1 queue, the stochastic process of delays in queue \(#mi("D_1, D_2, \\dots")) is highly autocorrelated because #mi("D_{i+1} = \\max\\{D_i + S_i - A_{i+1}, 0\\}"). Therefore, the correlation function #mi("\\rho_j") starts strongly positive at lag #mi("j=1") and gradually decreases as the lag #mi("j") increases, demonstrating positive dependence between successive customer delays.

*2. b. Explain hypothesis testing including null and alternative hypothesis for mean. What is the difference type I error and type II error? Explain and illustrate the strong law of large number. \(07)*

- *Hypothesis Testing:* A test evaluating whether the true mean equals a predetermined specific value \(#mi("\\mu_0")).
  - *Null Hypothesis \(#mi("H_0")):* The true mean equals the specific value \(#mi("\\mu = \\mu_0")).
  - *Alternative Hypothesis \(#mi("H_1")):* The true mean does not equal the specific value \(#mi("\\mu \\neq \\mu_0")).
- *Type I vs Type II Error:* A *Type I error* occurs when you reject the null hypothesis when it is actually true. A *Type II error* occurs when you fail to reject the null hypothesis when it is actually false.
- *Strong Law of Large Numbers:* This law guarantees that as the sample size #mi("n") approaches infinity, the sample mean #mi("\\bar{X}(n)") will securely converge to the true underlying mean #mi("\\mu") with a probability of 1. It is illustrated by tossing a fair die continuously or tracking steady-state performance; as observations mount, early random fluctuations smooth out and the calculated average permanently hones in on the true expected value.

*3. a. Write the properties of location, scale, and shape parameters of continuous distributions. What is inverse transform function? Let X have the exponential distribution with mean #mi("\\beta"). Generate the desired random variate using the inverse transform function. \(07)*

- *Parameters:* A *location* parameter \(#mi("\\gamma")) shifts the distribution curve along the horizontal axis, specifying a minimum bounds condition \(e.g., #mi("X > \\gamma")). A *scale* parameter \(#mi("\\beta")) dictates the statistical spread or dispersion \(stretching/shrinking) of the curve. A *shape* parameter \(#mi("\\alpha")) dictates the fundamental skewness and form of the curve.
- *Inverse Transform Function:* A variate-generation technique where exactly one uniform random number #mi("U \\sim U(0, 1)") is generated and monotonically transformed using the inverse of the target cumulative distribution function \(#mi("F^{-1}(U)")) to return a random variate of the target distribution.
- *Generate Exponential Variate:* For an exponential distribution with mean #mi("\\beta"), set the uniform random number #mi("U") to the cumulative distribution function and solve for #mi("X"). The function generates the desired random variate via the formula: *#mi("X = -\\beta \\ln U")*.

*3. b. What is Monte Carlo Method? Write down the difference between monte-carlo and stochastic simulation. \(02)*

- *Monte Carlo Method:* A simulation scheme employing uniformly distributed #mi("U(0, 1)") random variates to solve deterministic or stochastic mathematical problems that are too complex for analytical solutions.
- *Difference:* A Monte Carlo simulation is frequently static \(e.g., used to evaluate a deterministic integral where time plays no role), whereas a typical stochastic simulation is dynamic, meaning it models a system as it evolves discretely or continuously over time.

*3. c. Define Monte-Carlo method. Solve the integrals #mi("I = \\int_{1}^{5} \\frac{x^4}{3} dx") by monte-carlo method. \(05)*

- *Definition:* \(Same as 3.b). A numerical technique utilizing random uniform sampling to estimate complex mathematical properties, such as areas under a curve.
- *Solution using the "Hit or Miss" Monte Carlo technique:* \
To solve the integral #mi("I = \\int_{1}^{5} f(x) dx") where #mi("f(x) = \\frac{x^4}{3}"):
  - *1. Identify Bounding Box:* The x-axis is bounded by \$#mi(". The maximum value of the function on this interval is at ")x = 5\$, giving #mi("f(5) = \\frac{5^4}{3} = \\frac{625}{3} \\approx 208.33").
  - *2. Scale coordinates:*
    - The prompt specifies X numbers #mi("48, 36, 44 \\dots"). To correctly scale these inside the #mi("x \\in") boundaries, we divide them by 10 to obtain #mi("X_i"): `4.8, 3.6, 4.4, 4.1, 4.6, 1.8, 3.2, 4.1, 2.3, 2.3`.
    - The prompt specifies #mi("Y") values `.52, .18 \dots` as standard #mi("U(0, 1)") random numbers. To scale them inside the y-boundaries #mi("[0, 208.33]"), we multiply them by #mi("208.33") to obtain #mi("Y_i").
  - *3. Test Hits:* We compare #mi("Y_i \\le f(X_i)"): \
  1. #mi("X=4.8, f(X)=176.95"). #mi("Y=0.52 \\times 208.33 = 108.33"). \(HIT) \
  2. #mi("X=3.6, f(X)=55.99"). #mi("Y=0.18 \\times 208.33 = 37.50"). \(HIT) \
  3. #mi("X=4.4, f(X)=124.94"). #mi("Y=0.30 \\times 208.33 = 62.50"). \(HIT) \
  4. #mi("X=4.1, f(X)=94.19"). #mi("Y=0.88 \\times 208.33 = 183.33"). \(MISS) \
  5. #mi("X=4.6, f(X)=149.25"). #mi("Y=0.21 \\times 208.33 = 43.75"). \(HIT) \
  6. #mi("X=1.8, f(X)=3.50"). #mi("Y=0.25 \\times 208.33 = 52.08"). \(MISS) \
  7. #mi("X=3.2, f(X)=34.95"). #mi("Y=0.57 \\times 208.33 = 118.75"). \(MISS) \
  8. #mi("X=4.1, f(X)=94.19"). #mi("Y=0.82 \\times 208.33 = 170.83"). \(MISS) \
  9. #mi("X=2.3, f(X)=9.33"). #mi("Y=0.90 \\times 208.33 = 187.50"). \(MISS) \
  10. #mi("X=2.3, f(X)=9.33"). #mi("Y=0.63 \\times 208.33 = 131.25"). \(MISS)
  - *4. Final Calculation:* The ratio of hits to total samples \(#mi("N=10")) is #mi("4/10 = 0.4").
    - #mi("\\text{Area of the bounding box} = (5 - 1) \\times 208.33 = 833.33").
    - #mi("\\text{Integral Estimate} = \\text{Area} \\times \\text{Hit Ratio} = 833.33 \\times 0.4 = \\mathbf{333.33}") _\(Note: The true analytical solution is roughly 208.26, however because the Monte Carlo method is an approximation based on a very small sample size of 10, variance/deviation is entirely expected)._

#line(length: 100%)

== *Final Examination of B.Sc. Engg. CSE July-December/2020*

*1. \(a) Describe the iterative process of verification and validation of simulation models. \(02)*

- *Verification* is the process of debugging the simulation computer program to ensure the "assumptions document" has been correctly translated into code.
- *Validation* is the process of determining whether a simulation model is an accurate representation of the actual system for the particular objectives of the study.
- *The Iterative Process:* A sound simulation study is not a simple sequential process; as you proceed, it is often necessary to go back to previous steps. If the assumptions document is found to be invalid during a structured walk-through, analysts must return to the data collection and model definition phase. Similarly, if the programmed model fails validation tests \(e.g., its output does not closely resemble the expected real-world output), the model must be calibrated or its assumptions revised, forcing the developer to return to the programming or assumption-building stages. This feedback loop continues until the model establishes credibility and is accepted for decision-making.

*1. \(b) Define the following terminologies: \(i) Arrival rate \(ii) Service rate \(02)*

- *Arrival rate \(#mi("\\lambda")):* If the interarrival times \(#mi("A_1, A_2, \\dots")) between successive customers are assumed to be independent and identically distributed \(IID) random variables, then their mean \(or expected) interarrival time is #mi("E(A)"). The arrival rate of customers is defined as #mi("\\lambda = 1/E(A)").
- *Service rate \(#mi("\\omega")):* If the service times \(#mi("S_1, S_2, \\dots")) of customers are assumed to be IID random variables, then their mean service time is #mi("E(S)"). The service rate of a server is defined as #mi("\\omega = 1/E(S)").

*1. \(c) Simulate the pure pursuit problem to determine if the pursuit is ended/abandoned. \(10)* \
_\(Note: I simulated this step-by-step mathematically using Python since the provided text does not contain this problem.)_ \
At each minute #mi("t"), the fighter calculates its distance to the bomber. If the distance #mi("\\le 12") km, the pursuit ends with a hit. Otherwise, the fighter points directly at the bomber's position at time #mi("t") and travels at a speed of #mi("30") km/min for the next 1 minute.

- *Time #mi("t=0"):* Bomber is at #mi("(160, 0)"). Fighter is at #mi("(100, 50)").
  - Distance = #mi("\\sqrt{(160-100)^2 + (0-50)^2} = 78.10") km.
  - Fighter flies towards #mi("(160, 0)"). New fighter position at #mi("t=1") becomes #mi("x = 123.05, y = 30.79").
- *Time #mi("t=1"):* Bomber is at #mi("(161, 4)"). Fighter is at #mi("(123.05, 30.79)").
  - Distance = #mi("\\sqrt{(161-123.05)^2 + (4-30.79)^2} = 46.46") km.
  - Fighter flies towards #mi("(161, 4)"). New fighter position at #mi("t=2") becomes #mi("x = 147.55, y = 13.49").
- *Time #mi("t=2"):* Bomber is at #mi("(167, 9)"). Fighter is at #mi("(147.55, 13.49)").
  - Distance = #mi("\\sqrt{(167-147.55)^2 + (9-13.49)^2} = 19.96") km.
  - Fighter flies towards #mi("(167, 9)"). New fighter position at #mi("t=3") becomes #mi("x = 176.78, y = 6.74").
- *Time #mi("t=3"):* Bomber is at #mi("(172, 11)"). Fighter is at #mi("(176.78, 6.74)").
  - Distance = #mi("\\sqrt{(172-176.78)^2 + (11-6.74)^2} = \\mathbf{6.41}") *km*.
- *Conclusion:* Because the distance at #mi("t=3") \(6.41 km) is less than 12 km, the fighter successfully fires a missile. *The pursuit ends \(bomber shot down) at time #mi("t=3").*

#line(length: 100%)

*5. \(a) What is a stochastic process? Write the probability mass function of Poisson distribution. List several applications of Poisson distribution. \(7)*

- *Stochastic process:* A stochastic process is a collection of "similar" random variables ordered over time, which are all defined on a common sample space.
- *Probability Mass Function \(PMF) of Poisson Distribution:* For a parameter #mi("\\lambda > 0"), the PMF is #mi("p(x) = \\frac{e^{-\\lambda} \\lambda^x}{x!}") for #mi("x \\in \\{0, 1, \\dots\\}").
- *Applications:* It is used to model the number of events that occur in an interval of time when the events are occurring at a constant rate, the number of items in a batch of random size, and the number of items demanded from an inventory.

*5. \(b) Write the density function of the normal curve. Generate ten random observations from Normal distribution with a mean 15 and standard deviation 5. \(7)*

- *Density function:* #mi("f(x) = \\frac{1}{\\sigma\\sqrt{2\\pi}} \\exp\\left( -\\frac{(x-\\mu)^2}{2\\sigma^2} \\right)") for #mi("-\\infty < x < \\infty").
- *Random Observations:* _\(Note: I used Python to computationally generate these 10 random observations from a normal distribution with #mi("\\mu=15") and #mi("\\sigma=5"))_: \
`10.23, 12.70, 12.00, 13.40, 18.61, 6.41, 13.32, 12.57, 10.58, 14.42`

#line(length: 100%)

*6. \(a) & \(b) COVID-19 scenario and SIR model \(14)* \
_\(Please note: The specific epidemiological concepts of COVID-19 curves and the SIR model are not discussed in your provided sources. The following relies on standard mathematical epidemiology knowledge.)_

*6\(a) COVID-19 scenarios using Exponential distribution:*

- *\(i) Exponential growth and decay:* In the early stages of a pandemic, without mitigation, the virus spreads unhindered. The number of active cases grows exponentially, modeled as #mi("I(t) = I_0 e^{rt}") \(where #mi("r > 0")). Conversely, when strict measures \(lockdowns, masks) drop the reproduction number below 1, the number of active cases experiences exponential decay, modeled as #mi("I(t) = I_0 e^{-rt}").
- *\(ii) Tapering off at herd immunity:* As more people get infected and recover \(or get vaccinated), the susceptible population shrinks. The exponential growth curve turns into a logistic curve \(an S-shape) because the virus starts running out of available hosts, forcing the infection rate to flatten out and taper off.
- *\(iii) Restrictions lifted too soon:* If public health restrictions are lifted while the virus is in exponential decay but still present in the population, the effective reproduction number jumps back above 1. This causes the decaying curve to drastically pivot, initiating a brand new exponential growth curve \(often called a "second wave").

*6\(b) Application of SIR model, schematic, #mi("I_{max}"), and solution curves:*

- *Application:* The SIR model is a set of differential equations used to predict the spread of infectious diseases across a population over time.
- *Schematic:* The population is divided into three consecutive compartments: *S #mi("\\to") I #mi("\\to") R*.
  - *S \(Susceptible):* Individuals who can catch the disease.
  - *I \(Infected/Infectious):* Individuals who have the disease and can spread it.
  - *R \(Recovered/Removed):* Individuals who have recovered and gained immunity \(or passed away) and can no longer spread it.
- *Maximum number of infected \(#mi("I_{max}")):* This is the mathematical peak of the epidemic curve. It occurs at the exact moment when the rate of new infections equals the rate of recoveries. After this threshold, the number of active infections begins to drop. Flattening the curve aims to keep #mi("I_{max}") below the healthcare system's maximum capacity.
- *Solution curves:* When plotted on a graph over time:
  - The *S-curve* starts high \(entire population) and strictly decreases.
  - The *R-curve* starts at 0 and strictly increases as people recover.
  - The *I-curve* starts near 0, rises exponentially to a peak \(#mi("I_{max}")), and then smoothly declines back to 0 as the epidemic runs its course.

_Note: For questions involving mathematical formulas and statistics not explicitly defined in the provided source text \(such as the Pollaczek-Khinchine formula, the Box-Muller method, and the specific mechanics of the Kolmogorov-Smirnov test computation), I have supplemented the answers with standard external mathematical knowledge._

#line(length: 100%)

== *Final Examination of B.Sc. Engg. \(CSE), July-December 2019*

*3. a) When the mid square random number generators produce unexpected result? Write down the qualities of an efficient random number generator. \(04)*

- *Unexpected results in mid-square:* The mid-square method can produce unexpected and invalid results because it has a strong tendency to degenerate fairly rapidly to zero, where it will stay forever. Furthermore, it is highly predictable \(completely determined once the initial seed is chosen) rather than being truly random.
- *Qualities of an efficient RNG:* An efficient generator should produce numbers that appear uniformly distributed on without exhibiting correlation with each other. From a practical standpoint, it should be fast, require very little storage, allow for exact reproducibility of a random sequence, have provisions to easily produce separate "streams" of random numbers, and be portable across different compilers and computers.

*3. b) Use Kolmogorov-Smirnov test with #mi("\\alpha= 0.05") to determine if these numbers are uniformly distributed over the interval 0 to 1. \(05)* \
First, sort the sequence of #mi("N=10") random numbers into increasing order \(#mi("X_{(i)}")): \
0.037, 0.17, 0.23, 0.29, 0.55, 0.65, 0.71, 0.78, 0.84, 0.97. \
Next, compute #mi("D^+") and #mi("D^-") using the formulas #mi("D^+ = \\frac{i}{N} - X_{(i)}") and #mi("D^- = X_{(i)} - \\frac{i-1}{N}") for #mi("i=1 \\dots 10").

- #mi("i=1"): #mi("D^+ = 0.1 - 0.037 = 0.063"), #mi("D^- = 0.037 - 0 = 0.037")
- #mi("i=2"): #mi("D^+ = 0.2 - 0.17 = 0.030"), #mi("D^- = 0.17 - 0.1 = 0.070")
- #mi("i=3"): #mi("D^+ = 0.3 - 0.23 = 0.070"), #mi("D^- = 0.23 - 0.2 = 0.030")
- #mi("i=4"): #mi("D^+ = 0.4 - 0.29 = 0.110"), #mi("D^- = 0.29 - 0.3 = -0.010")
- #mi("i=5"): #mi("D^+ = 0.5 - 0.55 = -0.050"), #mi("D^- = 0.55 - 0.4 = 0.150")
- #mi("i=6"): #mi("D^+ = 0.6 - 0.65 = -0.050"), #mi("D^- = 0.65 - 0.5 = 0.150")
- #mi("i=7"): #mi("D^+ = 0.7 - 0.71 = -0.010"), #mi("D^- = 0.71 - 0.6 = 0.110")
- #mi("i=8"): #mi("D^+ = 0.8 - 0.78 = 0.020"), #mi("D^- = 0.78 - 0.7 = 0.080")
- #mi("i=9"): #mi("D^+ = 0.9 - 0.84 = 0.060"), #mi("D^- = 0.84 - 0.8 = 0.040")
- #mi("i=10"): #mi("D^+ = 1.0 - 0.97 = 0.030"), #mi("D^- = 0.97 - 0.9 = 0.070")

The maximum positive deviation is #mi("\\max(D^+) = 0.110"). The maximum negative deviation is #mi("\\max(D^-) = 0.150"). \
The test statistic #mi("D = \\max(0.110, 0.150) = \\mathbf{0.150}"). \
Because #mi("D = 0.150") is less than the critical value of #mi("0.410"), we *fail to reject the null hypothesis*. The numbers can be considered uniformly distributed over the interval 0 to 1.

*3. c) Use the multiplicative congruential method to generate a sequence of 10 three-digit random numbers. Let, #mi("r_0 = 117, a = 3, m = 1000"). \(05)* \
Using the formula #mi("r_i = (a \\times r_{i-1}) \\pmod m"):

+ #mi("r_1 = (3 \\times 117) \\pmod{1000} = 351")
+ #mi("r_2 = (3 \\times 351) \\pmod{1000} = 1053 \\pmod{1000} = 053")
+ #mi("r_3 = (3 \\times 53) \\pmod{1000} = 159")
+ #mi("r_4 = (3 \\times 159) \\pmod{1000} = 477")
+ #mi("r_5 = (3 \\times 477) \\pmod{1000} = 1431 \\pmod{1000} = 431")
+ #mi("r_6 = (3 \\times 431) \\pmod{1000} = 1293 \\pmod{1000} = 293")
+ #mi("r_7 = (3 \\times 293) \\pmod{1000} = 879")
+ #mi("r_8 = (3 \\times 879) \\pmod{1000} = 2637 \\pmod{1000} = 637")
+ #mi("r_9 = (3 \\times 637) \\pmod{1000} = 1911 \\pmod{1000} = 911")
+ #mi("r_{10} = (3 \\times 911) \\pmod{1000} = 2733 \\pmod{1000} = 733") \
The sequence is: *351, 053, 159, 477, 431, 293, 879, 637, 911, 733*.

*1. a) What is stochastic process? \(02)* \
A stochastic process is a collection of "similar" random variables ordered over time, which are all defined on a common sample space. It is used to map the uncertainty of input variables over time to represent simulation outputs.

*1. b) A pair of dice is rolled once. Determine the probability distribution of x. What is the probability that x is even? \(04)* \
The random variable #mi("x") \(sum of two dice) takes discrete values from 2 to 12. Its probability distribution is:

- P\(2) = 1/36
- P\(3) = 2/36
- P\(4) = 3/36
- P\(5) = 4/36
- P\(6) = 5/36
- P\(7) = 6/36
- P\(8) = 5/36
- P\(9) = 4/36
- P\(10) = 3/36
- P\(11) = 2/36
- P\(12) = 1/36 \
The probability that #mi("x") is even is the sum of the probabilities of all even outcomes: #mi("P(\\text{Even}) = P(2) + P(4) + P(6) + P(8) + P(10) + P(12) = \\frac{1+3+5+5+3+1}{36} = \\frac{18}{36} = \\mathbf{0.5}").

*1. c) Why is Gaussian distribution called bell curve? \(02)* \
The Gaussian \(Normal) distribution is called a "bell curve" because its continuous probability density function naturally forms a perfectly symmetrical, bell-shaped graph that peaks at the mean and tapers off evenly toward the tails.

*1. d) Generate five random observations from Normal distribution with mean = 5 and standard deviation 4. \(04)* \
_\(Using the Box-Muller method)_ \
If #mi("U_1") and #mi("U_2") are independent #mi("U(0, 1)") random numbers, a standard normal variate #mi("Z") is calculated as #mi("Z = \\sqrt{-2 \\ln U_1} \\cos(2\\pi U_2)"). We then scale it to the desired distribution using #mi("X = \\mu + \\sigma Z = 5 + 4Z"). \
Assume we draw pairs of #mi("U_1, U_2"):

+ #mi("U_1=0.5, U_2=0.5 \\rightarrow Z_1 \\approx -1.177 \\rightarrow X_1 \\approx 5 + 4(-1.177) = \\mathbf{0.29}")
+ #mi("U_1=0.2, U_2=0.8 \\rightarrow Z_1 \\approx 0.555 \\rightarrow X_2 \\approx 5 + 4(0.555) = \\mathbf{7.22}")
+ #mi("U_1=0.7, U_2=0.1 \\rightarrow Z_1 \\approx 0.683 \\rightarrow X_3 \\approx 5 + 4(0.683) = \\mathbf{7.73}")
+ #mi("U_1=0.9, U_2=0.3 \\rightarrow Z_1 \\approx -0.142 \\rightarrow X_4 \\approx 5 + 4(-0.142) = \\mathbf{4.43}")
+ #mi("U_1=0.3, U_2=0.6 \\rightarrow Z_1 \\approx -1.256 \\rightarrow X_5 \\approx 5 + 4(-1.256) = \\mathbf{-0.02}")

*1. e) Give some applications of Poisson distribution. \(02)* \
The Poisson distribution is commonly used to model the number of arrivals to a system in a fixed time interval \(e.g., customers arriving at a bank), the number of defective items in a batch, or the number of items demanded from an inventory.

*2. a) Define the following terminologies: \(i) Arrival rate \(ii) Service rate \(iii) Reneging. \(06)*

- *Arrival rate \(#mi("\\lambda")):* The expected number of entities or customers arriving to a system per unit of time.
- *Service rate \(#mi("\\nu") or #mi("\\omega")):* The expected number of entities or customers a server can process or complete per unit of time when continuously busy.
- *Reneging:* \(External knowledge) Occurs when a customer joins the queue but later decides to leave the queue without receiving service because the wait time is too long.

*2. b) Explain and illustrate the cost of customer waiting time and the idle capacity. \(03)* \
In system design, there is a fundamental trade-off. The cost of *customer waiting time* represents the penalty, dissatisfaction, or lost business when customers are delayed because servers are busy. The cost of *idle capacity* represents the money spent paying for resources \(servers/machines) when they are underutilized or idle. An optimal system balances these two: increasing servers reduces wait times \(improving service) but raises the overhead costs of having idle capacity.

*2. c) Estimate the average length of queue, average waiting time, and the server loading... \(03)* \
We can approximate this with an M/G/1 queuing model.

- *Arrival Rate \(#mi("\\lambda")):* Expected machine failures per day = #mi("0(0.50) + 1(0.30) + 2(0.20) = \\mathbf{0.7 \\text{ machines/day}}").
- *Service Time \(#mi("S")):* Expected time to repair a machine = #mi("1(0.65) + 2(0.30) + 3(0.05) = 0.65 + 0.6 + 0.15 = \\mathbf{1.4 \\text{ days}}").
- *Server Loading \(Utilization, #mi("\\rho")):* #mi("\\rho = \\lambda \\times E[S] = 0.7 \\times 1.4 = \\mathbf{0.98}"). \(Because #mi("0.98 < 1"), the system is stable but heavily loaded). \
To find queue characteristics, compute the variance of service time \(#mi("\\sigma^2")): \
#mi("E[S^2] = 1^2(0.65) + 2^2(0.30) + 3^2(0.05) = 0.65 + 1.20 + 0.45 = 2.30"). \
#mi("\\sigma^2 = E[S^2] - (E[S])^2 = 2.30 - (1.4)^2 = 0.34"). \
Using the *Pollaczek-Khinchine formula*:
- *Average length of queue \(#mi("L_q")):* #mi("L_q = \\frac{\\lambda^2 \\sigma^2 + \\rho^2}{2(1 - \\rho)} = \\frac{0.7^2(0.34) + 0.98^2}{2(1 - 0.98)} = \\frac{0.1666 + 0.9604}{0.04} = \\mathbf{28.175 \\text{ machines}}").
- *Average waiting time \(#mi("W_q")):* #mi("W_q = L_q / \\lambda = 28.175 / 0.7 = \\mathbf{40.25 \\text{ days}}").

*2. d) According to two servers in parallel queuing system, illustrate a mixture of components A and B pass through workstation I. \(02)* \
In a parallel system, components of Type A and Type B arrive at Workstation I independently \(perhaps with different arrival distributions and service requirements) but mix into a common logical pool. The components form a single FIFO queue, and whenever either of the two parallel servers at Workstation I becomes available, it processes the next component in line, regardless of whether it is Type A or Type B.

#line(length: 100%)

== *Final Exam of B. Sc. Engg. \(CSE), July-Dec. 2018*

*1. \(a). Discuss about the component used in next event time-advance approach. \(4)* \
The next-event time-advance approach relies on several components:

- *Simulation Clock:* A variable giving the current value of simulated time.
- *Event List:* A list maintaining the times of occurrence for all imminent future events.
- *System State Variables:* The collection of variables tracking the system at a given time \(e.g., server status, queue length).
- *Statistical Counters:* Variables storing statistical info \(e.g., total delays).
- *Routines:* An _Initialization routine_ sets the state at time 0. The _Timing routine_ advances the clock to the most imminent event. The _Event routines_ update the system state depending on the event type.

*1. \(b). Show the comparison between i) analytical solution and simulation ii) static simulation and dynamic simulation. \(4)*

- *i) Analytical solution vs. Simulation:* An analytical solution uses exact mathematical methods \(like calculus) to evaluate simple models and return a precise answer. Simulation uses a computer to evaluate a highly complex model numerically over time to _estimate_ characteristics.
- *ii) Static vs. Dynamic simulation:* A static simulation \(like Monte Carlo evaluation of a deterministic integral) represents a system where time plays no role. A dynamic simulation represents a system as it evolves discretely or continuously over time \(like tracking a factory line).

*1. \(c). Show the snapshot of computer representation at time 0 and at each of the 6 succeeding event times. \(6)* \
The system tracks interarrivals \(#mi("A_1=0.2, A_2=0.8, A_3=0.4, \\dots")) which map to absolute arrival times: 0.2, 1.0, 1.4, 3.4. \
The service times are #mi("S_1=1.5, S_2=1.0, S_3=0.6 \\dots")

+ *Time 0.0 \(Init):* Server idle, Queue=0. Next event: Arrival 1 at 0.2.
+ *Time 0.2 \(Arrival 1):* Customer 1 enters service. Server busy. Queue=0. Next event: Arrival 2 at 1.0. \(Departure 1 scheduled for #mi("0.2 + 1.5 = 1.7")).
+ *Time 1.0 \(Arrival 2):* Customer 2 joins queue. Server busy. Queue=1. Next event: Arrival 3 at 1.4. \(Departure 1 still at 1.7).
+ *Time 1.4 \(Arrival 3):* Customer 3 joins queue. Server busy. Queue=2. Next event: Departure 1 at 1.7.
+ *Time 1.7 \(Departure 1):* Customer 1 departs. Customer 2 leaves queue, enters service. Server busy. Queue=1. Next event: Departure 2 at #mi("1.7 + 1.0 = 2.7").
+ *Time 2.7 \(Departure 2):* Customer 2 departs. Customer 3 leaves queue, enters service. Server busy. Queue=0. Next event: Departure 3 at #mi("2.7 + 0.6 = 3.3").
+ *Time 3.3 \(Departure 3):* Customer 3 departs. Server becomes idle. Queue=0. Next event: Arrival 4 at 3.4.

*2. \(a). What are differences between next event time advance approach and fixed increment time advance approach? \(3)*

- *Next-event time-advance:* The simulation clock jumps strictly from the time of one event directly to the time of the most imminent future event. Periods of inactivity where the state doesn't change are skipped over entirely, making it exact and highly efficient for discrete events.
- *Fixed-increment time-advance:* The simulation clock is advanced in small, identical discrete slices of time #mi("\\Delta t"). At each "tick", the system checks if any events occurred during that slice. This approach can be inefficient if events are sparse and can introduce timing errors if multiple events fall into the same discrete time slice.

*2. \(b). What are the limitations of mid-square method? Evaluate the performance of Mid-square method if seeds are 6785, 1379, 1357. \(4)*

- *Limitations:* The mid-square method is not "random" \(it is completely predetermined by the seed), and it has a severe tendency to degenerate rapidly to zero or get stuck in a short loop, where it stays forever.
- *Evaluation:*
  - *Seed 6785:* #mi("6785^2 = 46,036,225"). Mid 4 digits = *0362*. \(#mi("0362^2 = 00131044 \\rightarrow 1310 \\dots"))
  - *Seed 1379:* #mi("1379^2 = 01,901,641"). Mid 4 digits = *9016*.
  - *Seed 1357:* #mi("1357^2 = 01,841,449"). Mid 4 digits = *8414*.

*2. \(c). Generate a sequence of 15 random numbers between 20 to 30 such that #mi("r_{n+1} = (7r_n + 15) \\bmod m"), where #mi("r_0 = 11, m = \\text{prime number}"). \(4)* \
Because the output values must map to a range, let's select a standard small prime number for the modulus, say *#mi("m = 31")*, and compute the raw sequence of pseudo-random numbers #mi("r_{n+1} = (7r_n + 15) \\pmod{31}").

+ #mi("r_1 = (7 \\times 11 + 15) \\bmod 31 = 92 \\bmod 31 = 30")
+ #mi("r_2 = (7 \\times 30 + 15) \\bmod 31 = 225 \\bmod 31 = 8")
+ #mi("r_3 = (7 \\times 8 + 15) \\bmod 31 = 71 \\bmod 31 = 9")
+ #mi("r_4 = (7 \\times 9 + 15) \\bmod 31 = 78 \\bmod 31 = 16")
+ #mi("r_5 = (7 \\times 16 + 15) \\bmod 31 = 127 \\bmod 31 = 3")
+ #mi("r_6 = (7 \\times 3 + 15) \\bmod 31 = 36 \\bmod 31 = 5")
+ #mi("r_7 = (7 \\times 5 + 15) \\bmod 31 = 50 \\bmod 31 = 19")
+ #mi("r_8 = (7 \\times 19 + 15) \\bmod 31 = 148 \\bmod 31 = 24")
+ #mi("r_9 = (7 \\times 24 + 15) \\bmod 31 = 183 \\bmod 31 = 28")
+ #mi("r_{10} = (7 \\times 28 + 15) \\bmod 31 = 211 \\bmod 31 = 25")
+ #mi("r_{11} = (7 \\times 25 + 15) \\bmod 31 = 190 \\bmod 31 = 4")
+ #mi("r_{12} = (7 \\times 4 + 15) \\bmod 31 = 43 \\bmod 31 = 12")
+ #mi("r_{13} = (7 \\times 12 + 15) \\bmod 31 = 99 \\bmod 31 = 6")
+ #mi("r_{14} = (7 \\times 6 + 15) \\bmod 31 = 57 \\bmod 31 = 26")
+ #mi("r_{15} = (7 \\times 26 + 15) \\bmod 31 = 197 \\bmod 31 = 11") \
To map this sequence to values strictly *between 20 and 30*, we treat the values as #mi("U_i = r_i / 31") and use the transformation #mi("X_i = 20 + (30 - 20) \\times U_i"). Thus, the 15 values are scaled sequentially \(e.g., #mi("X_1 = 20 + 10(30/31) \\approx 29.67"), #mi("X_2 \\approx 22.58"), etc.).

_\(Note: The exact algorithmic formulas for Linear Congruential Generators, standard variance/covariance definitions, and the specific properties of distribution parameters rely on the standard statistical knowledge established in our prior conversation history, as they are not explicitly detailed in the current text excerpts. I have integrated them below for complete answers)._

#line(length: 100%)

== *Final Examination of B.Sc. Engg.\(CSE), July-December/2022*

*1. a. Define system with example. Distinguish analytical solution versus simulation. Demonstrate different ways in which a system might be studied. \(05)*

- *System:* A system is defined to be a collection of entities \(such as people or machines) that act and interact together toward the accomplishment of some logical end. An example of a system is a bank consisting of tellers and the customers waiting in line or being served.
- *Analytical Solution vs. Simulation:* If the relationships that compose a mathematical model are simple enough, it may be possible to use mathematical methods \(such as algebra or calculus) to obtain an exact, closed-form *analytical solution*. However, most real-world systems are highly complex, precluding any possibility of an analytical solution; these models must instead be studied by means of *simulation*, where a computer evaluates the model numerically and gathers data to estimate the desired true characteristics.
- *Ways to Study a System:* A system can be studied by experimenting with the *actual system* itself, or if that is too costly or disruptive, by experimenting with a *model of the system*. Models are categorized as either *physical models* \(like miniature scale models) or *mathematical models*. Mathematical models can then be evaluated using an *analytical solution* or via *simulation*.

*1. b. Explain the next-event time-advance approach illustrated for the single-server queueing system. \(04)* \
In the *next-event time-advance approach*, the simulation clock is initialized to zero and the times of occurrence of future events are determined. The simulation clock is then advanced to the time of occurrence of the most imminent \(first) of these future events. At this point, the state of the system is updated to account for the event, and knowledge of the times of occurrence of future events is updated. The clock is then advanced to the time of the new most imminent event, skipping over periods of inactivity, and the cycle continues until a stopping condition is met.

*1. c. List the steps of simulation for a single-server queueing system? Describe the problem statement of the single-server queuing system. \(05)*

- *Problem Statement:* A single-server queueing system entails modeling a system where customers arrive with *independent and identically distributed \(IID) interarrival times* and require *IID service times*. A customer arriving to find the server idle enters service immediately, while a customer arriving to find the server busy joins the end of a single, first-in, first-out \(FIFO) queue. The simulation initializes in the "empty-and-idle" state and runs until a fixed number \(#mi("n")) of customers have completed their delays in queue. The objective is to estimate the expected average delay in queue, the expected time-average number of customers in the queue, and the expected server utilization.
- *Steps of Simulation:* The simulation operates by \(1) initializing the simulation clock and system state variables to zero, \(2) determining the most imminent event from the event list, \(3) advancing the simulation clock to this event time, \(4) executing the event routine to update the system state and statistical counters, \(5) generating future events \(like service completions) and adding them to the event list, and \(6) repeating the timing and event routines until the stopping condition is satisfied, which then triggers the report generator.

#line(length: 100%)

*2. a. How to compute variance, covariance, and correlation for simulation study. Why stochastic process is used to simulate the output data. Illustrate correlation function of the process of delays in queue D1, D2, .....for the M/M/1 queue. \(05)*

- *Variance, Covariance, and Correlation:* Based on #mi("n") generated random variates, the sample variance is computed as #mi("S^2(n) = \\frac{\\sum_{i=1}^n [X_i - \\bar{X}(n)]^2}{n - 1}"), and sample covariance is #mi("\\hat{C}_{XY}(n) = \\frac{\\sum_{j=1}^n [X_j - \\bar{X}(n)][Y_j - \\bar{Y}(n)]}{n - 1}"). Correlation is then computed as #mi("Cor(X, Y) = Cov(X, Y) / \\sqrt{Var(X) Var(Y)}").
- *Why Stochastic Process:* Because simulation models use random variables as input, the output data they produce are also random variables. A *stochastic process* \(defined as a collection of "similar" random variables ordered over time) is used to represent these outputs so they can be mathematically evaluated and analyzed statistically.
- *Correlation Function Illustration:* For the M/M/1 queue, the stochastic process of delays is defined recursively by #mi("D_1 = 0") and #mi("D_{i+1} = \\max\\{D_i + S_i - A_{i+1}, 0\\}"). Because of this relationship, successive delays #mi("D_i") and #mi("D_{i+1}") are *positively correlated*.

*2. b. Define verification, validation, and credibility in simulation model. Mention the issues in an accreditation decision. Show the timing relationship of validation, verification, and establishing credibility. Derive the mathematical formulation in a good estimate of the mean of the system using both validation and output analysis. \(06)*

- *Verification:* The process of determining whether the assumptions document has been correctly translated into a computer program; essentially, debugging the program.
- *Validation:* The process of determining whether a simulation model is an accurate representation of the system, for the particular objectives of the study.
- *Credibility:* Established when the manager and other key project personnel accept the model and its results as correct.
- *Accreditation Issues:* Issues evaluated in an accreditation decision include the verification and validation that have been done, the credibility of the model, the simulation model's development and use history, the quality of the available data, the quality of documentation, and any known problems or limitations with the model.
- *Timing Relationship:* Verification occurs primarily as the assumptions document is translated into the programmed model. Validation bridges the actual system against both the assumptions document and the simulation program over the model's development. Establishing credibility is an ongoing process connecting the programmed model to the ultimate goal of selling the results to management for the decision-making process.
- *Mathematical Formulation:* Let #mi("\\mu_S") be the true mean of the system, and let #mi("\\mu_M") be the true mean of the corresponding simulation model. If we make a simulation run and obtain an estimate #mi("\\hat{\\mu}_M") of #mi("\\mu_M"), then the error in #mi("\\hat{\\mu}_M") as an estimate of #mi("\\mu_S") is bound by the triangle inequality: \
#mi("|\\hat{\\mu}_M - \\mu_S| = |\\hat{\\mu}_M - \\mu_M + \\mu_M - \\mu_S| \\le |\\hat{\\mu}_M - \\mu_M| + |\\mu_M - \\mu_S|"). \
Validation is concerned with minimizing the second absolute value \(#mi("|\\mu_M - \\mu_S|")), while output analysis focuses on minimizing the first absolute value \(#mi("|\\hat{\\mu}_M - \\mu_M|")).

*2. c. Explain the inspection approach of statistical procedure for comparing real-world observation and simulation output data. \(03)* \
The *inspection approach* is a statistical procedure where an analyst computes one or more numerical statistics \(such as the sample mean, sample variance, or sample correlation function) from the real-world observations and compares them to the corresponding statistics from the model output data without the use of a formal statistical hypothesis test. The danger of this procedure is that each statistic is essentially a sample of size 1 from an underlying population, making the comparison highly vulnerable to the inherent randomness and fluctuations of the observations from both the system and the simulation model.

#line(length: 100%)

*3. a. List some sources of randomness for common simulation applications. Write the properties of location, scale, and shape parameters of continuous distributions \(04)*

- *Sources of Randomness:* In a manufacturing system, randomness often includes processing times, machine times to failure, and machine repair times. For defense-related systems, sources of randomness include arrival times and payloads of missiles or airplanes, the outcomes of an engagement, and miss distances.
- *Distribution Parameters:* A *location parameter* dictates the shift of the distribution along the horizontal axis, specifying minimum boundary conditions. A *scale parameter* dictates the statistical spread or dispersion \(stretching or shrinking) of the curve. A *shape parameter* dictates the fundamental form and skewness of the density curve.

*3. b. Many random number generators in use today are linear congruential generator, LCGs. Explain, how to obtain the desired random numbers from LCGs. What is inverse transform function? Let X have the exponential distribution with mean #mi("\\beta"), Generate the desired random variate using the inverse transform function. \(06)*

- *LCGs:* Linear Congruential Generators yield a sequence of pseudo-random numbers by using a recursive modular arithmetic function to output deterministic values that are then scaled proportionally to simulate #mi("U(0, 1)") random numbers.
- *Inverse Transform Function:* A variate-generation technique where exactly one uniform random number #mi("U \\sim U(0, 1)") is generated and monotonically transformed using the inverse of a target cumulative distribution function to return a random variate of the desired distribution.
- *Generating Exponential Variate:* To generate an exponential random variate #mi("X") with a mean of #mi("\\beta"), you generate a #mi("U(0, 1)") random number #mi("U"), and then apply the inverse algorithm formula to return the value *#mi("-\\beta \\ln U")* \(or equivalently, #mi("-\\beta \\ln(1 - U)")).

*3. c. What is the necessity of statistical analysis on simulation output data? Describe and illustrate transient and steady-state behavior of a stochastic process. \(04)*

- *Necessity of Statistical Analysis:* Because simulation models are driven by random samples from probability distributions, the simulation estimates they produce are just particular realizations of random variables that may have large variances. Without statistical analysis, relying on a single simulation run of arbitrary length can yield results that differ greatly from the true characteristics, leaving a significant probability of making erroneous inferences about the system.
- *Transient vs. Steady-State Behavior:* When analyzing simulation outputs #mi("Y_1, Y_2, \\dots"), the process begins with *transient distributions* that are heavily dependent on the specific initial conditions used to start the simulation. If the simulation runs long enough, it may reach a finite time index #mi("k+1") where the distributions of the random variables become approximately the same, having shaken off the bias of the initial conditions; this marks the beginning of *steady-state*. At steady-state, the variables approximately constitute a covariance-stationary stochastic process and cluster around the same true mean #mi("E(Y)"). This is illustrated by a plot showing transient probability density curves that shift continuously over the time axis before gradually smoothing out and stabilizing along a permanent, flat expected value line.