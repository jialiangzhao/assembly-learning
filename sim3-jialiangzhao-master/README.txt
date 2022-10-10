Extra1:\
He is for bne. He in controlOut will control the result of beq. That is to say, I added a special condition to the result of checking beq, which is if extra1 is equal to 1. Then the value of beq will be reversed. I have used it in the getNextPc function.\
\
Extra2:\
My extra2 controls andi and ori. Because when I finished writing ori, I found that instructions of the same type were not counted. In & and |, we previously set imm32 to if the top of imm16 is 1, then imm32 will set all the numbers 32-16 to 1. But in & and |, this condition will affect andi and ori judgment. So I chose to directly quote imm16 to calculate.\
\
Extra3:\
My extra3 controls sll. When using sll displacement, I found that he used the number of rt to shift the number of shamt. In other words, in input1 and input2, I need to make changes. So I set the condition of extra3 in getALUinput1-2. Let them get the correct input, and then add the displacement function when executing.}
