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
    *Project Proposal*
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

Unlike traditional heavy machinery which is expensive and inflexible, Farm Droid utilizes a lightweight, terrain-adaptive mobile platform. This allows it to navigate through crop rows efficiently to perform monitoring and manipulation tasks. The system integrates modern embedded technologies, using a Raspberry Pi 4 for computer vision and decision-making, and an Arduino/ESP32 for real-time motor control and sensor data acquisition.

= Objectives

The primary goal is to build a smart farming assistant capable of autonomous operation. The specific objectives are:

- *Autonomous Navigation:* To implement GPS-based pathfinding (using NEO-6M) allowing the bot to travel to specific field coordinates.
- *Adaptive Mobility:* To develop a robust locomotion system (Rover or Legged) capable of traversing uneven agricultural terrain.
- *Computer Vision:* To utilize a Raspberry Pi Camera and OpenCV to recognize crops, weeds, and obstacles in real-time.
- *Robotic Manipulation:* To develop a servo-driven arm mechanism for grasping and moving objects.
- *Environmental Monitoring:* To integrate sensors for measuring soil moisture, pH levels, and weather conditions (Rain/Temperature).

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

- *The Brain (Raspberry Pi 4):* Handles high-level logic, image processing (OpenCV), and path planning. It communicates via Serial/I2C.
- *The Controller (Arduino/ESP32):* dedicated to PWM generation for the motor drivers and reading analog sensors.

== Technology Stack

- *Language*: Python (Vision/Logic), C++ (Arduino Firmware)
- *Vision*: OpenCV, TensorFlow Lite (Optional for object detection)
- *Hardware Interface*: I2C (Inter-Integrated Circuit), UART (GPS)
- *Power Management*: LiPo Batteries with Buck Converters (UBEC) for system stability.

= Hardware Components

The core components for the Farm Droid include:

- *Actuators:* DC Gear Motors or MG996R Servos (Mobility), SG90 (Gripper/Arm).
- *Sensors:* NEO-6M GPS, Ultrasonic (HC-SR04), Soil Moisture, Rain Sensor, DHT11.
- *Controllers:* Raspberry Pi 4 Model B (4GB), Arduino Uno / ESP32.
- *Drivers:* PCA9685 PWM Driver (for Servos) or L298N/Motor Driver (for Wheels).
- *Vision:* Official Raspberry Pi Camera Module / USB Webcam.

= Budget Estimation

The following is a detailed breakdown of the estimated costs for the hardware components required for the "Farm Droid" project. 

== Mandatory Components & Modules

