import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation

# --- Simulation Configurations ---
ITERATIONS = [
    {"box_size": 10, "num_nodes": 4},
    {"box_size": 20, "num_nodes": 5},
    {"box_size": 30, "num_nodes": 6},
    {"box_size": 40, "num_nodes": 7}
]

NODE_SPEED = 2.0       # Constant speed
DURATION_FRAMES = 300  # Running duration
TIME_STEP = 0.1       
COLLISION_RADIUS = 1.0 # Distance threshold to count as a collision
TOTAL_SIMULATION_TIME = DURATION_FRAMES * TIME_STEP 

class ChaseSimulation:
    def __init__(self, box_size, num_nodes, speed):
        self.box_size = box_size
        self.num_nodes = num_nodes
        self.speed = speed
        self.positions = np.random.uniform(0, self.box_size, size=(self.num_nodes, 2))
        self.history = [self.positions.copy()]
        self.collision_points = []
        self.collision_counts_per_frame = [0]
        self.first_collision_time = None  # Track time of 1st collision

    def run_simulation(self, total_frames):
        current_collisions = 0
        for frame in range(total_frames):
            angles = np.random.uniform(0, 2 * np.pi, size=self.num_nodes)
            dx = self.speed * np.cos(angles) * TIME_STEP
            dy = self.speed * np.sin(angles) * TIME_STEP
            
            new_positions = self.positions + np.column_stack((dx, dy))
            
            # Check Node-to-Node Collisions
            for i in range(self.num_nodes):
                for j in range(i + 1, self.num_nodes):
                    dist = np.linalg.norm(new_positions[i] - new_positions[j])
                    if dist < COLLISION_RADIUS:
                        current_collisions += 1
                        midpoint = (new_positions[i] + new_positions[j]) / 2.0
                        self.collision_points.append((midpoint[0], midpoint[1], len(self.history)))
                        
                        # Record 1st collision time if not already captured
                        if self.first_collision_time is None:
                            self.first_collision_time = len(self.history) * TIME_STEP
            
            # Boundary Collisions
            for i in range(self.num_nodes):
                for axis in range(2):
                    if new_positions[i, axis] < 0:
                        new_positions[i, axis] = -new_positions[i, axis]
                    elif new_positions[i, axis] > self.box_size:
                        new_positions[i, axis] = 2 * self.box_size - new_positions[i, axis]
                        
            self.positions = new_positions
            self.history.append(self.positions.copy())
            self.collision_counts_per_frame.append(current_collisions)

# --- 1. Pre-Run Simulations ---
simulations = []
for config in ITERATIONS:
    sim = ChaseSimulation(config["box_size"], config["num_nodes"], NODE_SPEED)
    sim.run_simulation(DURATION_FRAMES)
    simulations.append(sim)

# --- 2. Setup Animation Layout ---
fig, axes = plt.subplots(2, 2, figsize=(12, 10))
fig.suptitle("Serial Chase — bounded random walk (collision comparison)", fontsize=14, fontweight='bold')
axes = axes.flatten()

node_color_list = ['red', 'blue', 'green', 'purple', 'orange', 'cyan', 'magenta']
plot_elements = []

for idx, sim in enumerate(simulations):
    ax = axes[idx]
    ax.set_xlim(-0.5, sim.box_size + 0.5)
    ax.set_ylim(-0.5, sim.box_size + 0.5)
    ax.set_xlabel("X")
    ax.set_ylabel("Y")
    ax.grid(True, linestyle='--', alpha=0.5)
    
    colors = node_color_list[:sim.num_nodes]
    scat = ax.scatter(np.zeros(sim.num_nodes), np.zeros(sim.num_nodes), c=colors, s=40, zorder=5)
    lines = [ax.plot([], [], color=colors[i], alpha=0.35, linestyle='-')[0] for i in range(sim.num_nodes)]
    
    collision_scat = ax.scatter([], [], c='red', s=35, marker='o', zorder=4, label='collision')
    ax.legend(loc='upper right', fontsize='small')
    
    plot_elements.append({
        'ax': ax, 'sim': sim, 'scat': scat, 'lines': lines, 'collision_scat': collision_scat
    })

plt.tight_layout(rect=[0, 0, 1, 0.95])

def init():
    artists = []
    for elem in plot_elements:
        num_nodes = elem['sim'].num_nodes
        elem['scat'].set_offsets(np.zeros((num_nodes, 2)))
        elem['collision_scat'].set_offsets(np.empty((0, 2)))
        for line in elem['lines']:
            line.set_data([], [])
        artists.extend([elem['scat'], elem['collision_scat']] + elem['lines'])
    return artists

