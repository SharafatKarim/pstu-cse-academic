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
    *Final Report*
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

Labour shortage and the requirement to monitor crop health with precision are huge problems in agriculture. To tackle these challenges, it has developed a novel agricultural robot concept known as "Farm Droid". To overcome these challenges, it has come up with a novel idea for an agricultural robot, dubbed "Farm Droid", which is compact and autonomous.

Farm Droid is the low-cost, adaptable mobile platform that can be used in place of traditional heavy machinery. This enables it to maneuver between rows of crops efficiently to carry out monitoring and manipulating. It combines cutting-edge embedded technologies: a Raspberry Pi 4 computer for computer vision and decision making, and an arduino UNO/ nano board for  sensor data collection and real time motor control.

= Objectives
The main goal is to create a smart farming assistant that will be able to work autonomously. The aims are:

+ To design and develop a lightweight and low cost agricultural robot that can move between the rows of crops.
+ To implement a multi-sensor system to monitor important environmental and crop health parameters continuously such as soil moisture, soil temperature, rainfall, and soil pH.
+ To build a distributed computing system with high level vision processing and client application for real time monitoring and control.
+ To build weeding tool, soil collector etc as modular attachments of the Robotic arm.
+ To support auto digging and seeding operations in a small scale environment.

= Problem Statement

Traditional large-scale agricultural equipment may not be suitable for small-scale precision agriculture or sensitive crop fields. Large tractors compact soil do not have the agility to do individual plant inspection. The robotic systems available today are either expensive or complex enough to be too large to operate in these environments. This is where Farm Droid comes in with its lightweight, intelligent and versatile solution.

= Scope


The project scope also includes the mechanical assembly of the robot and programming of the circuit, as well as the integration of the circuit into the robot. 

The hardware design consists of a modified chassis, motor / servo drive system, and a power distribution system to insure stable operation of the hardware components. The apparatus is basically made of a camera and a motor. The software side of the system includes OpenCV vision processing using Python and motor control based on a C++ firmware. 

The challenge with this project is that this prototype won't be deployed at a large scale industrial application level; it will only be spun in a small scale environment such as a garden or a test bed under control.

= Methodology

== System Architecture

The computational load of the system is efficiently dealt with with a “Distributed Computing” approach. It is an architecture that includes the Brain (Raspberry Pi 4), responsible on the high level for the decision making, image processing (OpenCV) and path planning. It also communicates with other modules with interfaces such as Serial, I2C and USB. The Controller (Arduino Uno / Nano) is used for low level real time control, for instance sending PWM impulses to motor control drivers or reading analog sensor data.
== Technology Stack
+ *Language*: Python (Vision/Logic), C++ (Arduino Firmware)
+ *Accelerator*: Intel® RealSense™ depth camera (Optional for object detection)
+ *Hardware Interface:* I2C (Inter-Integrated Circuit), USB.
+ *Power Management:* 65W/22W 30000mAh (Buck Converters) for system stability.

= Hardware Components

The Farm Droid consists of the following elements:

+ *Actuators:* DC Gear Motors or MG996R Servos (Mobility), SG90 (Gripper/Arm), GA25 (Metal Gear motor).
+ *Sensors:* Ultrasonic (HC-SR04), Soil Moisture, Rain Sensor, DHT11, IR (Infrared), LDR (Light Dependent Resistor), DFPlayer Mini, RFID Reader(Radio Frequency Identification), Relay, PH Electrode, Gas sensor(MQ135).
+ *Controllers:* Raspberry Pi ( 4 model B (4Gb)), arduino Uno / Nano.
+ *Drivers:* L298N/Motor Driver (for Wheels).
+ *Vision:* Official Raspberry Pi Camera Module with Pi camera 5MP.
+ *Power Supplier:* LM2596 Buck Converter, 65W/22W 30000mAh Power Bank.


= Budget Estimation


