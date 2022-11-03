with LSM303AGR; use LSM303AGR;

with MicroBit.DisplayRT;
with MicroBit.DisplayRT.Symbols;
with MicroBit.Accelerometer;
--with MicroBit.Console;
with Ada.Text_IO; use Ada.Text_IO;
 with Ada.Real_Time; use Ada.Real_Time;
use MicroBit;
with Acc_Storage_pk;


package body AccelerometerTask_pk is

   task body AccelerometerTask is 
      Data: All_Axes_Data;
      
      -- The threshold for when the car is overturned or not.
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
            MicroBit.DisplayRT.Clear;

            --  Draw a symbol on the LED matrix depending on the orientation of the
            --  micro:bit.
            -- The if statement detect the slope of the microbit and then set the 
            -- overturned variable if the Thershold is over 179 or lower than -179
            if Data.X > Threshold then
               MicroBit.DisplayRT.Symbols.Cross;
               Overturned := True;

             elsif Data.X < -Threshold then
               MicroBit.DisplayRT.Symbols.Cross;
               Overturned := True;

             elsif Data.Y > Threshold then
               DisplayRT.Symbols.Cross;
             Overturned := True;

            elsif Data.Y < -Threshold then
              Overturned := False;
            else
               MicroBit.DisplayRT.Symbols.Cross;
              Overturned := True;

         end if;
         -- This line set the the protectet object to true. 
         Acc_Storage_pk.storage.upright(not(Overturned));

            --  Do nothing for 250 milliseconds
            delay until Clock + Milliseconds(10);

      end loop;
      
         
         
   end AccelerometerTask;
end AccelerometerTask_pk;
