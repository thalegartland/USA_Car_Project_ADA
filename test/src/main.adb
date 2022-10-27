------------------------------------------------------------------------------
--                                                                          --
--                       Copyright (C) 2018, AdaCore                        --
--                                                                          --
--  Redistribution and use in source and binary forms, with or without      --
--  modification, are permitted provided that the following conditions are  --
--  met:                                                                    --
--     1. Redistributions of source code must retain the above copyright    --
--        notice, this list of conditions and the following disclaimer.     --
--     2. Redistributions in binary form must reproduce the above copyright --
--        notice, this list of conditions and the following disclaimer in   --
--        the documentation and/or other materials provided with the        --
--        distribution.                                                     --
--     3. Neither the name of the copyright holder nor the names of its     --
--        contributors may be used to endorse or promote products derived   --
--        from this software without specific prior written permission.     --
--                                                                          --
--   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS    --
--   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT      --
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR  --
--   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT   --
--   HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, --
--   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT       --
--   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,  --
--   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY  --
--   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT    --
--   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE  --
--   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.   --
--                                                                          --
------------------------------------------------------------------------------



with MicroBit.IOsForTasking;

with Ada.Real_Time; use Ada.Real_Time;



--The classical blinking demo demonstrating switching pin 0 high and low in .5 sec interval

procedure Main is



   left_back_back_pin : MicroBit.IOsForTasking.Pin_Id:= 13;

   left_back_forward_pin : MicroBit.IOsForTasking.Pin_Id:= 12;

   left_front_back_pin : MicroBit.IOsForTasking.Pin_Id:= 15;

   left_front_forward_pin : MicroBit.IOsForTasking.Pin_Id:= 14;

   right_front_back_pin : MicroBit.IOsForTasking.Pin_Id:= 3;

   right_front_forward_pin : MicroBit.IOsForTasking.Pin_Id:= 2;

   right_back_back_pin : MicroBit.IOsForTasking.Pin_Id:= 7;

   right_back_forward_pin : MicroBit.IOsForTasking.Pin_Id:= 6;

   pwmpin_l : MicroBit.IOsForTasking.Pin_Id:= 0;

   pwmpin_r : MicroBit.IOsForTasking.Pin_Id:= 1;



begin

  loop

      --  Turn on the LED connected to pin 0

      MicroBit.IOsForTasking.Set (right_back_forward_pin, True);
      MicroBit.IOsForTasking.Set (right_front_forward_pin, True);
      MicroBit.IOsForTasking.Set (left_front_forward_pin, True);
      MicroBit.IOsForTasking.Set (left_back_forward_pin, True);

      MicroBit.IOsForTasking.Set (pwmpin_l, True);

      MicroBit.IOsForTasking.Set (pwmpin_r, True);

      delay until clock + Milliseconds(2000);
      MicroBit.IOsForTasking.Set (right_back_forward_pin, false);
      MicroBit.IOsForTasking.Set (right_front_forward_pin, false);
      MicroBit.IOsForTasking.Set (right_back_back_pin, True);
      MicroBit.IOsForTasking.Set (right_front_back_pin, True);

      delay until clock + Milliseconds(2000);

      MicroBit.IOsForTasking.Set (left_front_forward_pin, false);
      MicroBit.IOsForTasking.Set (left_back_forward_pin, false);
      MicroBit.IOsForTasking.Set (left_front_back_pin, true);
      MicroBit.IOsForTasking.Set (left_back_back_pin, true);

      delay until clock + Milliseconds(2000);

      MicroBit.IOsForTasking.Set (right_back_back_pin, false);
      MicroBit.IOsForTasking.Set (right_front_back_pin, false);

      MicroBit.IOsForTasking.Set (left_front_back_pin, false);
      MicroBit.IOsForTasking.Set (left_back_back_pin, false);

      end loop;


end Main;