def animate(frame):
    artists = []
    current_time = frame * TIME_STEP
    for idx, elem in enumerate(plot_elements):
        sim = elem['sim']
        current_pos = sim.history[frame]
        history_np = np.array(sim.history[:frame + 1])
        
        elem['scat'].set_offsets(current_pos)
        for i in range(sim.num_nodes):
            elem['lines'][i].set_data(history_np[:, i, 0], history_np[:, i, 1])
            
        past_collisions = [c for c in sim.collision_points if c[2] <= frame]
        if past_collisions:
            col_coords = np.array([[c[0], c[1]] for c in past_collisions])
            elem['collision_scat'].set_offsets(col_coords)
        else:
            elem['collision_scat'].set_offsets(np.empty((0, 2)))
            
        total_collisions = sim.collision_counts_per_frame[frame]
        
        # Display 1st collision time strings if they have happened yet
        first_col_str = "None"
        if sim.first_collision_time is not None and current_time >= sim.first_collision_time:
            first_col_str = f"{sim.first_collision_time:.1f}s"
            
        elem['ax'].set_title(
            f"Window {idx + 1} ({sim.box_size}x{sim.box_size}) | Nodes: {sim.num_nodes}\n"
            f"Collisions: {total_collisions} | 1st Col: {first_col_str}", 
            fontsize=9
        )
        artists.extend([elem['scat'], elem['collision_scat']] + elem['lines'])
    return artists

ani = animation.FuncAnimation(
    fig, animate, init_func=init, frames=DURATION_FRAMES, 
    interval=20, blit=False, repeat=False
)

plt.show()

# --- 3. Post-Analysis Plots (Bar & Time charts) ---
print("\n--- Summary of First Collision Times ---")
labels = []
collision_rates = []
first_times = []

for idx, sim in enumerate(simulations):
    total_col = sim.collision_counts_per_frame[-1]
    rate = total_col / TOTAL_SIMULATION_TIME
    collision_rates.append(rate)
    
    f_time = sim.first_collision_time if sim.first_collision_time is not None else np.nan
    first_times.append(f_time)
    
    print(f"Window {idx+1} ({sim.box_size}x{sim.box_size}): First collision at = {f_time if not np.isnan(f_time) else 'Never'} seconds")
    labels.append(f"Win {idx+1}\n({sim.box_size}x{sim.box_size})\nNodes: {sim.num_nodes}")

# Generate a final 1x2 visualization display layout 
fig2, (ax2, ax3) = plt.subplots(1, 2, figsize=(14, 5))
bar_colors = ['coral', 'skyblue', 'lightgreen', 'violet']

# Bar Graph 1: Collision Frequency Rates
bars = ax2.bar(labels, collision_rates, color=bar_colors, edgecolor='grey', width=0.4)
ax2.set_ylabel("Collision Rate (collisions / time unit)", fontweight='bold')
ax2.set_title("Collision Rate Comparison", fontweight='bold')
ax2.grid(axis='y', linestyle='--', alpha=0.5)
for bar in bars:
    ax2.annotate(f'{bar.get_height():.2f}', xy=(bar.get_x() + bar.get_width() / 2, bar.get_height()),
                 xytext=(0, 3), textcoords="offset points", ha='center', va='bottom', fontweight='bold')

# Bar Graph 2: Chronological First Collision Y-axis Timestamp Comparison
clean_first_times = [0 if np.isnan(t) else t for t in first_times]
bars_time = ax3.bar(labels, clean_first_times, color=bar_colors, edgecolor='grey', width=0.4)
ax3.set_ylabel("Time of First Collision (seconds)", fontweight='bold')
ax3.set_title("First Collision Onset Time", fontweight='bold')
ax3.set_ylim(0, TOTAL_SIMULATION_TIME + 2)
ax3.grid(axis='y', linestyle='--', alpha=0.5)

for idx, bar in enumerate(bars_time):
    val = first_times[idx]
    txt = f"{val:.1f}s" if not np.isnan(val) else "Never"
    ax3.annotate(txt, xy=(bar.get_x() + bar.get_width() / 2, clean_first_times[idx]),
                 xytext=(0, 3), textcoords="offset points", ha='center', va='bottom', fontweight='bold')

plt.tight_layout()
plt.show()