-- with MicroBit.Console;
with MicroBit.IOsForTasking;
with Ada.Real_Time; use Ada.Real_Time;

package body HC_SR04_pk is
   procedure Echo_Analog_Signal_Output_HC_SR04 is
      Duration_Analog : MicroBit.IOsForTasking.Analog_Value;
      --Distance_cm : Integer := 0;
      Echo_Pin : MicroBit.IOsForTasking.Pin_Id := 1;


   begin
      Duration_Analog := MicroBit.IOsForTasking.Analog(Echo_Pin);
      -- MicroBit.Console.Put(Integer'Image(Integer(Analog_Value)));

      --Distance_cm := (Duration_Analog/2)/29.1;
      
      --return distance_cm;
      
   end Echo_Analog_Signal_Output_HC_SR04;
   
   procedure Trigger_Pulse_Input_HC_SR04 is
     
   Trigger_Pin : MicroBit.IOsForTasking.Pin_Id := 0; 
   begin
      
      MicroBit.IOsForTasking.Set(Trigger_Pin, False);
      delay until Clock + Microseconds(5);
      MicroBit.IOsForTasking.Set(Trigger_Pin, True);
      delay until Clock + Microseconds(20); --20 millisec? eller 10 microsec
      
   end Trigger_Pulse_Input_HC_SR04; 
end HC_SR04_pk;
