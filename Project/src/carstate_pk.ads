package CarState_pk is

   type CarState_t is (stop,drive);
   
   procedure SetCarState(CarState:in CarState_t);
   function GetCarState return CarState_t;

end CarState_pk;
