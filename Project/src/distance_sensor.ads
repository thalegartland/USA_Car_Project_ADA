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


   procedure Trigger (Trigger_pin_val : MicroBit.IOsForTasking.Pin_Id);       --Sets trigger pin to 1 for 10 signal.

   function Echo (Echo_pin_val : MicroBit.IOsForTasking.Pin_Id) return Float; --Sets echo pin to 1 then monitors time

   task Sensor_loop with Priority => 3;                                       --Declares a task to be used to loop
                                                                              --the sensor functions so as to
                                                                              --test continuously whether the car
                                                                              --is too near another object.
end Distance_sensor;
