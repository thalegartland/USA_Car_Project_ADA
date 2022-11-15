--This package body includes the decleration to the protected object Acc_Storage_t. 
--The protected object Acc_Storage_t is between the task accelerometerTask and control_program task.
package body Acc_Storage_pk is

   protected body Acc_Storage_t is                                              -- The procedure upright set the car_state varibale to state. 
      procedure upright( state : in boolean ) is
      begin
         car_state := state;                                                    -- Here the private variable car_state get the value state from the procedure.
      end upright;
      function get_upright return boolean is                                    -- The function get_upright returns the boolean value to car_state. 
      begin
         return car_state;
      end get_upright;

   end Acc_Storage_t;

end Acc_Storage_pk;

