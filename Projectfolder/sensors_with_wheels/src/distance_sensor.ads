with MicroBit.IOsForTasking;
with Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Console;

package Distance_sensor is

   protected Sensor_flag is

      procedure Set (Value : Boolean);
      function Get return Boolean;

   private

      Flag_value : Boolean := False;

   end Sensor_flag;

   procedure Trigger (Trigger_pin_val : MicroBit.IOsForTasking.Pin_Id);
   function Echo (Echo_pin_val : MicroBit.IOsForTasking.Pin_Id) return Float;

   function Proximity_warning return Boolean;

   task Sensor_loop with Priority => 1;


end Distance_sensor;
