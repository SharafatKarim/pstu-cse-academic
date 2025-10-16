## 🧭 **Categorization of PSTU Questions According to AIMA (Russell & Norvig)**

### **Chapter 1–2: Introduction to Artificial Intelligence & Intelligent Agents**

**Topics Covered:**

* Definition of AI
* Rationality, autonomy
* Agents and environments
* PEAS description
* Structure of agents (simple reflex, model-based, goal-based, utility-based)

**Mapped Questions:**

* What does Artificial Intelligence mean? (2020, 2021, 2022, 2023)
* Define agent, rationality, autonomy, deterministic, stochastic.
* What is PEAS? Describe model-based reflex agent.
* Define agent program and task environment.
* “Measure performance of an agent based on environment.” — Justify. (2018)
* Define autonomy. Essay on relationship between evolution and learning/intelligence. (2023)
* How do components of agent programs work? Write pseudocode for goal-based & utility-based agents. (2023)

📘 **AIMA Chapters:**

* **Ch. 1:** Introduction
* **Ch. 2:** Intelligent Agents

---

### **Chapter 3–4: Solving Problems by Searching (Uninformed Search)**

**Topics Covered:**

* Problem-solving agents
* Search tree and graph
* BFS, DFS, UCS, IDS
* Evaluation criteria: completeness, optimality, time, space
* 8-puzzle, pathfinding examples
* Graph-search optimality proofs

**Mapped Questions:**

* Define problem-solving agent; steps of problem solving; 8-puzzle example. (2023)
* Compare BFS, DFS. (2020, 2021, 2022)
* Show 8-puzzle disjoint sets. (2020, 2022)
* Prove UCS and BFS (with constant cost) are optimal in GRAPH-SEARCH. (All years: 2020–2023)
* State space with constant step cost where IDS is suboptimal. (2021–2022)
* Compare four evaluation criteria. (2020–2022)
* Implement BFS and DFS; show time complexity. (Lab 2020)
* Compare IDS vs BFS in performance. (2023)

📘 **AIMA Chapters:**

* **Ch. 3:** Solving Problems by Searching
* **Ch. 4:** Beyond Classical Search

---

### **Chapter 4–5: Informed (Heuristic) Search**

**Topics Covered:**

* Heuristic function
* Best-first search, A* search
* Admissible and consistent heuristics
* Proofs of A* optimality
* Greedy search
* Iterative Deepening A*

**Mapped Questions:**

* What is heuristic function of informed search? (2020–2023)
* Explain A* search, best-first search, minimizing total estimated cost. (2020–2023)
* Show heuristic must be admissible/consistent for optimality. (2020–2023)
* Demonstrate Greedy Best-First Search and its incompleteness. (2018)
* A* search example from Oradea to Bucharest. (2018)
* Implement A* search in lab. (Sessional 2021)

📘 **AIMA Chapter:**

* **Ch. 3 & 4 (4th Ed):** Heuristic Search

---

### **Chapter 4–5: Local Search & Optimization Problems**

**Topics Covered:**

* Local search and optimization
* Hill climbing
* Simulated annealing
* Genetic algorithms
* Local beam search
* 4-Queens problem

**Mapped Questions:**

* Why local search? Advantages? (2020–2023)
* One-dimensional state-space landscape. (2022, 2023)
* Problems of hill climbing; escape via simulated annealing. (2020–2023)
* 4-queens problem — conflict reduction. (2020, 2021)
* Limitation of beam search; genetic algorithm for 8-queen. (2023)

📘 **AIMA Chapter:**

* **Ch. 4:** Beyond Classical Search (Section: Local Search and Optimization)

---

### **Chapter 5–6: Constraint Satisfaction Problems (CSP)**

**Topics Covered:**

* Constraint satisfaction formulation
* Map coloring problem (Australia)
* Constraint graph

**Mapped Questions:**

* Define CSP. Represent map coloring as CSP. (2020–2023)

📘 **AIMA Chapter:**

* **Ch. 5:** Constraint Satisfaction Problems

---

### **Chapter 6–7: Logical Agents & Propositional Logic**

**Topics Covered:**

* Knowledge-based agents
* Wumpus world environment
* Propositional logic sentences and inference
* Modus Ponens, Syllogism
* Proof of Wumpus location
* Syntax and semantics

**Mapped Questions:**

* Define knowledge-based agent; algorithm for KB-agent. (2021–2022)
* Derive propositional logic from Wumpus world. (2021–2023)
* Prove Wumpus is in (1,3) or (2,3). (2021–2023)
* Inference rules: Modus Ponens, Hypothetical Syllogism. (2023)
* Propositional equivalences (A ≡ B, etc.). (2020–2022)

📘 **AIMA Chapters:**

* **Ch. 7:** Logical Agents
* **Ch. 8:** First-Order Logic (partly overlaps)

---

### **Chapter 8–9: First-Order Logic**

**Topics Covered:**

