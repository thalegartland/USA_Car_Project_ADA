-- This program is intended to determine how the meacanum car reacts when there is a obejct in front of the vechicle. 
-- Creator: Thale
-- Last modified: 26.10.22

-- For this program we only need some of the procedures within the control_program package. 
-- From the Distance_sensor package we need information about wheater a object is infront of the sensor or not

package control_program is
   
   --task Input_Distance_Sensor with Priority => 2;
   --task Normal_Behaviour with Priority => 3;
   task Stop_Car with Priority => 2;
   
end control_program;
