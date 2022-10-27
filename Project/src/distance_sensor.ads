with MicroBit.IOsForTasking;
with Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Console;

package Distance_sensor is

   procedure Trigger (Trigger_pin_val : MicroBit.IOsForTasking.Pin_Id);
   function Echo (Echo_pin_val : MicroBit.IOsForTasking.Pin_Id) return Float;
   function Measure_distance (Trigger_pin_val : MicroBit.IOsForTasking.Pin_Id; Echo_pin_val : MicroBit.IOsForTasking.Pin_Id) return Float;

end Distance_sensor;
