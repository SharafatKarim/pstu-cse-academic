# AI - QS Categorized Edition

## Mahbub Sir

### Chapter 1: Introduction

* What does artificial intelligence mean? **(2022, 2021)**
* List the learning outcomes of AI. **(2022, 2020)**
* Define Artificial intelligence within 4 different paradigms with examples. **(2018)**
* "Do not measure the performance of an agent based on its behaviour. Measure the performance of an agent based on what is wanted in the environment." - justify these statements. **(2018)**
* "Exponential time or space complexity is very expensive" - justify with an example in terms of time and memory requirements. **(2018)**
* What is AI? Define in your own words: (a) intelligence, (b) artificial intelligence. **(2023)**
* There are well-known classes of problems that are intractably difficult for computers, and other classes that are provably undecidable. Does this mean that AI is impossible? **(2023)**

### Chapter 2: Intelligent Agents

* Define in your own words the following terminologies: agent, agent program, rationality, autonomy, deterministic, and stochastic. **(2022, 2020)**
* What is PEAS in specifying the task environment? **(2022, 2020)**
* Illustrate and describe the structure of the model-based reflex agent. **(2022, 2020)**
* Define logical agent. **(2021)**
* Write down a simple algorithm of a generic knowledge-based agent. **(2021)**
* What is a problem-solving agent? Write the steps of problem solving. **(2023)**
* What is rationality? Differentiate between human agent and artificial agent in terms of rationality. **(2018)**
* Define autonomy. Write an essay on the relationship between evolution and one or more of autonomy, intelligence, and learning. **(2023)**
* How do the components of agent programs work? Write pseudocode agent programs for the goal-based and utility-based agents. **(2023)**

### Propositional Logic (tpointtech)

* Define knowledge-based agents. **(2022)**
* Drive a propositional logic from the Wumpus world... **(2023, 2022, 2021)**
* Develop propositional rules for the wumpus world and prove that wumpus is in (1,3). **(2022)**
* Which of the following are correct? (Questions on logical equivalence like $A \equiv B$ vs $(A \equiv B)$). **(2022, 2021)**
* Write a recursive algorithm PL-TRUE(s,m) that returns true if and only if the sentence $s$ is true in the model $m$. **(2021)**
* Describe the following inference rules for propositional logic: Modus Ponens, Hypothetical Syllogism. **(2023)**

### First-Order Logic (tpointtech)

* Define quantifiers. Describe about universal and existential quantifiers with example. **(2023, 2022)**
* Translate the following English sentences to first order logic (e.g., "Every gardener likes the sun."). **(2023, 2022, 2021)**
* Develop first order logic for the model for the following facts (e.g., "King John is a person."). **(2022)**

### Inference in First-Order Logic (tpointtech)

* What is knowledge-engineering? Develop a knowledge base which will allow us to reason about a digital circuit (One-bit full adder). **(2023)**
* Consider the facts related... Now, find the result of the queries (a) ancestor(Jack, Fred)... **(2022)**

### Deep Learning (slides)

* Describe components of a neural network and discuss the similarities of neural network with human brain. **(2016)**
* What does "learning" mean referring to neural nets? **(2016)**
* Explain forward propagation and self-organization. **(2016)**
* Describe the multilayer perceptron neural networks. **(2021)**
* Illustrate and describe the standard activation functions. **(2020)**
* How to adjust the weights of perceptron in neural network? **(2020)**
* State the back-propagation algorithm for learning in a multilayer network. **(2023)**
* **Lab:** Estimate the weights of the following neural network using backpropagation neural network algorithm. **(Sessional 2020)**

### Robotics (slides)

* Define robot. Briefly describe different types of robot hardware. **(2021)**

## Masud Sir

### Chapter 3: Solving Problems by Searching (Uninformed and Informed Search)

