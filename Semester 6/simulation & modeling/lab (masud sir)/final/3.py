import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

def simulate_continuous_review(s, S, plot=False):
    SIM_DAYS = 365
    
    MEAN_DEMAND = 1.1 
    STD_DEMAND = 0.3
    
    LEAD_TIME_DAYS = 3 

    # variable codsts    
    HOLDING_COST = 0.5
    SHORTAGE_COST = 2.0
    
    # --- State Variables ---
    inventory = 80.0
    order_in_transit = False
    days_until_delivery = 0
    
    # --- Trackers ---
    total_holding_cost = 0.0
    total_shortage_cost = 0.0
    inventory_levels = []

    # --- Daily Simulation Loop ---
    for day in range(SIM_DAYS):
        
        if order_in_transit and days_until_delivery == 0:
            inventory += S
            order_in_transit = False
            
        if order_in_transit:
            days_until_delivery -= 1
            
        daily_demand = max(0.0, np.random.normal(MEAN_DEMAND, STD_DEMAND))
        inventory -= daily_demand
        
        if inventory > 0:
            total_holding_cost += inventory * HOLDING_COST
        else:
            total_shortage_cost += abs(inventory) * SHORTAGE_COST
            
        # 5. Continuous Review: Check if we need to order
        # We only place a new order if we don't already have one on the way
        if inventory <= s and not order_in_transit:
            order_in_transit = True
            days_until_delivery = LEAD_TIME_DAYS
            
        # Record data for plotting
        inventory_levels.append(inventory)

    # --- Results ---
    if plot:
        plt.figure(figsize=(12, 5))
        # We use a standard plot instead of a step plot for daily aggregates
        plt.plot(range(SIM_DAYS), inventory_levels, label="Inventory Level", color="blue")
        plt.axhline(s, color='red', linestyle='--', label=f'Reorder Point (s={s})')
        plt.axhline(0, color='black', linewidth=1)
        plt.xlabel("Day")
        plt.ylabel("Inventory Level")
        plt.title(f"Continuous Review Inventory Simulation (s={s}, Reorder Qty={S})")
        plt.legend()
        plt.grid(alpha=0.3)
        plt.show()

    return total_holding_cost, total_shortage_cost

# --- Run a test scenario ---
reorder_point = 40
reorder_qty = 100

holding, shortage = simulate_continuous_review(s=reorder_point, S=reorder_qty, plot=True)

print("=" * 45)
print("Lab 03: Fiscal Year Simulation Results")
print("=" * 45)
print(f"Policy: Reorder Point (s) = {reorder_point}, Quantity (S) = {reorder_qty}")
print(f"Total Holding Cost:  ${holding:.2f}")
print(f"Total Shortage Cost: ${shortage:.2f}")
print(f"Total System Cost:   ${holding + shortage:.2f}")
print("=" * 45)