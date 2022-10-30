with Wheels;
with distance_sensor;
with AccelerometerTask_pk;
with Acc_Storage_pk;
with Ada.Real_Time; use Ada.Real_Time;

package body Control_Program is
   
   task body Stop_Car is
      Car : Wheels.Set_of_wheels;
      --Time_Now : Time;
   begin
      loop
         --Time_Now := Clock;
         if not(Acc_Storage_pk.storage.get_upright) then
            Wheels.Brake(Car);
         elsif Distance_sensor.Sensor_flag.Get then 
            Wheels.sideways_left(Car);
         else
            Wheels.Drive_forward(Car);
         end if;
         delay until Clock + Milliseconds(10);
      end loop;
      
   end Stop_Car;
   

  
end Control_Program;