* Prove that uniform-cost search and breadth-first search with constant step costs are optimal when used with the **GRAPH-SEARCH algorithm**. **(2022, 2021, 2020)**
* Compare the four evaluation criteria set of several uninformed search strategies. **(2022, 2021, 2020)**
* What is an uninformed search? / What is blind search? **(2022, 2021, 2020)**
* Compare breadth first search, BFS, and depth first search, DFS, algorithms. **(2022)**
* Show that the 8-puzzle states are divided into two disjoint sets... **(2022, 2020)**
* Show a state space with constant step costs in which GRAPH-SEARCH using iterative deepening finds a suboptimal solution. **(2022, 2021, 2020)**
* What is the heuristic function of an informed search strategy? **(2023, 2022, 2021, 2020)**
* How to minimize the total estimated solution cost using the best-first search, A\* search, algorithm. **(2023, 2022, 2021, 2020)**
* Show the heuristic must be admissible and consistent for the optimal solution in the A\* search algorithm. **(2023, 2022, 2021)**
* How to evaluate an algorithm's performance? **(2023, 2021)**
* Explain the iterative deepening depth-first search, IDS, algorithm with its performance evaluation. **(2023)**
* Compare the IDS and BFS algorithms for generating the total number of nodes if $b=10$ and $d=4$. **(2023)**
* Compare iterative deepening search (IDS) and breadth first search (BFS) in terms of performance measure? Which one is preferred when the search space is large and the depth of the solution is unknown? **(2018)**
* Demonstrate the working principle of A\* search to find a path from Oradea to Bucharest. **(2018)**
* **Lab:** Implement BFS and DFS algorithms based on the following graph. **(Sessional 2020)**
* **Lab:** Implement the A star search algorithm for estimating the cost-effective path from A to G. **(Sessional 2021)**

### Chapter 4: Beyond Classical Search (Local Search)

* Why do we use local search strategy to address optimization problem? What are the key advantages of local search algorithms? **(2023, 2022, 2021, 2020)**
* Demonstrate a one-dimensional state-space landscape in which elevation corresponds to the objective function. **(2023, 2022)**
* What are the reasons, problems, of the hill-climbing algorithm for getting stuck? How to escape these problems using the simulated-annealing search algorithm? **(2023, 2022, 2021, 2020)**
* Show how the last configuration of 4-queens on a 4×4 board has fewer conflicts than the first configuration using a local search strategy. **(2021, 2020)**
* Illustrate the genetic algorithm for digit strings representation of 8-queen states. **(2023)**
* **Lab:** Implement the Hill-climbing search algorithm for solving the following slide puzzle. **(Sessional 2021)**
* **Lab:** Implement the solution of 8 queen problem... using Hill Climbing algorithm. **(Sessional 2020)**

### Chapter 13: Quantifying Uncertainty

* Define the following terminologies: conditional probability, Bayes' rule, marginal probability, maximum likelihood, random variable. **(2022, 2021, 2020)**
* What is Bayes' rule? Compute the patient's probability of having liver disease if they are an alcoholic... **(2023, 2022, 2021, 2020)**
* Derive a naïve Bayes model, Bayesian classifier, based on the dentistry example. **(2023, 2020)**
* **Lab:** Implement the Naïve Bayes classifier for checking weather to play or not on weather data. **(Sessional 2021)**

### Chapter 18: Learning from Examples

* Define supervised learning, unsupervised learning, K-fold cross validation, and empirical loss. **(2023, 2022, 2020)**
* How to compute entropy and information gain from attributes in a dataset for building decision tree as a classifier? **(2023, 2022, 2020)**
* What is a univariate linear regression? How to minimize the loss using gradient descent for fitting linear regression? **(2023, 2022, 2021, 2020)**
* Distinguish generalization loss and empirical loss. **(2020)**
* **Lab:** Build a Decision Tree based on the following dataset. **(Sessional 2021, 2020)**

### Chapter 22: Natural Language Processing

* What are the purposes of natural language processing with AI? **(2022)**
* Describe N-gram character model. **(2022)**
* How HITS algorithm played important roles in developing our understanding of web information retrieval. **(2022)**

## Out of Syllabus

সিলেবাসের বাহিরে...

### Adversarial Search and Games

* Define a game. Differentiate between games and search problems. **(2018)**
* Demonstrate minimax algorithm and alpha-beta pruning with examples. **(2018)**
* Discuss on example of the application of game theory in a real life scenario. **(2018)**

### Constraint Satisfaction Problems

* Define constraint satisfaction problem, CSP. **(2023, 2022, 2021)**
* Formulate a map coloring problem of states and territories of Australia which can be viewed as a CSP problem. **(2023, 2022)**
* Represent the map-coloring problem as a constraint graph. **(2022, 2021)**
