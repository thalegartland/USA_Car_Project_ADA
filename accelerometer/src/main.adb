--with LSM303AGR; use LSM303AGR;
--with MicroBit.DisplayRT;
--with MicroBit.DisplayRT.Symbols;
--with MicroBit.Accelerometer;
--with MicroBit.Console;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
--with Accelerometer_pk;
with AccelerometerTask_pk;
with Acc_Storage_pk;
with MicroBit.IOsForTasking;
--use MicroBit;

procedure Main with Priority => 0 is
begin
   loop

   --AccelerometerTask_pk.Start;
      null;
      if Acc_Storage_pk.storage.get_upright
      then
         Ada.Text_IO.Put("Car is Uprihgt");
      else
         Ada.Text_IO.Put("Car is overturned!");
      end if;

      delay 1.0;
 --  end loop;

      end loop;


end Main;

