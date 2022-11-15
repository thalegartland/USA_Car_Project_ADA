--This package contains the functionality for a single wheel. It provides the ability to instruct each individual wheel to rotate forwards or backwards and stop. 
with MicroBit.IOsForTasking;

package Wheel is

   type Single_wheel is tagged record
      Pwm_pin, Forward_pin, Backward_pin : MicroBit.IOsForTasking.Pin_Id;
   end record;

   procedure Rotate_forwards (Self: Single_wheel);
   procedure Rotate_backwards (Self : Single_wheel);
   procedure Stop (Self : Single_wheel);
   
end Wheel;
