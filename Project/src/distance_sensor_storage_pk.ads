package distance_sensor_storage_pk is
      --Declares protected object which indicate if the car is too close to an object.
      protected Sensor_flag is                                                                                                                         --encapsulates the flag value used to
      procedure Set (Value : Boolean);                                        
      function Get return Boolean;                                            
   private
      Flag_value : Boolean := False;
   end Sensor_flag;

end distance_sensor_storage_pk;
