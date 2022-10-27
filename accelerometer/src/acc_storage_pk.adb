package body Acc_Storage_pk is

    protected body Acc_Storage_t is
      procedure upright( state : in boolean ) is
      begin
         car_state := state;
      end upright;
      
      function get_upright return boolean is
      begin
         return car_state;
      end get_upright;

   end Acc_Storage_t;
     

end Acc_Storage_pk;

