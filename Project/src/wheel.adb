package body Wheel is

   -- Procedure sets the appropriate pin values for a given wheel such that it rotates forwards
   procedure Rotate_forwards (Self: Single_wheel) is                            
   begin 
      MicroBit.IOsForTasking.Set(Self.Pwm_pin, True);
      MicroBit.IOsForTasking.Set(Self.Forward_pin, True);
      MicroBit.IOsForTasking.Set(Self.Backward_pin, False);  
   end Rotate_forwards;
   
   -- Procedure sets the appropriate pin values for a given wheel such that it rotates backwards
   procedure Rotate_backwards (Self : Single_wheel) is                          
   begin 
      MicroBit.IOsForTasking.Set(Self.Pwm_pin, True);
      MicroBit.IOsForTasking.Set(Self.Forward_pin, False);
      MicroBit.IOsForTasking.Set(Self.Backward_pin, True);
   end Rotate_backwards;
   
   -- Sets PWM pin to FALSE so that the given wheel stops
   procedure Stop (Self : Single_wheel) is                                      
   begin
      MicroBit.IOsForTasking.Set(Self.Pwm_pin, False);
   end Stop;
end Wheel;
