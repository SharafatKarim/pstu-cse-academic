// STREAMING_CHUNK: Configuring page layout and text settings...
#set page(
paper: "a4",
margin: (x: 2.5cm, y: 2.5cm),
numbering: "1",
columns: 1,
)
// #set text(font: "Ubuntu Nerd Font")
#set text(size: 12pt)
#set par(justify: true)
#set heading(numbering: "1.")
// Commented out bibliography to prevent compilation error if refs.bib is missing locally
// #show bibliography: set heading(numbering: "1.")

// --------------------------
// Title page
// --------------------------

// #set page(numbering: none)

// STREAMING_CHUNK: Generating title section...
#align(left)[
#line(length: 100%)
#align(left, text(18pt)[
ShopnilOS: A GNU/Linux Based Distribution with Custom System Administration and Process Monitoring Tools
])
#align(left, text(14pt)[
CIT 322 :: Operating System Sessional \
Name: Md. Sharafat Karim \
ID: 2102024 \
Reg: 10151 \
Semester: 06 (L-3, S-2)
])
#line(length: 100%)
]

// STREAMING_CHUNK: Writing Introduction and Objectives...
= Introduction

This project demonstrates the practical application of Operating System principles through the development of a custom, lightweight Linux distribution named ShopnilOS, alongside a suite of system administration and process monitoring tools. ShopnilOS is built by customizing the ArchLinux ISO to create a bare-minimum live environment populated only with essential modern applications. It utilizes archinstall for a streamlined, script-free base installation, ensuring a lightweight footprint. The environment is graphical-ready, customized with the Hyprland Wayland compositor, SDDM, Waybar, Rofi, and Waypaper.

To bridge the gap between low-level system configuration and user-space process management, complementary tools were developed: Archmate for comprehensive system administration, a Chaotic AUR installer script, and Tree_tasker, a Python and PySide6-based graphical task manager with web integration for advanced process hierarchy visualization.

= Objectives

- To understand Linux system architecture by customizing and building a bootable Arch-based ISO.
- To automate core OS maintenance tasks including package, user, repository, and configuration management.
- To visualize and monitor system resource allocation (CPU, RAM, Disk, Network) per application in real-time.
- To map and interactively explore parent-child process relationships (PIDs) within the operating system.

// STREAMING_CHUNK: Formulating Problem Statement and Related Work...
= Problem Statement

Modern operating systems often come pre-packaged with heavy, unnecessary background services (bloatware) that consume valuable hardware resources. Furthermore, traditional command-line process monitors (like top or ps) provide dense tabular data that makes it difficult for users to intuitively understand parent-child process relationships and exact resource distribution. There is a need for a streamlined, customizable OS base paired with an intuitive, visual process manager that clearly maps process hierarchies and resource bottlenecks.

= Related Work

+ General-purpose Linux distributions (e.g., Ubuntu, Linux Mint) provide functional environments but lack the minimalism required for strict resource control. On the monitoring side, tools like htop, gnome-system-monitor, or Windows Task Manager offer system overviews but often lack strict tree-based PID mapping paired with detailed pie-chart breakdowns for CPU, RAM, Disk, and Network per application. This project combines the minimalism of Arch Linux with a custom-built, highly visual process monitoring suite.

= Scope

The scope of this project is currently limited to x86_64 system architectures. The distribution, ShopnilOS, is tailored specifically for Arch-based package management (pacman, AUR). The Tree_tasker application is designed to fetch and visualize process data strictly for the local host machine, though its web interface lays the groundwork for future remote monitoring capabilities.

// STREAMING_CHUNK: Detailing Methodology and Tech Stack...
= Methodology

== Technology Stack

+ OS Customization: Archiso builder, archinstall.
+ Window Management / UI: Hyprland (Wayland), SDDM, Waybar, Rofi, Waypaper.
+ Scripting & Administration: Bash scripting (Archmate, Chaotic AUR Installer).
+ Application Development: Python, PySide6 (GUI framework for Tree_tasker).
+ Web Technologies: HTML, CSS, JavaScript (for the interactive process web interface).

== Design Principles

Minimalism (KISS): Keep the core OS live ISO as small as possible, relying on native tools like archinstall rather than custom, hard-to-maintain installation scripts.

Modularity: Separate system administration (Archmate) from real-time process monitoring (Tree_tasker) to ensure system stability.

