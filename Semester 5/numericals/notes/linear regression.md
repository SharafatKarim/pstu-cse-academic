# Linear regression

### 1. Cost Function

We use the **Mean Squared Error (MSE)**:

$$
J(m,b) = \frac{1}{n} \sum_{i=1}^{n} \big( y_i - (mx_i + b) \big)^2
$$

We want gradients:

* $\frac{\partial J}{\partial m}$
* $\frac{\partial J}{\partial b}$


### 2. Expand the Squared Term

For a single data point $(x_i, y_i)$:

$$
(y_i - (mx_i + b))^2
$$

Derivative will use the chain rule.


### 3. Gradient w\.r.t. $m$

$$
\frac{\partial J}{\partial m} 
= \frac{1}{n} \sum_{i=1}^n \frac{\partial}{\partial m} \Big[ (y_i - (mx_i + b))^2 \Big]
$$

Step 1: Apply chain rule:

$$
\frac{\partial}{\partial m} \Big[ (y_i - (mx_i + b))^2 \Big] 
= 2 \big( y_i - (mx_i + b) \big) \cdot \frac{\partial}{\partial m}(y_i - (mx_i + b))
$$

Step 2: Derivative of inside w\.r.t. $m$:

$$
\frac{\partial}{\partial m}(y_i - (mx_i + b)) = -x_i
$$

So:

$$
= 2 \big( y_i - (mx_i + b) \big)(-x_i)
$$

$$
= -2x_i \big( y_i - (mx_i + b) \big)
$$

Final formula:

$$
\frac{\partial J}{\partial m} = -\frac{2}{n} \sum_{i=1}^n x_i \Big( y_i - (mx_i + b) \Big)
$$


### 4. Gradient w\.r.t. $b$

$$
\frac{\partial J}{\partial b} 
= \frac{1}{n} \sum_{i=1}^n \frac{\partial}{\partial b} \Big[ (y_i - (mx_i + b))^2 \Big]
$$

Step 1: Apply chain rule:

$$
\frac{\partial}{\partial b} (y_i - (mx_i + b))^2 
= 2 (y_i - (mx_i + b)) \cdot \frac{\partial}{\partial b}(y_i - (mx_i + b))
$$

Step 2: Derivative of inside w\.r.t. $b$:

$$
\frac{\partial}{\partial b}(y_i - (mx_i + b)) = -1
$$

So:

$$
= 2 (y_i - (mx_i + b))(-1)
$$

$$
= -2 \big( y_i - (mx_i + b) \big)
$$

Final formula:

$$
\frac{\partial J}{\partial b} = -\frac{2}{n} \sum_{i=1}^n \Big( y_i - (mx_i + b) \Big)
$$
