package body Wheels is

   procedure Drive_forward (Self : Set_of_wheels) is
   begin
      Self.Front_left_wheel.Rotate_forwards;
      Self.Front_right_wheel.Rotate_forwards;
      Self.Back_left_wheel.Rotate_forwards;
      Self.Back_right_wheel.Rotate_forwards;
   end Drive_forward;     
            
            
   procedure Drive_backwards (Self : Set_of_wheels) is 
   begin
      Self.Front_left_wheel.Rotate_backwards;
      Self.Front_right_wheel.Rotate_backwards;
      Self.Back_left_wheel.Rotate_backwards;
      Self.Back_right_wheel.Rotate_backwards;  
   end Drive_backwards;  

   
   procedure Forward_left (Self : Set_of_wheels) is 
   begin
      Self.Front_left_wheel.Stop;
      Self.Front_right_wheel.Rotate_forwards;
      Self.Back_left_wheel.Rotate_forwards;
      Self.Back_right_wheel.Stop;
      null;
   end Forward_left;
   
   
   procedure Forward_right (Self : Set_of_wheels) is
   begin
      Self.Front_left_wheel.Rotate_forwards;
      Self.Front_right_wheel.Stop;
      Self.Back_left_wheel.Stop;
      Self.Back_right_wheel.Rotate_forwards; 
   end Forward_right;
      
   
   procedure Backward_left (Self : Set_of_wheels) is 
   begin
      Self.Front_left_wheel.Rotate_backwards;
      Self.Front_right_wheel.Stop;
      Self.Back_left_wheel.Stop;
      Self.Back_right_wheel.Rotate_backwards; 
      null;
   end Backward_left;
   
   
   procedure Backward_right (Self : Set_of_wheels) is 
   begin
      Self.Front_left_wheel.Stop;
      Self.Front_right_wheel.Rotate_backwards;
      Self.Back_left_wheel.Rotate_backwards;
      Self.Back_right_wheel.Stop;
      null;
   end Backward_right;
   
   --Turn_left and Turn_right can be adjusted to have stopped wheels drive but at slower speed for better turning.
   procedure Turn_left (Self : Set_of_wheels) is 
   begin
      Self.Front_left_wheel.Stop;
      Self.Front_right_wheel.Rotate_forwards;
      Self.Back_left_wheel.Stop;
      Self.Back_right_wheel.Rotate_forwards;
   end Turn_left;
   
   
   procedure Turn_right (Self : Set_of_wheels) is
   begin
      Self.Front_left_wheel.Rotate_forwards;
      Self.Front_right_wheel.Stop;
      Self.Back_left_wheel.Rotate_forwards;
      Self.Back_right_wheel.Stop;
   end Turn_right;

   procedure Rotate_anticlockwise (Self : Set_of_wheels) is -- Rotates car in anticlockwise direction on the spot
   begin
      Self.Front_left_wheel.Rotate_backwards;
      Self.Front_right_wheel.Rotate_forwards;
      Self.Back_left_wheel.Rotate_backwards;
      Self.Back_right_wheel.Rotate_forwards;
   end Rotate_anticlockwise;
   
   procedure Rotate_clockwise (Self : Set_of_wheels) is -- Rotates car in clockwise direction on the spot
   begin
      Self.Front_left_wheel.Rotate_forwards;
      Self.Front_right_wheel.Rotate_backwards;
      Self.Back_left_wheel.Rotate_forwards;
      Self.Back_right_wheel.Rotate_backwards;
   end Rotate_clockwise;
   
   
   procedure sideways_left (Self : Set_of_wheels) is
   begin
      Self.Front_left_wheel.Rotate_backwards;
      Self.Front_right_wheel.Rotate_forwards;
      Self.Back_left_wheel.Rotate_forwards;
      Self.Back_right_wheel.Rotate_backwards;
   end sideways_left;
   
   
   procedure sideways_right (Self : Set_of_wheels) is
   begin  
      Self.Front_left_wheel.Rotate_forwards;
      Self.Front_right_wheel.Rotate_backwards;
      Self.Back_left_wheel.Rotate_backwards;
      Self.Back_right_wheel.Rotate_forwards;
   end sideways_right;
   
   
   procedure Lateral_arc_anticlockwise (Self : Set_of_wheels) is
   begin
      Self.Front_left_wheel.Rotate_backwards;
      Self.Front_right_wheel.Rotate_forwards;
      Self.Back_left_wheel.Stop;
      Self.Back_right_wheel.Stop;
   end Lateral_arc_anticlockwise;
   
   
   procedure Lateral_arc_clockwise (Self : Set_of_wheels) is
   begin
      Self.Front_left_wheel.Rotate_forwards;
      Self.Front_right_wheel.Rotate_backwards;
      Self.Back_left_wheel.Stop;
      Self.Back_right_wheel.Stop;
   end Lateral_arc_clockwise;
   
   
   procedure Brake (Self : Set_of_wheels) is
   begin
      Self.Front_left_wheel.Stop;
      Self.Front_right_wheel.Stop;
      Self.Back_left_wheel.Stop;
      Self.Back_right_wheel.Stop;
   end Brake;
      
   
end Wheels;
