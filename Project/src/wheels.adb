package body Wheels is

   procedure Drive_forward (Self : Set_of_wheels) is                            -- Procedure that sets the car's set of wheels to drive forwards
   begin
      Self.Front_left_wheel.Rotate_forwards;
      Self.Front_right_wheel.Rotate_forwards;
      Self.Back_left_wheel.Rotate_forwards;
      Self.Back_right_wheel.Rotate_forwards;
   end Drive_forward;     
   
   procedure Rotate_clockwise (Self : Set_of_wheels) is                         -- Rotates car in clockwise direction on the spot
   begin
      Self.Front_left_wheel.Rotate_forwards;
      Self.Front_right_wheel.Rotate_backwards;
      Self.Back_left_wheel.Rotate_forwards;
      Self.Back_right_wheel.Rotate_backwards;
   end Rotate_clockwise;
            
   procedure Brake (Self : Set_of_wheels) is                                    -- Stops all four wheels, causing the car to break
   begin
      Self.Front_left_wheel.Stop;
      Self.Front_right_wheel.Stop;
      Self.Back_left_wheel.Stop;
      Self.Back_right_wheel.Stop;
   end Brake;
          
   
-- The below driving procedures were created but not required for the final 
-- driving logic.    
   
--   procedure Drive_backwards (Self : Set_of_wheels) is                        -- Procedure sets the car's wheel pins so that the car to drives 
--   begin                                                                      -- backwards.
--      Self.Front_left_wheel.Rotate_backwards;
--      Self.Front_right_wheel.Rotate_backwards;
--      Self.Back_left_wheel.Rotate_backwards;
--      Self.Back_right_wheel.Rotate_backwards;  
--   end Drive_backwards;  

   
--   procedure Forward_left (Self : Set_of_wheels) is                           -- Procedure sets car's wheel pins so that it drives forwards  
--   begin                                                                      -- diagonally towards the left.
--      Self.Front_left_wheel.Stop;
--      Self.Front_right_wheel.Rotate_forwards;
--      Self.Back_left_wheel.Rotate_forwards;
--      Self.Back_right_wheel.Stop;
--      null;
--   end Forward_left;
   
   
--   procedure Forward_right (Self : Set_of_wheels) is                          -- Procedure sets car's wheel pins so that it drives forwards  
--   begin                                                                      -- diagonally towards the left.
--      Self.Front_left_wheel.Rotate_forwards;
--      Self.Front_right_wheel.Stop;
--      Self.Back_left_wheel.Stop;
--      Self.Back_right_wheel.Rotate_forwards; 
--   end Forward_right;
      
   
--   procedure Backward_left (Self : Set_of_wheels) is                          -- Procedure sets car's wheel pins so that it drives backwards  
--   begin                                                                      -- diagonally towards the left.
--      Self.Front_left_wheel.Rotate_backwards;
--      Self.Front_right_wheel.Stop;
--      Self.Back_left_wheel.Stop;
--      Self.Back_right_wheel.Rotate_backwards; 
--      null;
--   end Backward_left;
   
   
--   procedure Backward_right (Self : Set_of_wheels) is                         -- Procedure sets car's wheel pins so that it drives backwards  
--   begin                                                                      -- diagonally towards the right.
--      Self.Front_left_wheel.Stop;
--      Self.Front_right_wheel.Rotate_backwards;
--      Self.Back_left_wheel.Rotate_backwards;
--      Self.Back_right_wheel.Stop;
--      null;
--   end Backward_right;
   
--   procedure Turn_left (Self : Set_of_wheels) is                              -- Instructs the car to turn left by setting the two required 
--   begin                                                                      -- pins to rotate forwards and the two remaining to stop.
--      Self.Front_left_wheel.Stop;
--      Self.Front_right_wheel.Rotate_forwards;
--      Self.Back_left_wheel.Stop;
--      Self.Back_right_wheel.Rotate_forwards;
--   end Turn_left;
   
   
--   procedure Turn_right (Self : Set_of_wheels) is                             -- Instructs the car to turn right by setting the two required 
--   begin                                                                      -- pins to rotate forwards and the two remaining to stop.
--      Self.Front_left_wheel.Rotate_forwards;
--      Self.Front_right_wheel.Stop;
--      Self.Back_left_wheel.Rotate_forwards;
--      Self.Back_right_wheel.Stop;
--   end Turn_right;

--   procedure Rotate_anticlockwise (Self : Set_of_wheels) is                   -- Rotates car in anticlockwise direction on the spot
--   begin
--      Self.Front_left_wheel.Rotate_backwards;
--      Self.Front_right_wheel.Rotate_forwards;
--      Self.Back_left_wheel.Rotate_backwards;
--      Self.Back_right_wheel.Rotate_forwards;
--   end Rotate_anticlockwise; 
   
--   procedure Sideways_Left (Self : Set_of_wheels) is                          -- Drives the car leftwards, with no forwards, backwards or  
--   begin                                                                      -- rotational movement
--      Self.Front_left_wheel.Rotate_forwards;
--      Self.Front_right_wheel.Rotate_backwards;
--      Self.Back_left_wheel.Rotate_backwards;
--      Self.Back_right_wheel.Rotate_forwards;
--   end Sideways_Left;
   
   
--   procedure Sideways_Right (Self : Set_of_wheels) is                         -- Drives the car leftwards, with no forwards, backwards or  
--   begin                                                                      -- rotational movement
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
