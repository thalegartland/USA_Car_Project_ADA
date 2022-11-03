package Acc_Storage_pk is

   -- This protected object storage the state to the accelerometer. 
   -- If the accelerometer is overturned, then the upright function is set false and the car_State is set false
   protected type Acc_Storage_t is
      procedure upright( state : in boolean );
      function get_upright return boolean;
   private
      car_state : boolean := true;
   end Acc_Storage_t;
     
   storage : Acc_Storage_t;
     

end Acc_Storage_pk;