* Quantifiers, predicates, functions
* Translating English to FOL
* Model-based reasoning

**Mapped Questions:**

* Define quantifiers; universal/existential with examples. (2023)
* Translate English sentences into FOL (Every gardener likes sun, etc.). (2020–2023)
* Develop first-order logic for King John model. (2022)

📘 **AIMA Chapter:**

* **Ch. 8:** First-Order Logic

---

### **Chapter 13–14: Probabilistic Reasoning & Bayesian Networks**

**Topics Covered:**

* Probability theory in AI
* Conditional, marginal, joint probabilities
* Bayes’ rule
* Naïve Bayes classifier
* Independence, conditional independence

**Mapped Questions:**

* Define conditional probability, Bayes’ rule, marginal probability. (2020–2023)
* Compute probability of liver disease given alcoholic. (2020–2023)
* Define conditional independence; derive naïve Bayes model. (2023)
* Naïve Bayes classifier (dentistry/weather example). (2020–2021)

📘 **AIMA Chapters:**

* **Ch. 12–14:** Probabilistic Reasoning (Uncertainty and Bayes)

---

### **Chapter 18–19: Learning from Examples**

**Topics Covered:**

* Supervised and unsupervised learning
* Decision tree learning
* Entropy and information gain
* Linear regression
* Gradient descent
* Cross-validation

**Mapped Questions:**

* Define supervised/unsupervised learning. (2016–2023)
* Decision tree learning using entropy & info gain. (2020–2023)
* Compute entropy, information gain for dataset. (2022–2023)
* Linear regression, univariate, gradient descent. (2020–2023)
* Empirical loss, K-fold cross-validation. (2023)
* Generalization vs empirical loss, model selection. (2020)

📘 **AIMA Chapters:**

* **Ch. 18:** Learning from Examples
* **Ch. 19:** Learning Probabilistic Models

---

### **Chapter 20–21: Neural Networks and Deep Learning**

**Topics Covered:**

* Neurons and perceptrons
* Activation functions
* Forward propagation, backpropagation
* Neural network vs human brain
* Learning and self-organization
* Applications of ANN

**Mapped Questions:**

* Define neural network; compare with human brain. (2016–2023)
* Components of NN; learning in neural nets. (2016)
* Activation functions. (2020)
* Backpropagation algorithm. (2020–2023)
* ANN applications. (2023)
* Lab: Estimate weights using backpropagation. (Sessional 2020)

📘 **AIMA Chapter:**

* **Ch. 20:** Deep Learning

---

### **Chapter 22: Reinforcement Learning**

**(Note: not heavily covered in PSTU exams)**
— Minor or no direct questions observed.

---

### **Chapter 23–24: Natural Language Processing (NLP)**

**Topics Covered:**

* Purpose of NLP
* N-gram models
* Web search algorithms (HITS)

**Mapped Questions:**

* Purposes of NLP; describe N-gram character model. (2022)
* HITS algorithm in web information retrieval. (2022)

📘 **AIMA Chapters:**

* **Ch. 23:** Natural Language Processing
* **Ch. 24:** Deep Learning for NLP

---

### **Miscellaneous / Application-Specific**

**Topics Covered:**

* Knowledge engineering (digital circuit reasoning)
* Robot hardware types
* Game theory & minimax (2018)
* Fuzzy logic and sets (2018)

📘 **AIMA Chapters:**

* **Ch. 10–11:** Knowledge Representation
* **Ch. 17:** Making Complex Decisions
* **Appendix / Fuzzy logic extensions**

---

## 📊 **Summary Table**

| Category                    | AIMA Chapter | Key Topics                            | Example PSTU Questions |
| --------------------------- | ------------ | ------------------------------------- | ---------------------- |
| Introduction to AI & Agents | 1–2          | AI, Agents, Rationality, PEAS         | 2020–2023              |
| Uninformed Search           | 3–4          | BFS, DFS, UCS, IDS                    | 2020–2023              |
| Informed Search             | 3–4          | Heuristics, A*, Admissibility         | 2020–2023              |
| Local Search                | 4            | Hill Climbing, Simulated Annealing    | 2020–2023              |
| CSP                         | 5            | Map Coloring                          | 2020–2023              |
| Logic (Propositional)       | 7            | Wumpus World, Inference               | 2021–2023              |
| First Order Logic           | 8            | Quantifiers, FOL Translation          | 2020–2023              |
| Probability & Bayes         | 12–14        | Bayes Rule, Naïve Bayes               | 2020–2023              |
| Learning                    | 18–19        | Decision Tree, Regression, Validation | 2020–2023              |
| Neural Networks             | 20–21        | ANN, Backpropagation                  | 2016–2023              |
| NLP & IR                    | 23–24        | N-Gram, HITS                          | 2022                   |
| Miscellaneous               | 10–11, 17    | Knowledge Base, Robots, Fuzzy Logic   | 2018–2023              |
