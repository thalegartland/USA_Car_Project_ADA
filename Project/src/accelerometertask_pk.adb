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
      Threshold : constant := 179;
      Overturned : Boolean := false;
      --Time_Now : Time;
      
   begin 
      --accept Start;
      
   
      loop
         --Time_Now := Clock;

            --  Read the accelerometer data
            Data := MicroBit.Accelerometer.AccelData;

   
            --  Print the data on the serial port
            -- Put_Line ("ACC" & ";" &
            --             "X,"  & Data.X'Img & ";" &
            --             "Y,"  & Data.Y'Img & ";" &
            --             "Z,"  & Data.Z'Img);


            --  Clear the LED matrix
            MicroBit.DisplayRT.Clear;

            --  Draw a symbol on the LED matrix depending on the orientation of the
            --  micro:bit.
            if Data.X > Threshold then
               MicroBit.DisplayRT.Symbols.Cross;
               --Left Arrow
               --Returner 0
               Overturned := True;

             elsif Data.X < -Threshold then
               MicroBit.DisplayRT.Symbols.Cross;
               --Right Arrow
               --Returer 0
               Overturned := True;

             elsif Data.Y > Threshold then
               DisplayRT.Symbols.Cross;
               --Arrow up
               --Returner 0
             Overturned := True;

            elsif Data.Y < -Threshold then
            --  MicroBit.DisplayRT.Symbols.Smile;
               --Arrow down
               --Returner 1
              Overturned := False;
            else
              -- MicroBit.DisplayRT.Symbols.Cross;
               --Returner 0
              Overturned := True;

         end if;
         Acc_Storage_pk.storage.upright(not(Overturned));

            --  Do nothing for 250 milliseconds
            delay until Clock + Milliseconds(10);
         --delay 1.0;
         
         --Ada.Text_IO.Put_Line("A");
         
      end loop;
      
         
         
   end AccelerometerTask;
   
   
  --    procedure Start is 
  --    begin
  --       null;
         --AccelerometerTask.Start;
  --    end Start;
      
end AccelerometerTask_pk;
