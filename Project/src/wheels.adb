package body Wheels is

   -- Procedure that sets the car's set of wheels to drive forwards
   procedure Drive_forward (Self : Set_of_wheels) is                            
   begin
      Self.Front_left_wheel.Rotate_forwards;
      Self.Front_right_wheel.Rotate_forwards;
      Self.Back_left_wheel.Rotate_forwards;
      Self.Back_right_wheel.Rotate_forwards;
   end Drive_forward;     
   
   -- Rotates car in clockwise direction on the spot
   procedure Rotate_clockwise (Self : Set_of_wheels) is                         
   begin
      Self.Front_left_wheel.Rotate_forwards;
      Self.Front_right_wheel.Rotate_backwards;
      Self.Back_left_wheel.Rotate_forwards;
      Self.Back_right_wheel.Rotate_backwards;
   end Rotate_clockwise;
          
   -- Stops all four wheels, causing the car to break
   procedure Brake (Self : Set_of_wheels) is                                    
   begin
      Self.Front_left_wheel.Stop;
      Self.Front_right_wheel.Stop;
      Self.Back_left_wheel.Stop;
      Self.Back_right_wheel.Stop;
   end Brake;
          
   
-- The below driving procedures were created but not required for the final 
-- driving logic.    
   
-- Procedure sets the car's wheel pins so that the car to drives backwards.
--   procedure Drive_backwards (Self : Set_of_wheels) is                        
--   begin                                                                     
--      Self.Front_left_wheel.Rotate_backwards;
--      Self.Front_right_wheel.Rotate_backwards;
--      Self.Back_left_wheel.Rotate_backwards;
--      Self.Back_right_wheel.Rotate_backwards;  
--   end Drive_backwards;  

   
-- Procedure sets car's wheel pins so that it drives forwards diagonally towards the left.
--   procedure Forward_left (Self : Set_of_wheels) is                          
--   begin                                                                      
--      Self.Front_left_wheel.Stop;
--      Self.Front_right_wheel.Rotate_forwards;
--      Self.Back_left_wheel.Rotate_forwards;
--      Self.Back_right_wheel.Stop;
--      null;
--   end Forward_left;
   
   
-- Procedure sets car's wheel pins so that it drives forwards diagonally towards the left.
--   procedure Forward_right (Self : Set_of_wheels) is                             
--   begin                                                                      
--      Self.Front_left_wheel.Rotate_forwards;
--      Self.Front_right_wheel.Stop;
--      Self.Back_left_wheel.Stop;
--      Self.Back_right_wheel.Rotate_forwards; 
--   end Forward_right;
      

-- Procedure sets car's wheel pins so that it drives backwards diagonally towards the left.
--   procedure Backward_left (Self : Set_of_wheels) is                            
--   begin                                                                      
--      Self.Front_left_wheel.Rotate_backwards;
--      Self.Front_right_wheel.Stop;
--      Self.Back_left_wheel.Stop;
--      Self.Back_right_wheel.Rotate_backwards; 
--      null;
--   end Backward_left;
   
   
-- Procedure sets car's wheel pins so that it drives backwards diagonally towards the right.
--   procedure Backward_right (Self : Set_of_wheels) is                          
--   begin                                                                      
--      Self.Front_left_wheel.Stop;
--      Self.Front_right_wheel.Rotate_backwards;
--      Self.Back_left_wheel.Rotate_backwards;
--      Self.Back_right_wheel.Stop;
--      null;
--   end Backward_right;
   
   
-- Instructs the car to turn left by setting the two required pins to rotate forwards and the two remaining to stop.
--   procedure Turn_left (Self : Set_of_wheels) is                              
--   begin                                                                      
--      Self.Front_left_wheel.Stop;
--      Self.Front_right_wheel.Rotate_forwards;
--      Self.Back_left_wheel.Stop;
--      Self.Back_right_wheel.Rotate_forwards;
--   end Turn_left;
   
   
-- Instructs the car to turn right by setting the two required pins to rotate forwards and the two remaining to stop.
--   procedure Turn_right (Self : Set_of_wheels) is                              
--   begin                                                                     
--      Self.Front_left_wheel.Rotate_forwards;
--      Self.Front_right_wheel.Stop;
--      Self.Back_left_wheel.Rotate_forwards;
--      Self.Back_right_wheel.Stop;
--   end Turn_right;

   
-- Rotates car in anticlockwise direction on the spot
--   procedure Rotate_anticlockwise (Self : Set_of_wheels) is                   
--   begin
--      Self.Front_left_wheel.Rotate_backwards;
--      Self.Front_right_wheel.Rotate_forwards;
--      Self.Back_left_wheel.Rotate_backwards;
--      Self.Back_right_wheel.Rotate_forwards;
--   end Rotate_anticlockwise; 
   
-- Drives the car leftwards, with no forwards, backwards or rotational movement
--   procedure Sideways_Left (Self : Set_of_wheels) is                          
--   begin                                                                      
--      Self.Front_left_wheel.Rotate_forwards;
--      Self.Front_right_wheel.Rotate_backwards;
--      Self.Back_left_wheel.Rotate_backwards;
--      Self.Back_right_wheel.Rotate_forwards;
--   end Sideways_Left;
   
   
-- Drives the car leftwards, with no forwards, backwards or rotational movement
--   procedure Sideways_Right (Self : Set_of_wheels) is                          
--   begin                                                                      
--      Self.Front_left_wheel.Rotate_backwards;
--      Self.Front_right_wheel.Rotate_forwards;
--      Self.Back_left_wheel.Rotate_forwards;
--      Self.Back_right_wheel.Rotate_backwards;
--   end Sideways_Right;
   
   
--   procedure Lateral_arc_anticlockwise (Self : Set_of_wheels) is              
--   begin
--      Self.Front_left_wheel.Rotate_backwards;
--      Self.Front_right_wheel.Rotate_forwards;
--      Self.Back_left_wheel.Stop;
--      Self.Back_right_wheel.Stop;
--   end Lateral_arc_anticlockwise;
   
   
--   procedure Lateral_arc_clockwise (Self : Set_of_wheels) is                   
--   begin
--      Self.Front_left_wheel.Rotate_forwards;
--      Self.Front_right_wheel.Rotate_backwards;
--      Self.Back_left_wheel.Stop;
--      Self.Back_right_wheel.Stop;
--   end Lateral_arc_clockwise;     
   
end Wheels;
