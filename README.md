# USA_Car_Project_ADA

### Brief summary
This git repository contains the code used in the group project at USN, where the overall task is to use a mechanum car and sensors to create a small real-time system. The main goal is that the car detects objects within 12cm, and turns until nothing is in front of the car. In addition, the wheels  stop turning if the car topples over and reach the threshold of 179.  

The system consists of:
- A mechanum car
- Micro:bit v3 board
- HC-SR04 ultrasonic sensor
- Battery, and the necessary wires

Our motivation for creating such a system is becasue we think this is a solution fitting within the scope of the task given. In addition, this solves on interesting case we wanted to investigate deeper; creating a autonomous car using ADA, a mechanum car and Micro:bit v2. 

### Code style
The project is coded in ADA, and the list below summarizes the main standards used:
- Capital letter for the first letter in each word
- Lowercase letters for remaining characters 
- Separate words with underscore (_)
- The specification file should include a summary of what the package does and what functions it consits of
- Assign unique and descriptive variables names

### Strucutre
The program is designed with four different tasks:
1. Main program
2. Control Task
3. HC-SR04 Task
4. Acceleramoter Task

The interaction between the different tasks is captured in the image below. 
![SoftwareDiagram](https://user-images.githubusercontent.com/69819933/201891176-b20fb396-03d2-4d97-a486-bcde1c75ee90.png)

The Control Program Task connects and controls the other tasks and the different states of the car movement. The car have three different states: Forward, Turned, Turn_Right. The image below shows the state diagram. 

![StateDiagram](https://user-images.githubusercontent.com/69819933/201891957-e92f748a-f17a-4a61-8a55-e1f10b9e679b.png)

