package Acc_Storage_pk is

   protected type Acc_Storage_t is
      procedure upright( state : in boolean );
      function get_upright return boolean;
   private
      car_state : boolean := true;
   end Acc_Storage_t;
     
   storage : Acc_Storage_t;
     

end Acc_Storage_pk;
