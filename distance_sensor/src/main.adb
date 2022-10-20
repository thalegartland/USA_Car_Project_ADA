with MicroBit.IOsForTasking;
with HC_SR04_pk;
with Ada.Text_IO;

procedure Main is
   --C : Integer;
begin

   loop
      HC_SR04_pk.Trigger_Pulse_Input_HC_SR04;
      HC_SR04_pk.Echo_Analog_Signal_Output_HC_SR04;
      --Ada.Text_IO.Put_Line(Integer'Image(C));
   end loop;

end Main;
