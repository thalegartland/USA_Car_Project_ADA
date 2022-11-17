--This package body includes the decleration to the protected object Acc_Storage_t. 
--The protected object Acc_Storage_t is between the task accelerometerTask and control_program task.

package body Acc_Storage_pk isS
   protected body Acc_Storage_t is  
      
      -- The procedure upright set the car_state varibale to state. 
      procedure upright( state : in boolean ) is
      begin
         -- The private variable car_state gets the state value from the procedure.
         car_state := state;                                                    
      end upright;
      
      -- The function get_upright returns the boolean value to car_state. 
      function get_upright return boolean is                                    
      begin
         return car_state;
      end get_upright;

   end Acc_Storage_t;
end Acc_Storage_pk;

