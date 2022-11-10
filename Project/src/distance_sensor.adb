
package body Distance_sensor is

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
      --Updates Initial_time value until confirmed that echo pin set to 1 1.
      while MicroBit.IOsForTasking.Set(Echo_pin_val) = False loop               
         Initial_time := Ada.Real_Time.Clock;
      end loop;
      --Updates Final_time value until signal confirmed returned, which is indicated by echo pin returning to 0.
      while MicroBit.IOsForTasking.Set(Echo_pin_val) loop                       
         Final_time := Ada.Real_Time.Clock;                                     
      end loop;
      
      Distance_detected := 
        --Calculates distance travelled using time measured.
        Float(To_Duration((34300*(Final_time - Initial_time))/2));              
      return Distance_detected;
      
   end Echo;
   
   task body Sensor_loop is  
      Time_Now : Time;
   begin
      loop
         Time_Now := Clock;
         Trigger(10);
         if Echo(4) < 12.0 then
            distance_sensor_storage_pk.sensor_flag.Set(True);
         else
            distance_sensor_storage_pk.Sensor_flag.Set(False);   
         end if;
         delay until Time_Now + Milliseconds(20);
      end loop;
      
   end Sensor_loop;
   
end Distance_sensor;
