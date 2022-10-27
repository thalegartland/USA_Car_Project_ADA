with LSM303AGR; use LSM303AGR;

with MicroBit.DisplayRT;
with MicroBit.DisplayRT.Symbols;
with MicroBit.Accelerometer;
with MicroBit.Console;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;

use MicroBit;
package body Magnetometer is
   procedure get_mag_data is
      Data: All_Axes_Data;
      Threshold : constant := 150;
      
   begin

      --  Read the Magnetometer data
      Data := MicroBit.Accelerometer.m;

   
         --  Print the data on the serial port
      Put_Line ("ACC" & ";" &
                "X,"  & Data.X'Img & ";" &
                "Y,"  & Data.Y'Img & ";" &
                "Z,"  & Data.Z'Img);


      --  Clear the LED matrix
      MicroBit.DisplayRT.Clear;

      --  Draw a symbol on the LED matrix depending on the orientation of the
      --  micro:bit.
      if Data.X > Threshold then
         MicroBit.DisplayRT.Symbols.Left_Arrow;

      elsif Data.X < -Threshold then
         MicroBit.DisplayRT.Symbols.Right_Arrow;

      elsif Data.Y > Threshold then
         DisplayRT.Symbols.Up_Arrow;

      elsif Data.Y < -Threshold then
         MicroBit.DisplayRT.Symbols.Down_Arrow;

      else
         MicroBit.DisplayRT.Symbols.Heart;

      end if;

      --  Do nothing for 250 milliseconds
      delay until Clock + Milliseconds(16);
      end get_mag_data;

end Magnetometer;
