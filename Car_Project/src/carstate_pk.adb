package body CarState_pk is

   protected type ProtectedCarState is 
      procedure Set(CarState:in CarState_t);
      function Get return CarState_t;
   private:
      PCarState : CarState_t := stop;
   end ProtectedCarState;
   
   
   protected body ProtectedCarState is 
      procedure Set(CarState:in CarState_t) is 
      begin 
         PCarState := CarState;
      end Set;
      function Get return CarState_t is 
      begin
         return PCarState;
      end Get;
   end ProtectedCarState;
   
   
   CarStateBuffer :ProtectedCarState;
   
   
   procedure SetCarState(CarState:in CarState_t) is
   begin
      CarStateBuffer.Set(CarState);
   end SetCarState;
   
   
   function GetCarState return CarState_t is 
   begin
      return CarStateBuffer.Get;
   end GetCarState;

end CarState_pk;
