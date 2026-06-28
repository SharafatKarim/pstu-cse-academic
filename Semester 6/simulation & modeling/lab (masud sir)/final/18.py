import random
import pandas as pd

def simulate_drive_thru(num_cars=50):
    mean_interarrival = 1.5  
    
    mean_service_order = 1.0   # Fast
    mean_service_pay = 0.5     # Very Fast
    mean_service_pickup = 2.5  # Slow 

    # --- Tracking Variables ---
    prev_dep_order = 0.0
    prev_dep_pay = 0.0
    prev_dep_pickup = 0.0
    
    current_arrival_time = 0.0
    
    wait_times_order = []
    wait_times_pay = []
    wait_times_pickup = []
    
    results = []

    # --- 2. Simulate Sequential Flow ---
    for car in range(1, num_cars + 1):
        current_arrival_time += random.expovariate(1.0 / mean_interarrival)
        arr_order = current_arrival_time
        
        start_order = max(arr_order, prev_dep_order)
        wait_order = start_order - arr_order
        dep_order = start_order + random.expovariate(1.0 / mean_service_order)
        prev_dep_order = dep_order
        wait_times_order.append(wait_order)
        
        arr_pay = dep_order
        start_pay = max(arr_pay, prev_dep_pay)
        wait_pay = start_pay - arr_pay
        dep_pay = start_pay + random.expovariate(1.0 / mean_service_pay)
        prev_dep_pay = dep_pay
        wait_times_pay.append(wait_pay)
        
        arr_pickup = dep_pay
        start_pickup = max(arr_pickup, prev_dep_pickup)
        wait_pickup = start_pickup - arr_pickup
        dep_pickup = start_pickup + random.expovariate(1.0 / mean_service_pickup)
        prev_dep_pickup = dep_pickup
        wait_times_pickup.append(wait_pickup)
        
        total_time_in_system = dep_pickup - arr_order
        
        results.append([
            f"Car {car}", 
            round(wait_order, 2), 
            round(wait_pay, 2), 
            round(wait_pickup, 2),
            round(total_time_in_system, 2)
        ])

    df = pd.DataFrame(results, columns=["Car", "Wait Order", "Wait Pay", "Wait Pickup", "Total Time"])
    
    avg_wait_order = sum(wait_times_order) / num_cars
    avg_wait_pay = sum(wait_times_pay) / num_cars
    avg_wait_pickup = sum(wait_times_pickup) / num_cars
    
    waits = {
        "Order Station": avg_wait_order,
        "Pay Window": avg_wait_pay,
        "Pickup Window": avg_wait_pickup
    }
    bottleneck_station = max(waits, key=waits.get) # type: ignore

    print("=" * 65)
    print("Lab 18: Fast-Food Drive-Thru Model (Tandem Queue)")
    print("=" * 65)
    print("First 5 Cars Output:")
    print(df.head(5).to_string(index=False))
    print("-" * 65)
    print("AVERAGE WAITING TIMES BY STATION:")
    print(f"  Order Station: {avg_wait_order:.2f} mins")
    print(f"  Pay Window:    {avg_wait_pay:.2f} mins")
    print(f"  Pickup Window: {avg_wait_pickup:.2f} mins")
    print("-" * 65)
    print(f"IDENTIFIED BOTTLENECK: *** {bottleneck_station.upper()} ***")
    print("=" * 65)

# Run the drive-thru simulation
random.seed(42)
simulate_drive_thru(num_cars=50)