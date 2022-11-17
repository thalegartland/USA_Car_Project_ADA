with AccelerometerTask_pk;
with distance_sensor;
with Wheels;
with Acc_Storage_pk;
with distance_sensor_storage_pk;
with Ada.Real_Time; use Ada.Real_Time;

package body Control_Program is
   
   -- This is the states the car can have: forward, turn_right, turned
   type move_state is (forward, turn_right, turned);
   
   -- The task Control_Car is a task that get in the infromation from the sensor task and control the movements to the car. 
   -- By processing this data, this task set the state of what the car shall do. 
   -- The task use a case statement to switch between the state to the car. 
   
   task body Control_Car is
      Car : Wheels.Set_of_wheels;             -- The car variable define the car in wheels.
      current_state : move_state := forward;  -- Before the loop in the task start the current_state to the car must be set to forward. 
      
      -- The variable Time_Now and Time_next is used to control how long the car turns to the right after detection
      Time_Now : Time;                        
      Time_next : Time;                       
      D : Time_Span := Milliseconds (1700);   -- The variable D is used to control how long time the car shall turn right.
   begin
      loop
         -- This case statement is used to set the states that control the movements to the car. 
        
         case current_state is 
            
            -- The forward case set the car to drive forward.
            -- If the accelerometer detect that the car has overturned the current_state is set to turned. 
            -- If the distance sensor detect something in front the Time_Next variable is set to the clock time plus the D variable.
            -- Then the current_state is switched to turn_right.
            -- Now it has been determined that everything is OK. We repeatedly will tell the wheels to move forward.
            when forward =>                   
               Wheels.Drive_forward(Car);
               if not(Acc_Storage_pk.storage.get_upright) then 
                  current_state := turned; 
               elsif distance_sensor_storage_pk.Sensor_flag.Get  then  
                  Time_Next := Clock + D;   
                  current_state := turn_right;  
               else
                  Wheels.Drive_forward(Car);
               end if;
               
            -- The turn_right case set the car to rotate clockwise.
            -- If the accelerometer detect that the car has overturned the current_stat is set to turned.
            -- If the car dosent overturn the car will rotate until the time_Now is more than Time_Next.
            -- When Time_Now is more than Time_Next the current_state will switch to forward.
            when turn_right =>                                                   
               Wheels.Rotate_clockwise(car); 
               if not(Acc_Storage_pk.storage.get_upright) then                 
                  current_state := turned;
               end if; 
               Time_Now := Clock;                                                
                  if (Time_Now > Time_Next) then                                
                  current_state := forward;
               end if; 
               
            -- The turned case set the car on brake wich mean that the wheels stop rotating.
            -- If the accelerometer detect that the car is upright then the current_state is set to forward.
            when turned =>                                                      
               Wheels.Brake(Car); 
               if (Acc_Storage_pk.storage.get_upright) then                     
                  current_state := forward;
               end if;
         end case;
         
         delay until Clock + Microseconds(500);
         
      end loop;
      
   end Control_Car;
end Control_Program;