#figure(
  table(
    columns: (auto, 40%, 2fr, 2fr, 2fr),
    fill: (col, row) => if row == 0 { luma(230) } else { white },
    align: (left, left, center, center, right),
    [*Category*], [*Component Name*], [*Unit Price (BDT)*], [*Qty*], [*Total (BDT)*],

    // --- Controllers & Computing ---
    table.cell(rowspan: 3, align: left)[*Controllers*],
    [#link("https://techshopbd.com/product/raspberry-pi-4-model-b-4gb-brand-dfrobot")[Raspberry Pi 4 Model B (4GB)]], [14,100], [1], [14,100],
    [#link("https://store.roboticsbd.com/development-boards/94-8-arduino-uno-r3-robotics-bangladesh.html?srsltid=AfmBOoolvCp64UrVtsHrv5x7m8bGrIMd9VrK3w-CciJUeW8Ly0NY4sGZ988")[Arduino Uno R3]], [988], [1], [988],
    [#link("https://www.electronics.com.bd/microcontroller/esp-32-38pin-development-board-wifibluetooth-2-in-1-dual-core-cpu")[ESP-32 Development Board]], [550], [2], [1,100],

    // --- Actuators & Drivers ---
    table.cell(rowspan: 4, align: left)[*Motors & Drivers*],
    [#link("https://store.roboticsbd.com/motor/295-servo-motor-mg995-360-degree-continuous-rotation-robotics-bangladesh.html")[Servo Motor MG995 (360 Deg)]], [770], [8], [6,160],
    [#link("https://techshopbd.com/product/servo-motor-mg996r")[Servo Motor MG996R]], [390], [2], [780],
    [#link("https://store.roboticsbd.com/motor/20-servo-motor-micro-sg90-180-degree-rotation-robotics-bangladesh.html")[Servo Motor SG90 (Micro)]], [150], [4], [600],
    [#link("https://store.roboticsbd.com/motor-driver/289-16-channel-12-bit-pwm-servo-driver-i2c-interface-pca9685-robotics-bangladesh.html?srsltid=AfmBOorPKkNFii1Qrxt5EVeZw2TdpwbLccDwtqHQKbET3krIo86tbSJI4472894")[PCA9685 16-Ch Servo Driver]], [447], [2], [894],

    // --- Sensors ---
    table.cell(rowspan: 11, align: left)[*Sensors*],
    [#link("https://www.electronics.com.bd/modules-shields/ublox-neo-6m-gps-module")[Ublox NEO-6M GPS Module]], [430], [1], [430],
    [#link("https://www.electronics.com.bd/modules-shields/vl53l0x-laser-ranging-sensor-module-940nm-gy-vl53l0x")[VL53L0X Laser Ranging Sensor]], [450], [2], [900],
    [#link("https://www.electronics.com.bd/microcontroller/gy-521-triple-axis-accelerometer-and-gyro-breakout-mpu-6050")[MPU-6050 Accelerometer/Gyro]], [219], [1], [219],
    [#link("https://store.roboticsbd.com/robotics-parts/104-6dof-accelerometer-gyroscope-gy-521-mpu-6050-robotics-bangladesh.html")[GY-521 6DOF MPU-6050]], [350], [1], [350],
    [#link("https://store.roboticsbd.com/sensors/664-adxl345-triple-axis-accelerometer-breakout-robotics-bangladesh.html")[ADXL345 Triple Axis Accelerometer]], [418], [1], [418],
    [#link("https://www.electronics.com.bd/microcontroller/as5600-magnetic-encoder-induction-angle-sensor")[AS5600 Magnetic Encoder]], [314], [2], [628],
    [#link("https://www.electronics.com.bd/sensors/18cm-dia-fsr402-resistive-film-pressure-sensor")[FSR402 Pressure Sensor]], [678], [2], [1,356],
    [#link("https://www.electronics.com.bd/microcontroller/hc-sr04-ultrasonic-distance-sensor-module?srsltid=AfmBOopJht3IpNdcrsEm7KPKWbP6lf_Fyqo_RHN4m-4fnfiC5-s-ok2u99")[HC-SR04 Ultrasonic Sensor]], [99], [1], [99],
    [#link("https://www.electronics.com.bd/microcontroller/infrared-obstacle-avoidance-ir-sensor-module-fc-51")[FC-51 IR Obstacle Sensor]], [45], [3], [135],
    [#link("https://store.roboticsbd.com/sensors/23-hc-sr501-pir-motion-sensor-robotics-bangladesh.html")[HC-SR501 PIR Motion Sensor]], [93], [1], [93],
    [#link("https://www.electronics.com.bd/modules-shields/blue-ov7670-300kp-vga-camera-module-for-arduino-diy-kit")[OV7670 Camera Module]], [350], [1], [350],

    // --- Power & Audio ---
    table.cell(rowspan: 4, align: left)[*Power & Audio*],
    [#link("https://techshopbd.com/product/transformer-12v-3a")[Transformer 12V 3A]], [390], [1], [390],
    [#link("https://store.roboticsbd.com/robotics-parts/549-breadboard-power-supply-module-33v-5v-robotics-bangladesh.html?srsltid=AfmBOoq84N24jDlTe6bSHCj2QQAccMhyLJZ1oYlA0EuL-ziFMAjPetIe76176")[Breadboard Power Supply]], [76], [1], [76],
    [#link("https://store.roboticsbd.com/sound-sensor-robotics-bangladesh/2470-3-watt-8-ohm-mini-speaker-for-electronics-project-with-jst-ph20-interface-robotics-bangladesh.html")[3 Watt 8 Ohm Mini Speaker]], [250], [1], [250],
    [#link("https://techshopbd.com/product/electret-microphone")[Electret Microphone]], [15], [2], [30],

    // --- Mechanical & Misc ---
    table.cell(rowspan: 11, align: left)[*Mechanical & Misc*],
    [PVC Pipe], [300], [5], [1,500],
    [Syringe], [20], [5], [100],
    [Pipe (Small)], [30], [5], [150],
    [#link("https://www.electronics.com.bd/microcontroller/breadboard-board-full-size")[Full-Size Breadboard]], [120], [2], [240],
    [#link("https://www.electronics.com.bd/microcontroller/breadboard-project-board-half-size-self-adhesive")[Half-Size Breadboard]], [75], [2], [150],
    [#link("https://www.electronics.com.bd/connectors-price-in-Bangladesh/male-male-jumper-wires")[Jumper Wires (Male-Male)]], [100], [4], [400],
    [#link("https://store.roboticsbd.com/connector/1130-cable-for-arduino-unomega-usb-a-to-b-1feet-robotics-bangladesh.html")[USB Cable (Arduino)]], [150], [2], [300],
    [#link("https://www.electronics.com.bd/3d-printer-parts/3d-printer-accessory-extruder-strong-spring")[3D Printer Strong Spring]], [49], [2], [98],
    [Screws / Hardware], [100], [10], [1,000],
    [Magnet], [50], [1], [50],
    [#link("https://www.electronics.com.bd/components-price-in-Bangladesh/5-meter-copper-wire-26-swg-magnet-enameled")[Copper Wire (26 SWG)]], [110], [2], [220],
    
    // --- Tools ---
    table.cell(rowspan: 2, align: left)[*Tools*],
    [#link("https://www.daraz.com.bd/products/first-deal-best-quality-digital-scale-10kg-1g-household-weight-scales-platform-electronic-balance-kitchen-scale-baking-measure-food-cooking-tools-i368372677.html?spm=a2a0e.searchlistcategory.list.2.af8925e3pbDBON")[Digital Scale (10kg)]], [259], [1], [259],
    [Hex Saw], [15], [1], [15],

    // --- Total ---
    table.cell(colspan: 4, align: right, fill: luma(240))[*Grand Total Estimated Cost*],
    table.cell(fill: luma(240))[*33,028 BDT*],
  ),
  caption: "Detailed Budget Estimation",
)

== Optional Components & Modules

These components are optional additions for specific features like environmental monitoring (Smart Farming) or alternative locomotion (Wheeled mode).

#figure(
  table(
    columns: (auto, 40%, 1fr, 1fr, 1fr),
    fill: (col, row) => if row == 0 { luma(230) } else { white },
    align: (left, left, center, center, right),
    inset: 5pt,
    
    [*Category*], [*Component Name*], [*Unit Price*], [*Qty*], [*Total*],

    // --- Smart Farming Sensors ---
    table.cell(rowspan: 4, align: left)[*Sensors*],
    [#link("https://www.electronics.com.bd/sensor-module/liquid-ph-0-14-value-detect-sensor-module-for-arduino-sen5?srsltid=AfmBOoozrI6eENqKb5t-7-Wa75BFk-qHXGV6HkBdeXxzlHhKxb_sCDA62")[Liquid pH Sensor (0-14 Value)]], [2,150], [1], [2,150],
    [#link("https://www.electronics.com.bd/sensor-module/soil-moisture-sensor")[Soil Moisture Sensor Dual Output]], [70], [1], [70],
    [#link("https://www.electronics.com.bd/microcontroller/rain-drop-sensor-for-arduino?srsltid=AfmBOoqmNlvnvP7mQOT2UH002x6WvDcjpiOHKE92peRGBXBky_Bc3ryo")[Rain Drop Sensor]], [80], [1], [80],
    [#link("https://store.roboticsbd.com/sensors/667-dht11-temperature-and-relative-humidity-sensor-module-for-arduino-robotics-bangladesh.html?srsltid=AfmBOorLw6j0e5yGXxoUHu19gjmNyrIsVSWybz7KR-uJ_BR29MoaxYGu")[DHT11 Temp & Humidity Sensor]], [120], [2], [240],

    // --- Safety & Security ---
    table.cell(rowspan: 2, align: left)[*Safety & Security*],
    [#link("https://www.electronics.com.bd/microcontroller/mq-2-gas-sensor-module?srsltid=AfmBOor17Y2p1JDtWtTsufN_C-EKjjkKWN9NSr5GLWLwZ3p6TOw3HZMA")[MQ-2 / MQ-135 Gas Sensor]], [139], [2], [278],
    [#link("https://store.roboticsbd.com/arduino-shield/313-rc522-rfid-card-reader-module-kit-android-nfc-supported-robotics-bangladesh.html")[RC522 RFID Reader Kit]], [175], [1], [175],

    // --- Alternative Locomotion ---
    table.cell(rowspan: 1, align: left)[*Rover Mode*],
    [#link("https://www.robotechbd.com/product/motor/gear-motor-with-wheel/")[Gear Motor with Wheel (Yellow)]], [155], [4], [620],

    // --- Optional Total ---
    table.cell(colspan: 4, align: right, fill: luma(240))[*Optional Items Total*],
    table.cell(fill: luma(240))[*3,613 BDT*],
  ),
  caption: "Budget for Optional / Modular Components",
)

== Project Financial Summary

#figure(
  table(
    columns: (2fr, 1fr),
    fill: (col, row) => if row == 2 { luma(220) } else { white },
    align: (right, right),
    inset: 10pt,
    
    [Mandatory Components Cost:], [34,828 BDT],
    [Optional Components Cost:], [3,613 BDT],
    [*Grand Total Project Cost:*], [*38,441 BDT*],
  )
)

= Work Plan (Timeline)

The development is divided into phases to ensure the complex mechanical and software systems work together.

#figure(
  table(
    columns: (auto, 1fr, 1fr, 1fr, 1fr),
    fill: (col, row) => if row == 0 { luma(230) } else { white },
    [*Task*], [*Month 1*], [*Month 2*], [*Month 3*], [*Month 4*],
    [Mechanical Assembly (Chassis & Drive)], [✓], [], [], [],
    [Circuit Integration & Power Dist.], [✓], [✓], [], [],
    [Locomotion & Motor Control], [], [✓], [✓], [],
    [Vision & GPS Integration], [], [], [✓], [✓],
    [Arm Control & Final Testing], [], [], [], [✓],
  ),
  caption: "Gantt Chart for Farm Droid Development",
)

= Visual Models

== Block Diagram

// You would insert your block diagram image here
// #image("diagrams/block_diagram.png", width: 80%)
// Since we don't have the image file yet, describing the flow:

The system connects the Raspberry Pi to the Motor/Servo Drivers to control the movement. Sensors are connected to the Arduino, which feeds data back to the Pi.

== Flow Chart

// #image("diagrams/flow_chart.png", width: 80%)

The operational flow is as follows:
1. Initialize Sensors & GPS.
2. Check Destination Coordinates.
3. Calculate Path & Begin Movement.
4. *If* Obstacle Detected (Vision/Ultrasonic) -> Stop & Reroute.
5. *If* Target Object Detected -> Activate Arm Sequence.

= Future Plans

+ *Solar Integration:* Adding solar panels for prolonged field operation.
+ *Swarm Technology:* Enabling multiple Farm Droids to communicate and work together on large fields.
+ *Machine Learning:* Training a custom dataset for specific weed/crop identification.
+ *Mobile App:* Developing a Flutter-based app to monitor the bot's status remotely.

= Conclusion
Farm Droid represents a step towards modernizing agriculture through robotics. By combining autonomous mobility with computer vision, this project aims to demonstrate that farming automation can be agile, intelligent, and accessible. The successful completion of this project will provide a functional prototype capable of navigating autonomous paths and performing basic agricultural tasks.

#align(center + bottom)[
  #v(2em)
  *The End*
]