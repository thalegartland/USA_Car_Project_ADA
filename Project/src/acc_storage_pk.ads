--Acc_Storage_pk is a package that include a protected object. 

package Acc_Storage_pk is

   -- This protected object stores the state to the accelerometer.
   protected type Acc_Storage_t is
      
      -- The upright procedure sets the state of the car.
      -- If the accelerometer is overturned, then the upright function is set false and the car_State is set false.
       procedure upright( state : in boolean );                                 
                                       
      -- The get_upright function returns the state of the car.
      -- If the function returns a true variable it means that the car is uprigth. 
      -- If the funciton returns a false variable it means that the car has overturned.
      function get_upright return boolean;   
      
   private                      
      car_state : boolean := true;
   end Acc_Storage_t;
     
   storage : Acc_Storage_t;
end Acc_Storage_pk;
