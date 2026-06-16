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
#show bibliography: set heading(numbering: "1.")
#show figure: set block(breakable: true)

// --------------------------
// Title page
// --------------------------

#set page(numbering: none)

#align(left)[ 
  #image("PSTU.png", width: 30%, height: auto, alt: "PSTU")
  #text(21pt)[
    *Patuakhali Science and Technology University* \
  ]
  #text(18pt)[
    Faculty of Computer Science and Engineering
  ]

  #line(length: 100%)
  #align(left, text(17pt)[
    *CCE 322 :: Computer Peripheral and Interfacing Sessional*
  ])
  #align(left, text(16pt)[
    *Mid Report*
  ])
  #line(length: 100%)
]

#align(left)[
  #v(12pt)
  #image("logo/logo-2.png", width: 60%, height: auto, alt: "Divider")
]

#align(bottom)[
  #line(length: 100%)
  *Project Title : * Farm Droid \
  *Submission Date :* #datetime.today().display("[day] [month repr:long] [year]") \
  #line(length: 100%)
]

#grid(
  columns: (45%, 65%),
  gutter: 2em,
  [
    #align(left)[
      #text(size: 14pt, weight: "bold")[Submitted by,] \
      #v(0.5em)
      + *2102003* - Md. Abu Taher \
      + *2102007* - Mehedi Hasan \
      + *2102020* - Md. Sadman Kabir Bhuiyan \
      + *2102024* - Md. Sharafat Karim \
      + *2102051* - Md. Safiullah Farajy
    ]
  ],
  [
    #align(left)[
      #text(size: 14pt, weight: "bold")[Submitted to,] \
      #v(0.5em)
      + *Sarna Majumder* \
        Associate Professor, \
        Depart. of Computer and Communication Engineering, \
        Patuakhali Science and Technology University.
      + *Prof. Dr. Md Samsuzzaman* \
        Professor, \
        Depart. of Computer and Communication Engineering, \
        Patuakhali Science and Technology University.
    ]
  ],
)

#pagebreak()

// --------------------------
// Contents
// --------------------------
#set page(numbering: "1")
#outline()
#pagebreak()


#align(center)[
  #image("logo/logo.png", width: 25%, height: auto, alt: "PSTU Diary Logo")
]
#align(center)[
  #text(size: 20pt, weight: "bold")[Farm Droid] \
  #text(size: 14pt)[An Autonomous Agricultural Robot]
]
= Introduction

Agriculture is facing significant challenges due to labor shortages and the need for precision monitoring of crop health. "Farm Droid" is a prototype for a compact, autonomous agricultural robot designed to address these issues through smart automation.

Unlike traditional heavy machinery which is expensive and inflexible, Farm Droid utilizes a lightweight, terrain-adaptive mobile platform. This allows it to navigate through crop rows efficiently to perform monitoring and manipulation tasks. The system integrates modern embedded technologies, using a Raspberry Pi 4 for computer vision and decision-making, and an Arduino UNO/ nano for real-time motor control and sensor data acquisition.

= Objectives

The primary goal is to build a smart farming assistant capable of autonomous operation. The specific objectives are:

- *Environmental Monitoring:* To integrate sensors for measuring soil moisture, pH levels, and weather conditions (Rain/Temperature).
- *Robotic Manipulation:* To develop a servo-driven arm mechanism for different modular tasks like weeding.
- *Computer Vision:* To utilize a Raspberry Pi Camera and OpenCV to recognize crops, weeds, and obstacles in real-time.
- *Seamless Connectivity:* To establish reliable remote monitoring and control through telegram bot integration or a custom mobile app.
- *Autonomous Activity:* To allow the robot to perform tasks like plant seeding, watering, and soil fertilization without human intervention.
- *Adaptive Mobility:* To develop a robust locomotion system (Rover or Legged) capable of traversing uneven agricultural terrain.

= Problem Statement

Conventional heavy farming machinery is often unsuited for small-scale precision agriculture or delicate crop fields. Large tractors cause soil compaction and lack the agility to perform individual plant inspection. There is a lack of affordable, modular robotic solutions that can perform both monitoring and physical manipulation tasks in such environments. Farm Droid aims to bridge this gap by providing a lightweight, intelligent, and versatile solution.

