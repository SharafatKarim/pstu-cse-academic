import numpy as np
import pandas as pd

def simulate_workshop(num_machines=5, sim_hours=8760):
    # Mean Time To Failure = 200 hours
    mttf = 200.0  
    
    weibull_shape = 1.5
    weibull_scale = 24.0
    
    production_rate = 10.0  

    results = []

    # --- Simulation Loop ---
    # Since machines are independent, we simulate their full timelines one by one
    for machine_id in range(1, num_machines + 1):
        clock = 0.0
        total_uptime = 0.0
        total_downtime = 0.0
        breakdown_count = 0
        
        while clock < sim_hours:
            time_to_fail = np.random.exponential(scale=mttf)
            
            if clock + time_to_fail > sim_hours:
                total_uptime += (sim_hours - clock)
                clock = sim_hours
                break
                
            total_uptime += time_to_fail
            clock += time_to_fail
            breakdown_count += 1
            
            # 2. Machine Breaks Down (Repair Phase)
            time_to_repair = np.random.weibull(a=weibull_shape) * weibull_scale
            
            if clock + time_to_repair > sim_hours:
                total_downtime += (sim_hours - clock)
                clock = sim_hours
                break
                
            total_downtime += time_to_repair
            clock += time_to_repair

        throughput = total_uptime * production_rate
        availability = (total_uptime / sim_hours) * 100
        
        results.append([
            f"Machine {machine_id}",
            breakdown_count,
            round(total_uptime, 1),
            round(total_downtime, 1),
            round(availability, 2),
            int(throughput)
        ])

    # --- Formatting Output ---
    df = pd.DataFrame(
        results,
        columns=[
            "Machine", 
            "Breakdowns", 
            "Uptime (hrs)", 
            "Downtime (hrs)", 
            "Availability (%)", 
            "Throughput (units)"
        ]
    )

    print("=" * 80)
    print(f"Lab 10: Machine Breakdown & Maintenance Simulation ({sim_hours} Hours)")
    print("=" * 80)
    print(df.to_string(index=False))
    print("-" * 80)
    
    # Calculate System-Wide Totals
    total_sys_downtime = df["Downtime (hrs)"].sum()
    total_sys_throughput = df["Throughput (units)"].sum()
    avg_sys_availability = df["Availability (%)"].mean()
    
    print("SYSTEM TOTALS:")
    print(f"  Total System Downtime:   {total_sys_downtime:.1f} hours")
    print(f"  Total System Throughput: {total_sys_throughput:,} units")
    print(f"  Average Availability:    {avg_sys_availability:.2f}%")
    print("=" * 80)

simulate_workshop()