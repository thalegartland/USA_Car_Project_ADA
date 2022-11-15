package body Wheel is

   procedure Rotate_forwards (Self: Single_wheel) is                            -- Procedure sets the appropriate pin values for a given wheel such that it rotates forwards
   begin
      
      MicroBit.IOsForTasking.Set(Self.Pwm_pin, True);
      
      MicroBit.IOsForTasking.Set(Self.Forward_pin, True);
      MicroBit.IOsForTasking.Set(Self.Backward_pin, False);
      
   end Rotate_forwards;
   
   
   procedure Rotate_backwards (Self : Single_wheel) is                          -- Procedure sets the appropriate pin values for a given wheel such that it rotates backwards
   begin
      
      MicroBit.IOsForTasking.Set(Self.Pwm_pin, True);
      
      MicroBit.IOsForTasking.Set(Self.Forward_pin, False);
      MicroBit.IOsForTasking.Set(Self.Backward_pin, True);
      
   end Rotate_backwards;
   
   
   procedure Stop (Self : Single_wheel) is                                      -- Sets PWM pin to FALSE so that the given wheel stops
   begin
      
      MicroBit.IOsForTasking.Set(Self.Pwm_pin, False);
      
   end Stop;
   
   
end Wheel;