= Scope

The project scope encompasses the mechanical assembly, circuit integration, and software development of the robot.
- *Hardware:* Custom chassis design, Motor/Servo drive system, Power distribution system.
- *Software:* Python-based vision processing, C++ based motor control firmware.
- *Limitation:* The prototype will focus on small-scale demonstration (e.g., a garden or test bed) rather than full industrial field deployment.

= Methodology

== System Architecture
We are adopting a "Distributed Computing" architecture to handle the computational load efficiently:

- *The Brain (Raspberry Pi 4):* Handles high-level logic, image processing (OpenCV), and path planning. It communicates via Serial/I2C/USB.
- *The Controller (Arduino/ESP32):* dedicated to PWM generation for the motor drivers and reading analog sensors.

== Technology Stack

- *Language*: Python (Vision/Logic), C++ (Arduino Firmware)
- *Vision*: OpenCV, TensorFlow Lite (Optional for object detection)
- *Hardware Interface*: I2C (Inter-Integrated Circuit), USB.
- *Power Management*: A 65W/22W 30000mAh with Buck Converters for system stability.

= Hardware Components

The core components for the Farm Droid include:

- *Actuators:* DC Gear Motors or MG996R Servos (Mobility), SG90 (Gripper/Arm), GA25 (Metal Gear motor).
- *Sensors:*  Ultrasonic (HC-SR04), Soil Moisture, Rain Sensor, DHT11, IR (Infrared), LDR (Light Dependent Resistor), DFPlayer Mini, RFID Reader(Radio Frequency Identification), Relay, PH Electrode, Gas sensor(MQ135).
- *Controllers:* Raspberry Pi 4 Model B (4GB), Arduino Uno / Nano.
- *Drivers:* L298N/Motor Driver (for Wheels).
- *Vision:* Official Raspberry Pi Camera Module using Pi camera 5MP.
- *Power Supplier:* LM2596 Buck Converter, 65W/22W 30000mAh Power Bank.

= Budget Estimation

The following is a detailed breakdown of the estimated costs for the hardware components required for the "Farm Droid" project based on real market prices in Bangladesh. The total estimated cost for the project is approximately BDT 31488. This budget includes all necessary components for building the prototype, such as controllers, sensors, actuators, power supplies, and miscellaneous materials.

// == Mandatory Components & Modules

