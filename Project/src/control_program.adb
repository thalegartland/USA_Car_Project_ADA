with Wheels;
with distance_sensor;
with AccelerometerTask_pk;
with Acc_Storage_pk;
with Ada.Real_Time; use Ada.Real_Time;
with distance_sensor_storage_pk;

package body Control_Program is
   
   -- This is the states the car can have:
   --     forward
   --     turn_right
   --     turned
   type move_state is (forward, turn_right, turned);
   
   -- The task Control_Car is a task that get in the infromation from the sensor task and control the movements to the car. 
   -- By processing this data, this task set the state of what the car shall do. 
   -- The task use a case statement to switch between the state to the car. 
   task body Control_Car is
      -- The car variable define the car in wheels. 
      Car : Wheels.Set_of_wheels;
      -- Before the loop in the task start the current_state to the car must be set. 
      -- Here it make sense to start to start dirving forward. 
      current_state : move_state := forward;
      -- The variable Time_Now and time_next is a time variable that is used in the case to control how long time the car shall turn right after the dictance sensor has detected something in front of the car.
      Time_Now : Time;
      Time_next : Time;
      -- The variable D is used to control how long time the car shall turn right. 
      D : Time_Span := Seconds (2);
   begin
      loop
         -- This case statement is used to set the states that control the movements to the car. 
         case current_state is 
            -- The forward case set the car to drive forward.
            when forward =>
               Wheels.Drive_forward(Car);
              -- If the accelerometer detect that the car has overturned the current_state is set to turned. 
               if not(Acc_Storage_pk.storage.get_upright) then 
                  current_state := turned;
               -- If the distance sensor detect something in front the Time_Next variable is set to the clock time plus the D variable. 
               -- Then the current_state is switched to turn_right. 
               elsif distance_sensor_storage_pk.Sensor_flag.Get  then 
                  Time_Next := Clock + D;
                  current_state := turn_right;
               else
                  -- Now it has been determined that everything is OK. 
                  -- We repeatedly will tell the wheels to move forward.
                  Wheels.Drive_forward(Car);
               end if;
               -- The turn_right case set the car to rotate clockwise. 
            when turn_right =>               
               Wheels.Rotate_clockwise(car);
               -- If the accelerometer detect that the car has overturned the current_stat is set to turned. 
               if not(Acc_Storage_pk.storage.get_upright) then 
                  current_state := turned;
               end if;
               -- If the car dosent overturn the car will rotate until the time_Now is more than Time_Next. 
               Time_Now := Clock;
               -- When Time_Now is more than Time_Next the current_state will switch to forward. 
                  if (Time_Now > Time_Next) then 
                  current_state := forward;
               end if;
               -- The turned case set the car on brake wich mean that the wheels stop rotating. 
            when turned =>
               Wheels.Brake(Car);
               -- If the accelerometer detect that the car is upright then the current_state is set to forward. 
               if (Acc_Storage_pk.storage.get_upright) then 
                  current_state := forward;
               end if;
         end case;
         delay until Clock + Milliseconds(5);
      end loop;
      
   end Control_Car;

  
end Control_Program;
