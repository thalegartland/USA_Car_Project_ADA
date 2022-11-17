-- This package contains the implementation of the ultrasonic sensor. 
-- It defines the functions to set the trigger pin and read the echo 
-- pin and then loops them in a task. 

package distance_sensor_storage_pk is
      --Declares protected object which indicate if the car is too close to an object.
   protected Sensor_flag is
      procedure Set (Value : Boolean);                                        
      function Get return Boolean;       
      
   private
      Flag_value : Boolean := False;
   end Sensor_flag;
end distance_sensor_storage_pk;
