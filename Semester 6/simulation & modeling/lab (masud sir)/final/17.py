import random
import matplotlib.pyplot as plt

def simulate_atm_vestibule(num_atms=3, num_customers=100):
    # --- 1. System Parameters ---
    mean_interarrival = 1.0  
    mean_service = 2.5       
    
    atm_available_times = [0.0] * num_atms
    
    queue_events = []
    
    current_time = 0.0
    
    for customer_id in range(num_customers):
        current_time += random.expovariate(1.0 / mean_interarrival)
        arrival_time = current_time
        
        service_time = random.expovariate(1.0 / mean_service)
        
        earliest_atm_idx = atm_available_times.index(min(atm_available_times))
        time_atm_is_free = atm_available_times[earliest_atm_idx]
        
        if time_atm_is_free > arrival_time:
            queue_events.append((arrival_time, 1))
            queue_events.append((time_atm_is_free, -1))
            start_service_time = time_atm_is_free
        else:
            start_service_time = arrival_time
            
        departure_time = start_service_time + service_time
        atm_available_times[earliest_atm_idx] = departure_time

    # --- 3. Calculate Maximum Queue Length ---
    queue_events.sort(key=lambda x: x[0])
    
    current_queue_length = 0
    max_queue_length = 0
    
    plot_times = [0.0]
    plot_queue_lengths = [0]
    
    for event_time, queue_change in queue_events:
        current_queue_length += queue_change
        
        if current_queue_length > max_queue_length:
            max_queue_length = current_queue_length
            
        plot_times.append(event_time)
        plot_queue_lengths.append(current_queue_length)

    # --- Print Results ---
    print("=" * 55)
    print("Lab 17: Bank ATM System Simulation (Multi-Server)")
    print("=" * 55)
    print(f"Number of ATMs:        {num_atms}")
    print(f"Customers Processed:   {num_customers}")
    print(f"Mean Arrival Time:     {mean_interarrival} mins")
    print(f"Mean Service Time:     {mean_service} mins")
    print("-" * 55)
    print(f"MAXIMUM QUEUE LENGTH:  {max_queue_length} customers")
    print("=" * 55)

    # --- 4. Plotting ---
    plt.figure(figsize=(12, 5))
    
    plt.step(plot_times, plot_queue_lengths, where='post', color='darkblue', linewidth=2)
    plt.fill_between(plot_times, plot_queue_lengths, step="post", color='skyblue', alpha=0.4)
    
    plt.axhline(y=max_queue_length, color='red', linestyle='--', label=f'Max Queue = {max_queue_length}')
    
    plt.title('ATM Vestibule: Queue Length Over Time', fontsize=14)
    plt.xlabel('Simulation Time (Minutes)', fontsize=12)
    plt.ylabel('Number of Customers in Queue', fontsize=12)
    plt.yticks(range(0, max_queue_length + 2))
    plt.legend()
    plt.grid(alpha=0.3)
    
    plt.tight_layout()
    plt.show()

simulate_atm_vestibule(num_atms=3, num_customers=100)