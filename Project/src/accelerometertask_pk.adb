with LSM303AGR; use LSM303AGR;

--with MicroBit.DisplayRT;
--with MicroBit.DisplayRT.Symbols;
with MicroBit.Accelerometer;
with Ada.Text_IO; use Ada.Text_IO;
 with Ada.Real_Time; use Ada.Real_Time;
use MicroBit;
with Acc_Storage_pk;


package body AccelerometerTask_pk is

   -- This task retrieves and processes the data from the accelerometer.
   -- This task is based on the example for accelerometer in ADA_Drivers_Library/examples/MicroBit_v2/ravenscar/accelerometer
   task body AccelerometerTask is 
      -- The variable Data collect data from the accelerometer and the type All_Axes_Data 
      Data: All_Axes_Data;
      
      
      -- The threshold for when the car is overturned or not is set to 179 for all axis. 
      Threshold : constant := 179;
      
      -- Registrer if the car has overturned
      Overturned : Boolean := false;
      --Time_Now : Time;
      
   begin 
      --accept Start;
      
   
      loop
         --Time_Now := Clock;

            --  Read the accelerometer data
            Data := MicroBit.Accelerometer.AccelData;
           -- MicroBit.DisplayRT.Clear;


         -- The if statement detect the slope of the microbit and then set the overturned variable if the Thershold is over 179 or lower than -179
         -- If the car slope more than 179 in x direction, then set the overturned variable to true. 
         if Data.X > Threshold then
            Overturned := True;
            -- If the car slope more less than 179 in x direction, then set the overturned variable to true.
         elsif Data.X < -Threshold then
            Overturned := True;
            -- If the car slope more than 179 in y direction, then set the overturned variable to true.
         elsif Data.Y > Threshold then
            Overturned := True;
            -- If the car slope less than -179 in y direction, then set the overturned variable to true. 
         elsif Data.Y < -Threshold then
            Overturned := False;
            -- If the car slope between 179 and -179 in x and y direction, the overturned variable is set false. 
            else
              Overturned := True;

         end if;
         -- This line set the the protectet object in the Acc_Storage_pk. 
         -- If the overturned variable is true shall the upright procedure be set to false and virce versa. 
         Acc_Storage_pk.storage.upright(not(Overturned));

            --  Do nothing for 250 milliseconds
            delay until Clock + Milliseconds(10);

      end loop;
      
         
         
   end AccelerometerTask;
end AccelerometerTask_pk;
