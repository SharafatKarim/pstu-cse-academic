import math
import matplotlib.pyplot as plt
# Static Arrival and Service time
Arrival = [0.4, 1.2, 0.5, 1.7, 0.2, 1.6, 0.2, 1.4, 1.9]
Service = [2.0, 0.7, 0.2, 1.1, 3.7, 0.6]
ServiceNum = len(Service)

# System state variables
server_status = 0  # 0 means idle, 1 means busy
number_in_queue = 0
times_of_arrival = []
time_of_last_event = 0.0

clock = 0.0
event_list_arrival = 0.0
event_list_departure = 0.0

# Statistical counters
number_delayed = 0
total_delay = 0.0
area_under_q = 0.0
area_under_b = 0.0

# Plotting variables
queue_times = [] # (time, number_in_queue)
server_status_times = [] # (time, server_status)

import math

def handle_arrival():
    global server_status, number_in_queue, total_delay, number_delayed, event_list_departure, clock, area_under_b, area_under_q
    area_under_b += server_status * (clock - time_of_last_event)
    area_under_q += number_in_queue * (clock - time_of_last_event)
    if server_status == 0:
        number_delayed += 1
        server_status = 1
        event_list_departure = clock + Service.pop(0)
    else:
        number_in_queue += 1
        times_of_arrival.append(clock)

def handle_departure():
    global server_status, number_in_queue, total_delay, number_delayed, event_list_arrival, event_list_departure, clock, area_under_b, area_under_q
    area_under_b += server_status * (clock - time_of_last_event)
    area_under_q += number_in_queue * (clock - time_of_last_event)
    if number_in_queue == 0:
        server_status = 0
        event_list_departure = math.inf
    else:
        number_in_queue -= 1
        delay = clock - times_of_arrival.pop(0)
        total_delay += delay
        number_delayed += 1
        event_list_departure = clock + Service.pop(0)

def event_handler():
    global clock, event_list_arrival, event_list_departure, time_of_last_event, queue_times, server_status_times
    queue_times.append((clock, number_in_queue))
    server_status_times.append((clock, server_status))
    if not event_list_arrival and not event_list_departure:
        event_list_arrival = clock + Arrival.pop(0) if Arrival else 0.0
        time_of_last_event = clock
        clock += event_list_arrival if Arrival else 0.0
        return clock
    if event_list_arrival and (not event_list_departure or event_list_arrival <= event_list_departure):
        time_of_last_event = clock
        clock = event_list_arrival
        event_list_arrival = clock + Arrival.pop(0) if Arrival else 0.0
        # Handle arrival event
        handle_arrival()
    else:
        time_of_last_event = clock
        clock = event_list_departure
        # Handle departure event
        handle_departure()
    # queue_times.append((clock, number_in_queue))

iteration = 1
while number_delayed < ServiceNum:
    event_handler()

    print("-" * 100)
    print(f"Iteration: {iteration}")
    print("Clock:", clock)
    print("Event List Arrival:", event_list_arrival)
    print("Event List Departure:", event_list_departure)
    print("Server Status:", server_status)
    print("Number in Queue:", number_in_queue)
    print("Times of Arrival:", times_of_arrival)
    print("Number Delayed:", number_delayed)
    print("Total Delay:", total_delay)
    print("Area Under Q:", area_under_q)
    print("Area Under B:", area_under_b)
    iteration += 1

print("Single-server Queueing System Simulation Results")
print("-" * 100)

print("Mean interarrival time:", clock / number_delayed)
print("Mean service time:", (clock - total_delay) / number_delayed)
print("Number of Customers:", number_delayed)

print()
print("Average Delay in Queue:", total_delay / number_delayed)
print("Average Number in Queue:", area_under_q / clock)
print("Server Utilization:", area_under_b / clock)
print("Time Simulation Ended:", clock)

times, queue_lengths = zip(*queue_times)
plt.step(times, queue_lengths, where='post')
plt.xlabel('Time')
plt.ylabel('Number in Queue')
plt.title('Single-server Queue Length Over Time')
plt.grid()
plt.show()
