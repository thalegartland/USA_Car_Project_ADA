with MicroBit.IOsForTasking;
with Ada.Real_Time; use Ada.Real_Time;

package Distance_sensor is

   protected Sensor_flag is                                                   --Declares protected object which
                                                                              --encapsulates the flag value used to
      procedure Set (Value : Boolean);                                        --indicate if the car is too close to
      function Get return Boolean;                                            --an object.

   private

      Flag_value : Boolean := False;

   end Sensor_flag;

   procedure Trigger (Trigger_pin_val : MicroBit.IOsForTasking.Pin_Id);       --Sets trigger pin to 1 for 10
                                                                              --microseconds to emit ultrasound
                                                                              --signal.

   function Echo (Echo_pin_val : MicroBit.IOsForTasking.Pin_Id) return Float; --Sets echo pin to 1 then monitors time
                                                                              --taken for rebounded ultrasound signal
                                                                              --to cause it to return to 0. The time
                                                                              --taken for the signal to return is
                                                                              --used to calculate the distance the
                                                                              --signal travelled. The function  the
                                                                              --returns calculated distance as a
                                                                              --floating point value.

   function Proximity_test return Boolean;                                    --Checks if the sensor detects an
                                                                              --object that's too close (within 30cm)
                                                                              --and, if so, returns True.

   task Sensor_loop with Priority => 1;                                       --Declares a task to be used to loop
                                                                              --the sensor functions so as to
                                                                              --test continuously whether the car
                                                                              --is too near another object.
end Distance_sensor;
