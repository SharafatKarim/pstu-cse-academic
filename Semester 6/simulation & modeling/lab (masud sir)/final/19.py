import random
import heapq

def simulate_er_triage(num_patients=100, num_doctors=3):
    # --- 1. Generate Patient Arrivals ---
    patients = []
    current_arr = 0.0
    for i in range(num_patients):
        # A new patient arrives roughly every 5 minutes
        current_arr += random.expovariate(1.0 / 5.0) 
        
        # Assign Priority: 10% Critical, 30% Urgent, 60% Routine
        priority = random.choices([1, 2, 3], weights=[0.1, 0.3, 0.6])[0]
        
        # Assign treatment time (Critical patients take longer to treat)
        if priority == 1:
            service = random.uniform(30.0, 60.0)
        elif priority == 2:
            service = random.uniform(15.0, 30.0)
        else:
            service = random.uniform(5.0, 15.0)
            
        patients.append({'id': i+1, 'arrival': current_arr, 'priority': priority, 'service': service})

    # --- 2. System State Variables ---
    doctors = [0.0] * num_doctors  # Tracks when each doctor will be free
    waiting_room = []              # The Priority Queue (Heap)
    
    # Dictionaries to track wait times by priority level
    wait_times = {1: [], 2: [], 3: []}
    
    time = 0.0
    patient_idx = 0

    # --- 3. Event-Driven Simulation Loop ---
    # We run until all patients have arrived AND the waiting room is empty
    while patient_idx < num_patients or waiting_room:
        
        # Find the time of the next arrival and the next doctor becoming free
        next_arrival = patients[patient_idx]['arrival'] if patient_idx < num_patients else float('inf')
        next_doctor_free = min(doctors)
        
        # Advance the clock to the next event
        if not waiting_room and next_arrival > next_doctor_free:
            time = next_arrival
        else:
            time = min(next_arrival, next_doctor_free)
            
        # Event A: New patients arrive at this exact time
        while patient_idx < num_patients and patients[patient_idx]['arrival'] <= time:
            p = patients[patient_idx]
            # Push to priority queue. Heapq sorts by the first element (priority 1, 2, 3)
            # The second element (arrival time) acts as a FIFO tie-breaker for identical priorities
            heapq.heappush(waiting_room, (p['priority'], p['arrival'], p))
            patient_idx += 1
            
        # Event B: A doctor is free and someone is waiting
        for i in range(num_doctors):
            if doctors[i] <= time and waiting_room:
                # The heap automatically pops the most critical patient first!
                priority, arr, p = heapq.heappop(waiting_room)
                
                # Calculate how long they waited
                wait = time - arr
                wait_times[priority].append(wait)
                
                # The doctor is now busy until they finish treating this patient
                doctors[i] = time + p['service']

    # --- 4. Output Analysis ---
    print("=" * 65)
    print(f"Lab 19: ER Patient Flow (Priority Queue) - {num_doctors} Doctors")
    print("=" * 65)
    
    labels = {1: "Critical", 2: "Urgent", 3: "Routine"}
    
    for p_level in [1, 2, 3]:
        times = wait_times[p_level]
        count = len(times)
        avg_wait = sum(times) / count if count > 0 else 0
        max_wait = max(times) if count > 0 else 0
        
        print(f"Priority {p_level} ({labels[p_level]:<8}) | Total Patients: {count:<2}")
        print(f"  Average Wait: {avg_wait:.2f} mins")
        print(f"  Maximum Wait: {max_wait:.2f} mins")
        print("-" * 65)

# Run the simulation
random.seed(42)
simulate_er_triage(num_patients=100, num_doctors=3)