Visual Clarity: Use tree structures and pie charts to translate raw OS process data into easily digestible visual information.

// STREAMING_CHUNK: Setting up Visual Models and placeholders...
// = Visual Models

// == Flow Chart Diagram

// // #figure(
// //   image("diagrams/flow-chart.svg", width: 100%, height: auto, alt: "Flow Chart"),
// //   caption: "Flow Chart of Process Fetching and Rendering in Tree_tasker",
// // ) 

// // The above @DFD illustrates the architecture of the Tree_tasker application, showing how system calls fetch PID data and pipe it to the PySide6 UI and Web Interface.

// == Schema Diagram

// // #figure(
// //   image("diagrams/schema_2.svg", width: 91%, height: auto, alt: "System Architecture Diagram"),
// //   caption: "System Architecture Diagram of ShopnilOS Integration",
// // ) 

// // The above @Schema illustrates how Archmate interacts with the underlying pacman database, user configurations, and root system files.

// == ERD (Entity Relationship Diagram)

// // #figure(
// //   image("diagrams/erd.svg", width: 96%, height: auto, alt: "Process Relationship Diagram"),
// //   caption: "Process Entity Relationship Diagram (Parent-Child PID mapping)",
// // ) 

// // The above @ERD illustrates the relationships between parent processes, child threads, and allocated system resources (CPU, RAM, Disk, Network) as tracked by Tree_tasker.

// // STREAMING_CHUNK: Building Timeline Gantt Chart...
// == Timeline (Gantt Chart)

// The base timeline for the development of ShopnilOS and its utilities is as follows:

// #figure(
// table(
// columns: (auto, 7.5%, 7.5%, 7.5%, 7.5%, 7.5%, 7.5%, 7.5%, 7.5%),
// [Task], [Week 1-2], [Week 3-4], [Week 5-6], [Week 7-8], [Week 9], [Week 10], [Week 11], [Week 12],
// [Archiso customization & Live Environment], [✓], [], [], [], [], [], [], [],
// [Hyprland, Waybar & Rofi UI configuration], [], [✓], [✓], [], [], [], [], [],
// [Archmate Scripting (Pacman, Mirrors, Cleanup)], [], [], [✓], [✓], [], [], [], [],
// [Chaotic AUR Installer implementation], [], [], [], [✓], [], [], [], [],
// [Tree_tasker Python/PySide6 core logic (PIDs)], [], [], [], [], [✓], [✓], [], [],
// [Resource Pie Charts & Web Interface], [], [], [], [], [], [✓], [✓], [],
// [Final Testing & ISO Compilation], [], [], [], [], [], [], [], [✓],
// ),
// caption: "Development Timeline of Custom OS and Utilities",
// )

// The timeline is divided into 12 weeks, with specific tasks allocated to each period which describes an approximate timeline for the whole development process.

// == UI Mockups

// // #figure(
// //   image("UI/1.png", height: 50%, alt: "Tree_tasker UI"),
// //   caption: "Main UI of Tree_tasker showing Process Tree and PIDs",
// // ) 

// // #figure(
// //   grid(
// //     columns: (auto, auto),
// //     rows: (auto, auto),
// //     gutter: 1em,
// //     [ #image("UI/2.png", width: 61%) ], [ #image("UI/3.png", width: 61%) ],
// //   ),
// //   caption: [Archmate terminal interface and ShopnilOS Desktop environment],
// // ) 

// // STREAMING_CHUNK: Writing Future Plans and Results...

= Future Plans

Future iterations of this project aim to implement remote system administration directly into Archmate, allowing configuration over SSH. For Tree_tasker, plans include adding the capability to terminate or pause specific processes directly from the interactive web interface, and expanding the data polling to support distributed containerized environments (like Docker metrics).

= Result

The project resulted in a fully functional, bootable custom Linux ISO (ShopnilOS) that successfully integrates a modern Wayland environment on minimal base packages. The administration scripts (Archmate and Chaotic AUR Installer) successfully automate tedious system updates, cleanups, and user management. Finally, the Tree_tasker application accurately polls kernel data to display real-time parent-child process trees and accurately renders CPU, RAM, Disk, and Network usage into interactive pie charts across both desktop and web interfaces.

// Uncomment and ensure refs.bib is present in the directory to compile bibliography
// #bibliography(title: "References", "refs.bib")

#align(center + bottom)[
THE END
]