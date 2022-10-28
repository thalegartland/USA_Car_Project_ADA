with Wheels;
with distance_sensor;
with AccelerometerTask_pk;
with Acc_Storage_pk;
with Ada.Real_Time; use Ada.Real_Time;

package body Control_Program is
   
   -- The procedure to determine how the car is controlled, e.g. how it should move based on a boolaen i
  -- task body Car_React_To_Distance_Sensor is
  --    Car : Wheels.Set_of_wheels;
  -- begin
     -- loop
       --  if Distance_sensor.Proximity_warning_flag then
        --    Car.sideways_left;
       --  end if;
   --   end loop;
      
  -- end Car_React_To_Distance_Sensor;
   
 --  task body Normal_Behaviour is
--     Car : Wheels.Set_of_wheels;
 --  begin
  --    loop
   --      Car.Drive_forward;
   --   end loop;
  -- end Normal_Behaviour;
   
   task body Stop_Car is
      Car : Wheels.Set_of_wheels;
   begin
      loop
         if not(Acc_Storage_pk.storage.get_upright) then
            Wheels.Brake(Car);
         else
            Wheels.Drive_forward(Car);
         end if;
         delay until Clock + Microseconds(100);
      end loop;
      
   end Stop_Car;
  
end Control_Program;
