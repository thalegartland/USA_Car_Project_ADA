-- This package provides the mechanisms needed to operate the ultrasonic sensor.

with MicroBit.IOsForTasking;
with Ada.Real_Time; use Ada.Real_Time;
with distance_sensor_storage_pk;

package Distance_sensor is

   procedure Trigger (Trigger_pin_val : MicroBit.IOsForTasking.Pin_Id);         -- Sets trigger pin to 1 for 10 signal
                                                                                -- microseconds to emit ultrasound
                                                                                -- signal.

   function Echo (Echo_pin_val : MicroBit.IOsForTasking.Pin_Id) return Float;   -- Sets echo pin to 1 then monitors time
                                                                                -- taken for rebounded ultrasound signal
                                                                                -- to cause it to return to 0. The time
                                                                                -- taken for the signal to return is
                                                                                -- used to calculate the distance the
                                                                                -- signal travelled. The function  the
                                                                                -- returns calculated distance as a
                                                                                -- floating point value.

   task Sensor_loop with Priority => 1;                                         -- Declares a task to be used to loop
                                                                                -- the sensor functions so as to
                                                                                -- test continuously whether the car
                                                                                -- is too near another object.

end Distance_sensor;
