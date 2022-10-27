
package body Distance_sensor is
   
   protected body Sensor_flag is
      
      procedure Set (Value : Boolean) is
      begin
         
         Flag_value := Value;
         
      end Set;
      
      function Get return Boolean is
      begin
         
         return Flag_value;
      
      end Get;
      
   end Sensor_flag;
         

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
      
      while MicroBit.IOsForTasking.Set(Echo_pin_val) = False loop
         
         Initial_time := Ada.Real_Time.Clock;
         
      end loop;
      
      while MicroBit.IOsForTasking.Set(Echo_pin_val) loop
         
         Final_time := Ada.Real_Time.Clock;
         
      end loop;
      
      Distance_detected := Float(To_Duration((34300*(Final_time - Initial_time))/2));
      
      return Distance_detected;
      
   end Echo;
   
   
   function Proximity_warning return Boolean is
   begin
      
      if Echo(1) < 30.0 then
         
         return True;
         
      else
         
         return False;     
         
      end if;
                    
   end Proximity_warning;
   
   
   task body Sensor_loop is
      
     Start_time : Ada.Real_Time.Time;
      
   begin
         
      loop
         
         Start_time := Ada.Real_Time.Clock;
        
         Trigger(0);
         Sensor_flag.Set(Proximity_warning);
                  
   end loop;
      
   end Sensor_loop;
   
end Distance_sensor;