#figure(
  table(
    columns: (auto, 47%, 2fr, 2fr, 2fr),
    fill: (col, row) => if row == 0 { luma(230) } else { white },
    align: (left, left, center, center, right),
    [*Category*], [*Component Name*], [*Unit (BDT)*], [*Qty*], [*Total (BDT)*],

    // --- Controllers & Computing ---
    table.cell(rowspan: 2, align: left)[*Controllers*],
    [#link("https://techshopbd.com/product/raspberry-pi-4-model-b-4gb-brand-dfrobot")[Raspberry Pi 4 Model B (4GB)]], [14,100], [1], [14,100],
    [#link("https://store.roboticsbd.com/development-boards/94-8-arduino-uno-r3-robotics-bangladesh.html?srsltid=AfmBOoolvCp64UrVtsHrv5x7m8bGrIMd9VrK3w-CciJUeW8Ly0NY4sGZ988")[Arduino Uno R3]], [988], [2], [1,976],
    

    // --- Actuators & Drivers ---
    table.cell(rowspan: 4, align: left)[*Motors & Drivers*],
    [#link("https://projectkitsbd.com/product/370ga25-dc6-12v-metal-gear-motors")[GA25 Metal Gear Motor]], [450], [2], [900],
    [#link("https://store.roboticsbd.com/motor/2674-dsservo-ds3218-20kg-digital-metal-servo-with-metal-servo-horn-270-degree-robotics-bangladesh.html")[DSServo DS3218 20KG Digital Metal Servo with Horn 270 Degree]], [2350], [2], [4700],
    [#link("https://techshopbd.com/product/servo-motor-mg996r")[Servo Motor MG996R]], [500], [1], [500],
    [#link("https://store.roboticsbd.com/motor/20-servo-motor-micro-sg90-180-degree-rotation-robotics-bangladesh.html")[Servo Motor SG90 (Micro)]], [180], [2], [360],

    // --- Sensors ---
    table.cell(rowspan: 14, align: left)[*Sensors*],
    
    [#link("https://www.electronics.com.bd/microcontroller/hc-sr04-ultrasonic-distance-sensor-module?srsltid=AfmBOopJht3IpNdcrsEm7KPKWbP6lf_Fyqo_RHN4m-4fnfiC5-s-ok2u99")[HC-SR04 Ultrasonic Sensor]], [99], [1], [99],
    [#link("https://www.electronics.com.bd/microcontroller/infrared-obstacle-avoidance-ir-sensor-module-fc-51")[FC-51 IR Obstacle Sensor]], [45], [3], [135],
    [#link("https://store.roboticsbd.com/sensors/23-hc-sr501-pir-motion-sensor-robotics-bangladesh.html")[HC-SR501 PIR Motion Sensor]], [93], [1], [93],
    [#link("https://www.electronics.com.bd/modules-shields/blue-ov7670-300kp-vga-camera-module-for-arduino-diy-kit")[OV7670 Camera Module]], [400], [1], [400],
    [#link("https://projectkitsbd.com/product/dht11temperature-and-humidity-sensor-module")[DHT11]],[95],[1],[95],
    [#link("https://projectkitsbd.com/product/gl5516-light-dependent-photoresistor-ldr")[LDR(Light Dependent Resistor)]],[5],[1],[5], 
    [#link("https://store.roboticsbd.com/audio-voice-piezo-buzzer-speech-module/3810-dfplayer-mini-mp3-player-for-diy-arduino-esp32-sound-project-dfrobot-robotics-bangladesh.html")[DFplayer]],[350],[1],[350],
    [#link("https://store.roboticsbd.com/sensors/23-hc-sr501-pir-motion-sensor-robotics-bangladesh.html")[PIR Sensor]], [93], [1], [93],
    [#link("https://store.roboticsbd.com/arduino-shield/313-rc522-rfid-card-reader-module-kit-android-nfc-supported-robotics-bangladesh.html")[RFID]],[190],[1],[190],
    [#link("https://store.roboticsbd.com/electronics-module/702-1-channel-5v-relay-board-module-robotics-bangladesh.html")[Relay]], [80], [4], [320],
    [#link("https://store.roboticsbd.com/sensors/523-analog-ph-sensor-meter-kit-for-arduino-robotics-bangladesh.html")[PH Sensor]], [2584], [1], [2584],
    [#link("https://store.roboticsbd.com/sensors/145-yl-69-soil-hygrometer-humidity-soil-moisture-detection-sensor-robotics-bangladesh.html")[Moisturizer Sensor]],[70],[1],[70],
    [#link("https://store.roboticsbd.com/sensors/665-rain-steam-detection-sensor-module-robotics-bangladesh.html")[Rain Sensor]],[78],[1],[78],
    [#link("https://store.roboticsbd.com/sensors/679-mq-135-gas-sensor-robotics-bangladesh.html")[MQ135]],[135],[1],[135],


    // --- Power & Audio ---
    table.cell(rowspan: 3, align: left)[*Power & Audio*],
    [#link("https://store.roboticsbd.com/robotics-parts/549-breadboard-power-supply-module-33v-5v-robotics-bangladesh.html?srsltid=AfmBOoq84N24jDlTe6bSHCj2QQAccMhyLJZ1oYlA0EuL-ziFMAjPetIe76176")[Breadboard Power Supply]], [76], [1], [76],
    [#link("https://store.roboticsbd.com/sound-sensor-robotics-bangladesh/2470-3-watt-8-ohm-mini-speaker-for-electronics-project-with-jst-ph20-interface-robotics-bangladesh.html")[3 Watt 8 Ohm Mini Speaker]], [250], [1], [250],
    [#link("https://techshopbd.com/product/electret-microphone")[Electret Microphone]], [15], [2], [30],

    // --- Mechanical & Misc ---
    table.cell(rowspan: 7, align: left)[*Mechanical & Misc*],
    [PVC Pipe], [300], [5], [1,500],
    [Pipe (Small)], [30], [5], [150],
    [#link("https://www.electronics.com.bd/microcontroller/breadboard-project-board-half-size-self-adhesive")[Half-Size Breadboard]], [75], [2], [150],
    [#link("https://www.electronics.com.bd/connectors-price-in-Bangladesh/male-male-jumper-wires")[Jumper Wires (Male-Male)]], [100], [4], [400],
    [#link("https://store.roboticsbd.com/connector/1130-cable-for-arduino-unomega-usb-a-to-b-1feet-robotics-bangladesh.html")[USB Cable (Arduino)]], [150], [2], [300],
    [Screws / Hardware], [100], [10], [1,000],
    [#link("https://www.electronics.com.bd/components-price-in-Bangladesh/5-meter-copper-wire-26-swg-magnet-enameled")[Copper Wire (26 SWG)]], [110], [2], [220],
    
    // --- Tools ---
    table.cell(rowspan: 3, align: left)[*Tools*],
    [#link("https://www.daraz.com.bd/products/first-deal-best-quality-digital-scale-10kg-1g-household-weight-scales-platform-electronic-balance-kitchen-scale-baking-measure-food-cooking-tools-i368372677.html?spm=a2a0e.searchlistcategory.list.2.af8925e3pbDBON")[Digital Scale (10kg)]], [259], [1], [259],
    [Hex Saw], [15], [2], [30],
    [Sand Paper], [30], [3], [90],

    // --- Total ---
    table.cell(colspan: 4, align: right, fill: luma(240))[*Grand Total Estimated Cost*],
    table.cell(fill: luma(240))[*31488*],
  ),
  caption: "Detailed Budget Estimation",
)

= Work Plan (Timeline)


#figure(
    table(
    columns: (auto, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    fill: (col, row) => if row == 0 { luma(230) } else { white },
    [*Task*], [*Month 1*], [*Month 2*], [*Month 3*], [*Month 4*], [*Month 5*], [*Month 6*],
    [Requirement Analysis & Planning], [✓], [], [], [], [], [],
    [Mechanical Assembly (Chassis & Drive)], [✓], [✓], [], [], [], [],
    [Circuit Integration & Power Distribution], [], [✓], [✓], [], [], [],
    [Sensor Installation & Wiring], [], [✓], [✓], [], [], [],
    [Motor Control & Calibration], [], [], [✓], [✓], [], [],
    [Arm Control & Actuation Testing], [], [], [], [✓], [✓], [],
    [Software Integration], [], [], [], [✓], [✓], [✓],
    [System Testing & Debugging], [], [], [], [], [✓], [✓],
    [Final Review & Documentation], [], [], [], [], [], [✓],
  ),
  caption: "Gantt Chart for Farm Droid Development",
)
   
= Visual Models

== Circuit Diagram

#figure(
image("ui/circuit_image.jpg", width: 100%),
caption: "Circuit Diagram of Farm Droid System",
)

This diagram includes only the parts that were implemented in the mid-term report. The final report will include the complete circuit diagram with all components and connections.

== Data Flow Diagram


#figure(
image("ui/dfd.png", width: 100%),
caption: "Data Flow Diagram of Farm Droid System",
)


= Future Plans

+ *Telegram Bot:* Implementing a Telegram bot for real-time alerts and control commands.
+ *Mobile App:* Developing an app to monitor the bot's status remotely.
+ *FastAPI:* Building a RESTful API for backend services.
+ *Computer Vision:* Implementing computer vision algorithms for object detection and recognition.

= Conclusion
Farm Droid represents a step towards modernizing agriculture through robotics. By combining autonomous mobility with computer vision, this project aims to demonstrate that farming automation can be agile, intelligent, and accessible. The successful completion of this project will provide a functional prototype capable of navigating autonomous paths and performing basic agricultural tasks.

// #align(center + bottom)[
//   #v(2em)
//   *The End*
// ]