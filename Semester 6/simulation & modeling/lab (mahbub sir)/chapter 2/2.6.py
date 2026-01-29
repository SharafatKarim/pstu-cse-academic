import random
import matplotlib.pyplot as plt


class ReliabilityProblem:
    def __init__(self, simulations=1000):
        self.simulations = simulations
        self.bearing_life_probabilities = {
            1000: 0.10,
            1100: 0.14,
            1200: 0.24,
            1300: 0.14,
            1400: 0.12,
            1500: 0.10,
            1600: 0.06,
            1700: 0.05,
            1800: 0.03,
            1900: 0.02,
        }

        self.delay_times_probabilities = {
            4: 0.30,
            6: 0.60,
            8: 0.10,
        }

    def run_single_repair(self, time_limit=30000):
        clock_1 = 0
        clock_2 = 0
        clock_3 = 0
        total_cost = 0

        for _ in range(self.simulations):
            life_1 = self.sample_from_distribution(self.bearing_life_probabilities)
            delay_1 = self.sample_from_distribution(self.delay_times_probabilities)
            clock_1 += life_1
            
            life_2 = self.sample_from_distribution(self.bearing_life_probabilities)
            delay_2 = self.sample_from_distribution(self.delay_times_probabilities)
            clock_2 += life_2 

            life_3 = self.sample_from_distribution(self.bearing_life_probabilities)
            delay_3 = self.sample_from_distribution(self.delay_times_probabilities)
            clock_3 += life_3


            cost_of_bearings = 3 * 20
            
            total_delay = delay_1 + delay_2 + delay_3
            repair_delay = 0
            if clock_1 == clock_2 == clock_3:
                repair_delay += 40 
            elif clock_1 == clock_2 or clock_2 == clock_3 or clock_1 == clock_3:
                repair_delay += 30 + 20
            else:
                repair_delay += 20 + 20 + 20
            downtime_cost = (total_delay + repair_delay) * 5

            print("Clocks: ", clock_1, clock_2, clock_3, " Lives: ", life_1, life_2, life_3, " Delays: ", delay_1, delay_2, delay_3)
            repairman_cost = repair_delay * 25 / 60
            total_cost += cost_of_bearings + downtime_cost + repairman_cost

            if min(clock_1, clock_2, clock_3) >= time_limit:
                break   
        
        return total_cost
    
    def run_all_repair(self, time_limit=30000):
        clock = 0
        total_delay = 0
        count = 0
        for _ in range(self.simulations):
            count += 1
            life_1 = self.sample_from_distribution(self.bearing_life_probabilities)
            life_2 = self.sample_from_distribution(self.bearing_life_probabilities)
            life_3 = self.sample_from_distribution(self.bearing_life_probabilities)
            clock += min(life_1, life_2, life_3)

            delay = self.sample_from_distribution(self.delay_times_probabilities)
            total_delay += delay
            print("Clock: ", clock, " Lives: ", life_1, life_2, life_3, " delays: ", delay)

            if clock >= time_limit:
                break
        cost_of_bearings = 3 * count * 20
        downtime_cost = (total_delay + (count * 40)) * 5
        repairman_cost = (count * 40) * 25 / 60
        total_cost = cost_of_bearings + downtime_cost + repairman_cost
        return total_cost

    def sample_from_distribution(self, distribution):
        rand_value = random.random()
        cumulative_probability = 0.0
        for value, probability in distribution.items():
            cumulative_probability += probability
            if rand_value <= cumulative_probability:
                return value
        return value  
    
if __name__ == "__main__":
    problem = ReliabilityProblem(simulations=300000)
    total_cost = problem.run_single_repair(30000)
    print("Total cost for single repair strategy over simulations: ", total_cost)
    total_cost_all_repair = problem.run_all_repair(30000)
    print("Total cost for all repair strategy over simulations: ", total_cost_all_repair)