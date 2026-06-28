import math
import random

def run_trace_simulation(max_customers=5):
    clock = 0.0
    server_status = 0      # 0 = Idle, 1 = Busy
    number_in_queue = 0
    customers_served = 0
    
    # Future Event List
    next_arrival = 2.0  
    next_departure = math.inf 
    
    def print_trace(step_name, event_time):
        """Helper function to print a formatted row of the trace log"""
        print(f"{step_name:<15} | {event_time:<7.2f} | {server_status:<6} | {number_in_queue:<5} | "
              f"{next_arrival:<7.2f} | {str(next_departure)[:7]:<9}")

    # --- Print Trace Header ---
    print("=" * 65)
    print("Lab 14: Discrete-Event Model Trace Log (Verification)")
    print("=" * 65)
    print(f"{'Event Type':<15} | {'Clock':<7} | {'Server':<6} | {'Queue':<5} | {'Next Arr':<7} | {'Next Dep':<9}")
    print("-" * 65)
    
    # Initial State
    print_trace("INITIALIZATION", clock)

    # --- Simulation Engine ---
    while customers_served < max_customers:
        
        # 1. Determine the next event
        if next_arrival < next_departure:
            event_type = "Arrival"
            clock = next_arrival
        else:
            event_type = "Departure"
            clock = next_departure
            
        # 2. Process the event
        if event_type == "Arrival":
            next_arrival = clock + random.uniform(1.0, 3.0) 
            
            if server_status == 0:
                server_status = 1
                next_departure = clock + random.uniform(2.0, 4.0) 
            else:
                number_in_queue += 1
                
        elif event_type == "Departure":
            customers_served += 1
            
            if number_in_queue > 0:
                number_in_queue -= 1
                next_departure = clock + random.uniform(2.0, 4.0)
            else:
                server_status = 0
                next_departure = math.inf
                
        print_trace(event_type, clock)

    print("=" * 65)
    print("Simulation Complete.")

# Run the trace program with a fixed seed for exact reproducibility
random.seed(42)
run_trace_simulation(max_customers=5)