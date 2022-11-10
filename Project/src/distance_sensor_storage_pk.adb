package body distance_sensor_storage_pk is

   protected body Sensor_flag is
      --To set the value of Flag_value.         
      procedure Set (Value : Boolean) is                                        
      begin
         Flag_value := Value;
      end Set;
      --To return the value of Flag_value.
      function Get return Boolean is                                            
      begin
         return Flag_value;
      end Get;
   end Sensor_flag;

end distance_sensor_storage_pk;
