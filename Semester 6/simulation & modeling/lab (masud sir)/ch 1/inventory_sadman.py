# Updated simulation: run all 9 (s,S) policies and show table-like output

import random
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# ----------------------------
# Fixed system parameters
# ----------------------------
SIM_TIME = 120  # months

K = 32.0
i = 3.0
h = 1.0
p = 5.0

INIT_INVENTORY = 60

# demand size distribution (CDF given in problem)
DEMAND_SIZES = [1, 2, 3, 4]
DEMAND_WEIGHTS = [1/6, 1/3, 1/3, 1/6]

MEAN_INTERDEMAND = 0.10
LEAD_TIME_MIN = 0.5
LEAD_TIME_MAX = 1.0

# policies (s, S)
policies = [
    (20, 40), (20, 60), (20, 80), (20, 100),
    (40, 60), (40, 80), (40, 100),
    (60, 80), (60, 100)
]

def demand_size():
    return random.choices(DEMAND_SIZES, weights=DEMAND_WEIGHTS)[0]

# ----------------------------
# Simulation function
# ----------------------------
def simulate_policy(s, S, plot=False):
    inventory = INIT_INVENTORY
    outstanding_order = 0
    order_arrival_time = None

    time = 0.0

    area_holding = 0.0
    area_backlog = 0.0
    total_order_cost = 0.0

    # store for plot
    time_points = [0.0]
    inventory_levels = [inventory]

    while time < SIM_TIME:

        time_to_demand = np.random.exponential(MEAN_INTERDEMAND)
        next_demand_time = time + time_to_demand

        if order_arrival_time is not None:
            next_event_time = min(next_demand_time, order_arrival_time)
        else:
            next_event_time = next_demand_time

        holding = max(inventory, 0)
        backlog = max(-inventory, 0)

        area_holding += holding * (next_event_time - time)
        area_backlog += backlog * (next_event_time - time)

        time = next_event_time

        # order arrival
        if order_arrival_time == time:
            inventory += outstanding_order
            outstanding_order = 0
            order_arrival_time = None

        # demand arrival
        else:
            inventory -= demand_size()

        # ordering decision
        if outstanding_order == 0 and inventory < s:
            Z = S - inventory
            total_order_cost += K + i * Z
            lead_time = random.uniform(LEAD_TIME_MIN, LEAD_TIME_MAX)
            order_arrival_time = time + lead_time
            outstanding_order = Z

        time_points.append(time)
        inventory_levels.append(inventory)

    avg_holding_cost = h * area_holding / SIM_TIME
    avg_backlog_cost = p * area_backlog / SIM_TIME
    avg_order_cost = total_order_cost / SIM_TIME
    total_cost = avg_holding_cost + avg_backlog_cost + avg_order_cost

    if plot:
        plt.figure()
        plt.step(time_points, inventory_levels, where="post")
        plt.xlabel("Time (months)")
        plt.ylabel("Inventory level I(t)")
        plt.title(f"Inventory Level Over Time (s={s}, S={S})")
        plt.show()

    return total_cost, avg_order_cost, avg_holding_cost, avg_backlog_cost

# ----------------------------
# Run all policies
# ----------------------------
results = []

for s, S in policies:
    total_c, order_c, hold_c, back_c = simulate_policy(s, S)
    results.append([
        f"({s}, {S})",
        round(total_c, 2),
        round(order_c, 2),
        round(hold_c, 2),
        round(back_c, 2)
    ])

df = pd.DataFrame(
    results,
    columns=[
        "Policy (s,S)",
        "Average total cost",
        "Average ordering cost",
        "Average holding cost",
        "Average shortage cost"
    ]
)

df
