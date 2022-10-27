
package body Distance_sensor is

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
   
   function Measure_distance (Trigger_pin_val : MicroBit.IOsForTasking.Pin_Id; Echo_pin_val : MicroBit.IOsForTasking.Pin_Id) return Float is
   begin
      
      Trigger (Trigger_pin_val);
      return Echo(Echo_pin_val);
      
   end Measure_distance;
   
end Distance_sensor;
