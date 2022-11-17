--This package bpdy includes the decleration of the procedure Trigger, the function Echo and the task Sensor_loop. 
--The protected object is between the task Sensor_loop and the protected object Sensor_flag.

package body Distance_sensor is

   -- This procedure controls the trigger pin on the HC-SR04.
   -- The input value to the procedure is the pin number.
   procedure Trigger (Trigger_pin_val : MicroBit.IOsForTasking.Pin_Id) is  
      Signal_duration : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Microseconds(10); 
      Delay_time : Ada.Real_Time.Time := Ada.Real_Time.Clock + Signal_duration;
   begin
      MicroBit.IOsForTasking.Set(Trigger_pin_val, True);
      delay until Delay_time;
      MicroBit.IOsForTasking.Set(Trigger_pin_val, False);  
   end Trigger;
   
   
   function Echo (Echo_pin_val : MicroBit.IOsForTasking.Pin_Id) return Float is 
      Initial_time : Ada.Real_Time.Time := Ada.Real_Time.Clock;
      Final_time : Ada.Real_Time.Time := Ada.Real_Time.Clock;
      Distance_detected : Float;
   begin
      MicroBit.IOsForTasking.Set(Echo_pin_val, True);
      
      -- Updates Initial_time value until confirmed that echo pin set to TRUE.
      while MicroBit.IOsForTasking.Set(Echo_pin_val) = False loop          
         Initial_time := Ada.Real_Time.Clock;                                                    
      end loop;
      
      -- Updates Final_time value until signal confirmed returned, which is indicated by echo pin returning to FALSE.
      while MicroBit.IOsForTasking.Set(Echo_pin_val) loop               
         Final_time := Ada.Real_Time.Clock;                                  
      end loop;
      
      -- Calculates distance travelled using time measured.
      Distance_detected := Float(To_Duration((34300*(Final_time - Initial_time))/2));              
      return Distance_detected;
      
   end Echo;
   
   
   -- This task retrieves and processes the data from the distance sensor HC-SR04.
   --  It sets the appropriate flag value based on the sensor's input. 
   task body Sensor_loop is                                                                                                           
      Time_Now : Time;                                                                                                
      
   begin
      loop 
         Time_Now := Clock;  -- Here the Time_Now variable is set to the time of the clock of the start of the loop.                                                                                                                                                     
         Trigger(10);        -- Here the Trigger procedure are used and the pin 10 is the input variable.                                          
         
         -- The if loop use the Echo function to chech if the distance between the sensor and a object in front is less than 12cm. 
         if Echo(4) < 12.0 then    -- If the distance is less than 12cm the value of the protected objec sensor_flag is set true.                                                               
            distance_sensor_storage_pk.sensor_flag.Set(True);  
         else                      -- If the distance is not less than 12c the value of the protected object sensor_flag is set flase.   
            distance_sensor_storage_pk.Sensor_flag.Set(False);                                                                                                                        
         end if;

         delay until Time_Now + Milliseconds(20);
      end loop;
      
   end Sensor_loop;
end Distance_sensor;
