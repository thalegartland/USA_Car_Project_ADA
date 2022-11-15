with MicroBit.IOsForTasking;
with Ada.Real_Time; use Ada.Real_Time;
with distance_sensor_storage_pk;

package Distance_sensor is

   procedure Trigger (Trigger_pin_val : MicroBit.IOsForTasking.Pin_Id);         --Sets trigger pin to 1 for 10 signal.
   function Echo (Echo_pin_val : MicroBit.IOsForTasking.Pin_Id) return Float;   --Sets echo pin to 1 then monitors time
   task Sensor_loop with Priority => 1;                                         --Declares a task to be used to loop                                                                             --the sensor functions so as t                                                                             --test continuously whether                                                                           --is too near another object.
end Distance_sensor;
