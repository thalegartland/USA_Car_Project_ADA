with Wheels;
with distance_sensor;
with AccelerometerTask_pk;
with Acc_Storage_pk;
with Ada.Real_Time; use Ada.Real_Time;

package body Control_Program is
   
   -- This is the states the car can have:
   --     forward
   --     turn_right
   --     turned
   type move_state is (forward, turn_right, turned);
   
   
   task body Control_Car is
      Car : Wheels.Set_of_wheels;
      current_state : move_state := forward;
      Time_Now : Time;
      Time_next : Time;
      D : Time_Span := Seconds (2);
   begin
      loop
         case current_state is 
            when forward =>
               Wheels.Drive_forward(Car);
               if Distance_sensor.Sensor_flag.Get then 
                  Time_Next := Clock + D;
                  current_state := turn_right;
               elsif not(Acc_Storage_pk.storage.get_upright) then 
                  current_state := turned;
               end if;
            when turn_right =>               
               Wheels.Rotate_clockwise(car);
               if not(Acc_Storage_pk.storage.get_upright) then 
                  current_state := turned;
               end if;
               Time_Now := Clock;
                  if (Time_Now > Time_Next) then 
                  current_state := forward;
               end if;
            when turned =>
               Wheels.Brake(Car);
               if (Acc_Storage_pk.storage.get_upright) then 
                  current_state := forward;
               end if;
         end case;
         delay until Clock + Milliseconds(5);
      end loop;
      
   end Control_Car;
   

  
end Control_Program;
