
package body Distance_sensor is
   
   protected body Sensor_flag is
      
      procedure Set (Value : Boolean) is                                        --To set the value of Flag_value          
      begin
         
         Flag_value := Value;
         
      end Set;
      
      function Get return Boolean is                                            --To return the value of Flag_value
      begin
         
         return Flag_value;
      
      end Get;
      
   end Sensor_flag;
         

   procedure Trigger (Trigger_pin_val : MicroBit.IOsForTasking.Pin_Id) is

      Signal_duration : constant Ada.Real_Time.Time_Span 
        := Ada.Real_Time.Microseconds(10);
      Delay_time : Ada.Real_Time.Time 
        := Ada.Real_Time.Clock + Signal_duration;
      
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
      
      while MicroBit.IOsForTasking.Set(Echo_pin_val) = False loop               --Updates Initial_time value until 
                                                                                --confirmed that echo pin set to 1.
         Initial_time := Ada.Real_Time.Clock;
         
      end loop;
      
      while MicroBit.IOsForTasking.Set(Echo_pin_val) loop                       --Updates Final_time value until
                                                                                --signal confirmed returned, which
         Final_time := Ada.Real_Time.Clock;                                     --is indicated by echo pin returning
                                                                                --to 0.
      end loop;
      
      Distance_detected := 
        Float(To_Duration((34300*(Final_time - Initial_time))/2));              --Calculates distance travelled
                                                                                --using time measured.
      return Distance_detected;
      
   end Echo;
   
   
   function Proximity_test return Boolean is
   begin
      
      if Echo(1) < 30.0 then
         
         return True;
         
      else
         
         return False;     
         
      end if;
                    
   end Proximity_test;
   
   
   task body Sensor_loop is
      
   begin
         
      loop
        
         Trigger(0);
         Sensor_flag.Set(Proximity_test);
                  
      end loop;
      
   end Sensor_loop;
   
end Distance_sensor;