The costs of the various components that will be needed for the "Farm Droid" are summarized below and based on actual market prices in Bangladesh. 
// The estimated total costs of the project are around BDT 31488. This budget also includes all the components required for developing the prototype including controllers, sensors, actuators, power supplies, and other materials.
.

// == Mandatory Components & Modules

#figure(
  table(
    columns: (auto, 47%, 2fr, 2fr, 2fr),
    fill: (col, row) => if row == 0 { luma(230) } else { white },
    align: (left, left, center, center, right),
    [*Category*], [*Component Name*], [*Unit (BDT)*], [*Qty*], [*Total (BDT)*],

    // --- Controllers & Computing ---
    table.cell(rowspan: 2, align: left)[*Controllers*],
    [#link("https://techshopbd.com/product/raspberry-pi-4-model-b-4gb-brand-dfrobot")[Raspberry Pi 4 Model B (4GB) [6]]], [14,100], [1], [14,100],
    [#link("https://store.roboticsbd.com/development-boards/94-8-arduino-uno-r3-robotics-bangladesh.html?srsltid=AfmBOoolvCp64UrVtsHrv5x7m8bGrIMd9VrK3w-CciJUeW8Ly0NY4sGZ988")[Arduino Uno R3 [4]]], [988], [2], [1,976],

    // --- Motors & Drivers ---
    table.cell(rowspan: 4, align: left)[*Motors & Drivers*],
    [#link("https://projectkitsbd.com/product/370ga25-dc6-12v-metal-gear-motors")[GA25 Metal Gear Motor [3]]], [450], [2], [900],
    [#link("https://store.roboticsbd.com/motor/2674-dsservo-ds3218-20kg-digital-metal-servo-with-metal-servo-horn-270-degree-robotics-bangladesh.html")[DSServo DS3218 20KG Digital Metal Servo [4]]], [2350], [2], [4700],
    [#link("https://techshopbd.com/product/servo-motor-mg996r")[Servo Motor MG996R [6]]], [500], [1], [500],
    [#link("https://store.roboticsbd.com/motor/20-servo-motor-micro-sg90-180-degree-rotation-robotics-bangladesh.html")[Servo Motor SG90 (Micro) [4]]], [180], [2], [360],

    // --- Sensors ---
    table.cell(rowspan: 14, align: left)[*Sensors*],

    [#link("https://www.electronics.com.bd/microcontroller/hc-sr04-ultrasonic-distance-sensor-module?srsltid=AfmBOopJht3IpNdcrsEm7KPKWbP6lf_Fyqo_RHN4m-4fnfiC5-s-ok2u99")[HC-SR04 Ultrasonic Sensor [2]]], [99], [1], [99],
    [#link("https://www.electronics.com.bd/microcontroller/infrared-obstacle-avoidance-ir-sensor-module-fc-51")[FC-51 IR Obstacle Sensor [2]]], [45], [3], [135],
    [#link("https://store.roboticsbd.com/sensors/23-hc-sr501-pir-motion-sensor-robotics-bangladesh.html")[HC-SR501 PIR Motion Sensor [4]]], [93], [1], [93],
    [#link("https://www.electronics.com.bd/modules-shields/blue-ov7670-300kp-vga-camera-module-for-arduino-diy-kit")[OV7670 Camera Module [2]]], [400], [1], [400],
    [#link("https://projectkitsbd.com/product/dht11temperature-and-humidity-sensor-module")[DHT11 [3]]],[95],[1],[95],
    [#link("https://projectkitsbd.com/product/gl5516-light-dependent-photoresistor-ldr")[LDR (Light Dependent Resistor) [3]]],[5],[1],[5], 
    [#link("https://store.roboticsbd.com/audio-voice-piezo-buzzer-speech-module/3810-dfplayer-mini-mp3-player-for-diy-arduino-esp32-sound-project-dfrobot-robotics-bangladesh.html")[DFplayer [4]]],[350],[1],[350],
    [#link("https://store.roboticsbd.com/sensors/23-hc-sr501-pir-motion-sensor-robotics-bangladesh.html")[PIR Sensor [4]]], [93], [1], [93],
    [#link("https://store.roboticsbd.com/arduino-shield/313-rc522-rfid-card-reader-module-kit-android-nfc-supported-robotics-bangladesh.html")[RFID [4]]],[190],[1],[190],
    [#link("https://store.roboticsbd.com/electronics-module/702-1-channel-5v-relay-board-module-robotics-bangladesh.html")[Relay [4]]], [80], [4], [320],
    [#link("https://store.roboticsbd.com/sensors/523-analog-ph-sensor-meter-kit-for-arduino-robotics-bangladesh.html")[PH Sensor [4]]], [2584], [1], [2584],
    [#link("https://store.roboticsbd.com/sensors/145-yl-69-soil-hygrometer-humidity-soil-moisture-detection-sensor-robotics-bangladesh.html")[Moisturizer Sensor [4]]],[70],[1],[70],
    [#link("https://store.roboticsbd.com/sensors/665-rain-steam-detection-sensor-module-robotics-bangladesh.html")[Rain Sensor [4]]],[78],[1],[78],
    [#link("https://store.roboticsbd.com/sensors/679-mq-135-gas-sensor-robotics-bangladesh.html")[MQ135 [4]]],[135],[1],[135],

    // --- Power & Audio ---
    table.cell(rowspan: 3, align: left)[*Power & Audio*],
    [#link("https://store.roboticsbd.com/robotics-parts/549-breadboard-power-supply-module-33v-5v-robotics-bangladesh.html?srsltid=AfmBOoq84N24jDlTe6bSHCj2QQAccMhyLJZ1oYlA0EuL-ziFMAjPetIe76176")[Breadboard Power Supply [4]]], [76], [1], [76],
    [#link("https://store.roboticsbd.com/sound-sensor-robotics-bangladesh/2470-3-watt-8-ohm-mini-speaker-for-electronics-project-with-jst-ph20-interface-robotics-bangladesh.html")[3 Watt 8 Ohm Mini Speaker [4]]], [250], [1], [250],
    [#link("https://techshopbd.com/product/electret-microphone")[Electret Microphone [6]]], [15], [2], [30],

    // --- Mechanical & Misc ---
    table.cell(rowspan: 7, align: left)[*Mechanical & Misc*],
    [PVC Pipe], [300], [5], [1,500],
    [Pipe (Small)], [30], [5], [150],
    [#link("https://www.electronics.com.bd/microcontroller/breadboard-project-board-half-size-self-adhesive")[Half-Size Breadboard [2]]], [75], [2], [150],
    [#link("https://www.electronics.com.bd/connectors-price-in-Bangladesh/male-male-jumper-wires")[Jumper Wires (Male-Male) [2]]], [100], [4], [400],
    [#link("https://store.roboticsbd.com/connector/1130-cable-for-arduino-unomega-usb-a-to-b-1feet-robotics-bangladesh.html")[USB Cable (Arduino) [4]]], [150], [2], [300],
    [Screws / Hardware], [100], [10], [1,000],
    [#link("https://www.electronics.com.bd/components-price-in-Bangladesh/5-meter-copper-wire-26-swg-magnet-enameled")[Copper Wire (26 SWG) [2]]], [110], [2], [220],

    // --- Tools ---
    table.cell(rowspan: 3, align: left)[*Tools*],
    [#link("https://www.daraz.com.bd/products/first-deal-best-quality-digital-scale-10kg-1g-household-weight-scales-platform-electronic-balance-kitchen-scale-baking-measure-food-cooking-tools-i368372677.html")[Digital Scale (10kg) [1]]], [259], [1], [259],
    [Hex Saw], [15], [2], [30],
    [Sand Paper], [30], [3], [90],

    // --- Total ---
    table.cell(colspan: 4, align: right, fill: luma(240))[*Grand Total Estimated Cost*],
    table.cell(fill: luma(240))[*31488*],
  ),
  caption: "Detailed Budget Estimation",
)

= Analysis of cost-benefit

This section explains the cost-benefit analysis of the "Farm Droid" from a financial feasibility/practical viability viewpoint . This analysis contrasts the initial development and operational costs against the tangible and intangible benefits generated over a projected 3-year operational lifecycle.

== Cost breakdown
The costs can be broken down to initial capital spending (CapEx) and regular operating spending (OpEx).

#figure(
  table(
    columns: (auto, auto, auto),
    fill: (col, row) => if row == 0 { luma(230) } else { white },
    align: (left, right, right),
    [*Cost Category*], [*Amount (BDT)*], [*Amount (USD)*],
    
    [*Capital Expenditure (CapEx)*], [33,000], [270],
    [*Operational Expenditure (OpEx - Annual)*], [3,000], [25],
    table.cell(colspan: 2, align: right, fill: luma(240))[*Total anticipated cost over three Years*], [42,000]
  ),
  caption: "Cost breakdown and total anticipated cost over three Years",
)

== Benefit analysis

#figure(
  table(
    columns: (auto, auto),
    fill: (col, row) => if row == 0 { luma(230) } else { white },
    align: (left, left),
    [*Benefit Type*], [*Description*],
    
    [*Tangible Benefits*], [Automated labor savings, yield protection through early detection, and resource efficiency lead to an estimated annual financial benefit of BDT 27,000.],
    [*Intangible Benefits*], [Soil preservation through reduced compaction, data-driven insights for better crop management, and improved safety for farm workers.]
  ),
  caption: "Summary of Tangible and Intangible Benefits",
)

// == Financial Metrics
// Using a conservative straight-line method with no discount rate for a low-cost prototype, the financial metrics are derived as follows:

// - *Net Annual Benefit:* $text("Annual Benefits") - text("Annual OpEx") = 27,000 - 3,000 = 24,000$

// - *Simple Payback Period:*
//   $text("Total CapEx") / text("Net Annual Benefit") = 33,000 / 24,000 = 1.385\ text("years") approx 16.6\ text("months")$

// - *3-Year Return on Investment (ROI):*
//   $((text("Total 3-Year Net Benefits") - text("CapEx")) / text("CapEx")) times 100% = ((72,000 - 33,000) / 33,000) times 100% = 118.18%$

== Market Comparison: Farm Droid vs. Commercial Alternatives

The overall estimated budget is about 258 USD (with an exchange rate of ~122 BDT/USD). Comparing with commercial robots, we get the following insights:

#figure(
  table(
    columns: (auto, auto, 1fr, auto),
    fill: (col, row) => if row == 0 { luma(230) } else { white },
    align: (left, left, left, right),
    [*Robot Model*], [*Brand*], [*Primary Function*], [*Price (USD)*],
    
    [*Farm Droid (Our Prototype)*], [*Custom*], [*Precision Monitoring & Manipulation*], [*258*],
    [ATEAGO 50W [7]], [ATEAGO], [Remote Lawn & Terrain Maintenance], [4,798],
    [ATEAGO 50PRO [8]], [ATEAGO], [Remote Lawn & Terrain Maintenance], [7,199],
    [ATEAGO 80PRO [9]], [ATEAGO], [Heavy Terrain Maintenance], [14,999],
    [ADIR Basic [10]], [Ant Robotics], [Autonomous Ag-Logistics & Scouting], [23,292],
    [ADIR Power [11]], [Ant Robotics], [Heavy Autonomous Ag-Logistics], [29,115],
  ),
  caption: "Price Comparison with Commercial Agriculture Robots (Source: RobotShop)",
)

= Comparison with related works

The following table shows a comparison of the features of our prototype with some works as of now.

#figure(
  table(
    columns: (auto, auto, auto, auto),
    fill: (col, row) => if row == 0 { luma(230) } else { white },
    align: (left, left, left, right),
    [Robot Model], [Primary Function(s)], [Locomotion & Control], [Key Features & Innovations],
    
    [Farm Droid (Our Prototype)], [Real-time monitoring, robotic manipulation, and weeding], [Rover, Raspberry Pi 4 (brain), Arduino (controller)], [Real time monitoring with weeding, modular robot arm, as well as opencv for image detection. Alongside Gemini is used for LLM integration.],
    [Modular 4WD Robot [12]], [Grass cutting, leaf crushing, and precision seeding], [4WD skid-steer, LiDAR/Camera, EKF state estimation], [Features a vertically stacked two-unit architecture with quick-release toolheads. Uses simulated coverage-path algorithms (like zigzag/boustrophedon) for 100% gap-free field coverage.],
    [AgriCruiser [13]], [Over-the-row precision spraying for weed management], [2-wheel front differential drive with rear casters], [Open-source, highly reconfigurable chassis made from T-slot extrusions. Offers adjustable track width (1.42–1.57 m) and high clearance at a low deployment cost of ~$5,000–$6,000.],
    [Six-Wheeled Laser Weeder [14]], [High-precision laser weed elimination], [6-wheeled, double four-bar linkage suspension], [Uses a 3-axis linear actuation mechanism to position a 10W blue diode laser directly over weeds, achieving a 97% hit rate while navigating obstacles up to 15 cm.],
    [FarmDroid FD20[15]], [Autonomous seeding and preventative mechanical weeding], [4-wheeled, solar-powered, GPS-guided], [Operates on a memory-based approach, recording exact GPS coordinates of planted seeds to mechanically weed between and within rows without complex real-time vision. Heavily studied for climate-smart soil management.],
    [BoniRob [16][17]], [Crop monitoring, targeted fertilization, and weeding], [4-wheel independently steered], [Adjusts working width dynamically (0.75m–2.0m) and uses mechanical cylinders to crush weeds as an alternative to herbicide spraying.],
    [ROBOTTI 150 D [18]], [Multipurpose field operations (evaluated for soil health impact)], [Lightweight wheeled vehicle], [Used extensively in research to quantify soil compaction. Studies show it causes less subsoil compaction than heavy tractors, though repeated wheeling still alters topsoil porosity.],
    [Tertill [19]], [Home garden weed control], [Solar-powered mini rover], [A consumer-grade, waterproof robot that autonomously navigates small plots and uses a simple wire/string trimmer to cut newly sprouted weeds.],
  ),
  caption: "Feature Comparison with Commercial Agriculture Robots (Source: RobotShop)",
)

= Work Timeline
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
image("ui/circuit_image.png", width: 100%),
caption: "Circuit Diagram of Farm Droid System",
)

This diagram shows the circuit design alongside pin diagram of each components, for easier navigation and reproducibility.


== Data Flow Diagram

#figure(
image("ui/dfd.png", width: 100%),
caption: "Data flow diagram of Farm Droid system",
)


= Results

This project shows the successful development of a prototype. Our bot is able to carry out basic agricultural activities such as monitoring soil moisture, temperature, rainfall and soil pH. The integration of computer vision allows it to detect obstacles, as well as perform weeding operations. The modular design of the robotic arm enables it to be used for various tasks in the future. And finally, it can also dig the ground and plant seeds in a small scale environment.


= Future Plans

+ To design and develop weeding tool, seed dispenser, watering nozzle etc as modular attachments of the Robotic arm.
+ Due to limited battery capacity, our project can't run continuously for a long time.

= Conclusion
The Farm Droid is a step towards modernising agriculture by robotics. This project will explore the potential of autonomous mobility and computer vision, to prove farming automation can be agile, intelligent and accessible. The successful completion of this project will result in a working prototype that can be used to move autonomously along paths and carry out basic agricultural activities.

= References

+ Daraz Bangladesh, 2026. URL: https://www.daraz.com.bd (accessed 16 June 2026).
+ Electronics.com.bd, 2026. URL: https://www.electronics.com.bd (accessed 16 June 2026).
+ ProjectKitsBD, 2026. URL: https://projectkitsbd.com (accessed 16 June 2026).
+ RoboticsBD Store, 2026. URL: https://store.roboticsbd.com (accessed 16 June 2026).
+ RobotShop, 2026. URL: https://www.robotshop.com (accessed 16 June 2026).
+ TechShopBD, 2026. URL: https://techshopbd.com (accessed 16 June 2026).
+ ATEAGO 50W Robotic Lawn Mower. URL:  https://www.robotshop.com/products/ateago-ateago-50w-remote-control-lawn-mower-robot-lawn-maintenance-grass-clean-for-garden-or-hill?qd=1aa0ec8ac9c7c76afc6866d7f11a121b  (accessed 16 June 2026).
+ ATEAGO 50PRO Robotic Lawn Mower. URL:  https://www.robotshop.com/collections/agriculture-robots  (accessed 16 June 2026).
+ ATEAGO 80PRO Robotic Lawn Mower. URL:  https://www.robotshop.com/products/ateago-ateago-50pro-remote-control-lawn-mower-robot-lawn-maintenance-robot-grass-clean-for-garden-or-hill?qd=1aa0ec8ac9c7c76afc6866d7f11a121b  (accessed 16 June 2026).
+ ADIR Basic Autonomous Agricultural Robot. URL:  https://www.robotshop.com/products/ant-robotics-adir-basic?qd=1aa0ec8ac9c7c76afc6866d7f11a121b  (accessed 16 June 2026).
+ ADIR Power Autonomous Agricultural Robot. URL:  https://www.robotshop.com/products/ant-robotics-adir-power?qd=1aa0ec8ac9c7c76afc6866d7f11a121b  (accessed 16 June 2026).
+ Kumar, A., Kamalaksha, S.A., Srividya, R., Zuber, M., Ahmad, K.A., Singh, S. and Nair, V.G., 2026. Modular 4WD agricultural robot for cutting, collection, and precision seeding: design and simulation-based evaluation. Scientific Reports.
+ Truong, K., 2025. AgriCruiser: An Open Source Agriculture Robot for Over-the-row Navigation. University of California, Los Angeles.
+ Usama, M., Khan, M.I., Hasan, A., Nadeem, M.S., Iqbal, K.F., Aslam, J., Ali, M.A. and Awan, A.N., 2025. Design of a six wheel suspension and a three-axis linear actuation mechanism for a laser weeding robot. arXiv preprint arXiv:2512.10319.
+ Bručienė, I., S. Buragienė, and E. Šarauskis. 2025. “Comparative Evaluation of the Effect of Conventional and Robotic Mechanical Weeding on Topsoil Physical Attributes.” Soil and Tillage Research 254: 106739.  https://doi.org/10.1016/j.still.2025.106739
+ Schaefer, A., Plant Robot “Bonirob”, Available at: https://www.youtube.com/watch?v=utiNto4BeOg, (last accessed 17.06.2026).
+ Langsenkamp, F., F. Sellmann, M. Kohlbrecher, et al. 2014. “Tube Stamp for Mechanical Intra-Row Indicidual Plant Weed Cover.” Agricultural Engineering International: CIGR Journal: 16–19. 
+ Calleja-Huerta, A., M. Lamandé, O. Green, and L. J. Munkholm. 2023a. “Impacts of Load and Repeated Wheeling From a Lightweight Autonomous Field Robot on the Physical Properties of a Loamy Sand Soil.” Soil and Tillage Research 233: 105791. https:// doi.org/10.1016/j.still.2023.105791
+ Sanchez, J., and E. R. Gallandt. 2021. “Functionality and Efficacy of Franklin Robotics' Tertill Robotic Weeder.” Weed Technology 35: 166– 170. https://doi.org/ 10.1017/ wet.2020.94


// #align(center + bottom)[
//   #v(2em)
//   *The End*
// ]