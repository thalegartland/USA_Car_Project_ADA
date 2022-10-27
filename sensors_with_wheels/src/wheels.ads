with Wheel;

package Wheels is
   type Set_of_wheels is private;
   
   procedure Drive_forward (Self : Set_of_wheels);
   procedure Drive_backwards (Self : Set_of_wheels);
   procedure Forward_left (Self : Set_of_wheels);
   procedure Forward_right (Self : Set_of_wheels);
   procedure Backward_left (Self : Set_of_wheels);
   procedure Backward_right (Self : Set_of_wheels);
   procedure Turn_left (Self : Set_of_wheels);
   procedure Turn_right (Self : Set_of_wheels);
   procedure Rotate_anticlockwise (Self : Set_of_wheels);
   procedure Rotate_clockwise (Self : Set_of_wheels);
   procedure sideways_left (Self : Set_of_wheels);
   procedure sideways_right (Self : Set_of_wheels);
   procedure Lateral_arc_anticlockwise (Self : Set_of_wheels);
   procedure Lateral_arc_clockwise (Self : Set_of_wheels);
procedure Brake (Self : Set_of_wheels);

private

   type Set_of_wheels is record
      Front_left_wheel : Wheel.Single_wheel  := (14,13,12);
      Front_right_wheel : Wheel.Single_wheel  := (0,2,3);
      Back_left_wheel : Wheel.Single_wheel  := (15,10,11);
      Back_right_wheel : Wheel.Single_wheel  := (1,6,7);
   end record;

end Wheels;
