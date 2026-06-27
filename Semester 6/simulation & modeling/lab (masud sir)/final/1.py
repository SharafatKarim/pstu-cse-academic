import math
import matplotlib.pyplot as plt
import random

def run_mm1_simulation(mean_interarrival, mean_service, max_customers):
    # System state variables
    server_status = 0  # 0 = idle, 1 = busy
    number_in_queue = 0
    times_of_arrival = []
    
    clock = 0.0
    time_of_last_event = 0.0
    
    # Initialize first events (Next departure is infinity since queue is empty)
    event_list_arrival = random.expovariate(1.0 / mean_interarrival)
    event_list_departure = math.inf
    
    # Statistical counters
    number_delayed = 0
    total_delay = 0.0
    area_under_q = 0.0
    area_under_b = 0.0
    
    # Plotting variables
    queue_times = [(0.0, 0)] 
    
    # Run until we have completed service for 'max_customers'
    while number_delayed < max_customers:
        
        # 1. Determine next event (Arrival vs. Departure)
        if event_list_arrival < event_list_departure:
            next_event_time = event_list_arrival
            event_type = "Arrival"
        else:
            next_event_time = event_list_departure
            event_type = "Departure"
            
        # 2. Update statistical areas BEFORE changing the state
        time_since_last_event = next_event_time - time_of_last_event
        area_under_q += number_in_queue * time_since_last_event
        area_under_b += server_status * time_since_last_event
        
        # 3. Advance the clock
        clock = next_event_time
        time_of_last_event = clock
        
        # 4. Handle the specific event
        if event_type == "Arrival":
            # Schedule the NEXT arrival
            event_list_arrival = clock + random.expovariate(1.0 / mean_interarrival)
            
            if server_status == 0:
                # Customer goes straight to service
                server_status = 1
                number_delayed += 1
                event_list_departure = clock + random.expovariate(1.0 / mean_service)
            else:
                # Customer goes to queue
                number_in_queue += 1
                times_of_arrival.append(clock)
                
        elif event_type == "Departure":
            if number_in_queue == 0:
                # Server becomes idle
                server_status = 0
                event_list_departure = math.inf
            else:
                # Next customer in queue enters service
                number_in_queue -= 1
                arrival_time = times_of_arrival.pop(0)
                delay = clock - arrival_time
                total_delay += delay
                number_delayed += 1
                event_list_departure = clock + random.expovariate(1.0 / mean_service)
                
        # Record data for plot
        queue_times.append((clock, number_in_queue))

    # --- Print Simulation Results ---
    print("=" * 50)
    print("M/M/1 Queueing System Simulation Results")
    print("=" * 50)
    print(f"Inputs:")
    print(f"  Mean Interarrival Time: {mean_interarrival}")
    print(f"  Mean Service Time:      {mean_service}")
    print(f"  Max Customers:          {max_customers}\n")
    
    print(f"Outputs:")
    print(f"  Average Delay in Queue:   {total_delay / max_customers:.4f} time units")
    print(f"  Average Number in Queue:  {area_under_q / clock:.4f} customers")
    print(f"  Server Utilization:       {(area_under_b / clock) * 100:.2f} %")
    print(f"  Time Simulation Ended:    {clock:.2f} time units")
    print("=" * 50)

    # --- Plotting ---
    times, queue_lengths = zip(*queue_times)
    plt.figure(figsize=(10, 5))
    plt.step(times, queue_lengths, where='post', color='b')
    plt.fill_between(times, queue_lengths, step="post", color='b', alpha=0.2)
    plt.xlabel('Time')
    plt.ylabel('Number in Queue')
    plt.title('Single-server Queue Length Over Time')
    plt.grid(True, alpha=0.3)
    plt.show()

# Run the simulation with valid M/M/1 parameters (arrival > service)
run_mm1_simulation(mean_interarrival=2.0, mean_service=1.0, max_customers=100)