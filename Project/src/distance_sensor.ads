-- This package provides the mechanisms needed to operate the ultrasonic sensor.

with MicroBit.IOsForTasking;
with Ada.Real_Time; use Ada.Real_Time;
with distance_sensor_storage_pk;

package Distance_sensor is
   -- Sets trigger pin to 1 for 10 signal microseconds to emit ultrasound signal.
   procedure Trigger (Trigger_pin_val : MicroBit.IOsForTasking.Pin_Id);

   -- Sets echo pin to 1 then monitors time taken for rebounded ultrasound signal to cause it to return to 0.
   -- The time taken for the signal to return is used to calculate the distance the signal travelled.
   -- The function returns calculated distance as a floating point value.
   function Echo (Echo_pin_val : MicroBit.IOsForTasking.Pin_Id) return Float;

   -- Declares a task to be used to loop the sensor functions, so the sensor functions can continuously test whether the car is too near another object
   task Sensor_loop with Priority => 1;
end Distance_sensor;
