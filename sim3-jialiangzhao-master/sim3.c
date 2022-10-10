// name:jialiangzhao
// class:csc252
// comment:Currently these are two codes of 
//information obtained through a string of 32-
//bit numbers. The first function is to extract 
//the corresponding information from the 32-bit 
//number, such as opcode, rt, rs, etc. The second
// is to find the corresponding variable.
//through opcode and funct.Now, I have completed the
// other parts of the cpu. Such as alu, pc, memory.
#include <stdio.h>
#include "sim3.h"
//This is the code to extract key information from the 
//instruction. He can get the specified number of digits 
//through >>. You can use & to get the length you want.
        void extract_instructionFields(WORD instruction, InstructionFields *fieldsOut){
fieldsOut->rs=(instruction    >> 21) &    0x1f;
fieldsOut->opcode=(instruction    >> 26) &    0x3f;
fieldsOut->rt=(instruction    >> 16) &    0x1f;
fieldsOut->rd=(instruction    >> 11) &    0x1f;
fieldsOut->shamt=(instruction    >> 6) &    0x1f;
fieldsOut->funct=(instruction    >> 0) &    0x3f;
fieldsOut->imm16=(instruction    >> 0) &    0x0ffff;
fieldsOut->imm32=(fieldsOut->imm16  <<16 ) >>16;
fieldsOut->address=(instruction    >> 0) &    0x3ffffff;


}
//This I wrote is more complicated, I don't know 
//if there is a better way. I use opcode combined with 
//corresponding tables to determine whether they are addi 
//or lw. Then according to the corresponding relationship 
//submitted by the teacher. To summarize the regdet,
//memread, opcode, etc. corresponding to each one.
int  fill_CPUControl(InstructionFields *fields, CPUControl *controlOut){
controlOut->ALUsrc=0;
controlOut->ALU.op=2;
controlOut->ALU.bNegate=0;
controlOut->memRead=0;
controlOut->memWrite=0;
controlOut->memToReg=0;
controlOut->regDst=0;
controlOut->regWrite=0;
controlOut->branch=0;
controlOut->jump=0;
if(fields->opcode==0x0){
if(fields->funct!=0&&fields->funct!=33&&fields->funct!=34&&
fields->funct!=35&&fields->funct!=36
&&fields->funct!=32&&fields->funct!=37&&fields->funct!=38
&&fields->funct!=42){
                controlOut->ALU.op=0;
                controlOut->regDst=0;
                controlOut->regWrite=0;
                return 0;
        }
controlOut->regDst=1;
controlOut->regWrite=1;
if(fields->funct==32){
controlOut->ALU.op=2;
controlOut->ALU.bNegate=0;}
if(fields->funct==0)
{controlOut->extra3=1;
}
if(fields->funct==34 ||fields->funct==35)
{
        controlOut->ALU.bNegate=1;}
        if(fields->funct==36)
{controlOut->ALU.op=0;
}
       if(fields->funct==37)
{controlOut->ALU.op=1;
       }
       if(fields->funct==38)
{controlOut->ALU.op=4;
}
if(fields->funct==42)
{controlOut->ALU.op=3;
       controlOut->ALU.bNegate=1;}
return 1;}
if(fields->opcode==8||fields->opcode==9){
controlOut->ALUsrc=1;
controlOut->regWrite=1;
return 1;}
if(fields->opcode==0x0a){
controlOut->ALUsrc=1;
controlOut->ALU.op=3;
controlOut->ALU.bNegate=1;
controlOut->regWrite=1;
return 1;}
if(fields->opcode==0x0c){
controlOut->ALUsrc=1;
controlOut->ALU.op=0;
controlOut->regWrite=1;
controlOut->extra2=1;
return 1;}
if(fields->opcode==0x0d){
controlOut->ALUsrc=1;
controlOut->ALU.op=1;
controlOut->regWrite=1;
controlOut->extra2=1;
return 1;}
if(fields->opcode==0x23){
controlOut->ALUsrc=1;
controlOut->memToReg=1;
controlOut->regWrite=1;
controlOut->memRead=1;
return 1;}
if(fields->opcode==0x2b){
controlOut->ALUsrc=1;
controlOut->memWrite=1;
return 1;}
if(fields->opcode==0x04){
controlOut->ALU.bNegate=1;
controlOut->branch=1;
return 1;}
if(fields->opcode==0x05){
controlOut->extra1=1;
controlOut->ALU.bNegate=1;
controlOut->branch=1;
return 1;}
if(fields->opcode==0x02){
controlOut->ALU.op=0;
controlOut->jump=1;
return 1;}
controlOut->ALU.op=0;
return 0;
}
//This is to get the instruction when executing
// the order. In fact, we saved the instruction
// in the memoery. Then if we take it out, we need
// to divide pc by 4. Get the correct position.
WORD getInstruction(WORD curPC, WORD *instructionMemory){
       int a =curPC/4;
               return instructionMemory[a];
}
//This is the function to get input1.
// In no special circumstances, 
//he went directly to rs. Because of the most
// basic instructions, only operations that apply to rs.
WORD getALUinput1(CPUControl *controlIn,
                 InstructionFields *fieldsIn,
                 WORD rsVal, WORD rtVal, WORD reg32, WORD reg33,
                 WORD oldPC){
	if(controlIn->extra3==1){
		return rtVal;
	}
       return rsVal;

}

//This is the function to get input2. 
//The normal situation is to take rt, 
//in the second case is a number, he will
// directly take imm32. If it is an extra situation,
// he will select the value according to the specific situation.
WORD getALUinput2(CPUControl *controlIn,
                 InstructionFields *fieldsIn,
                 WORD rsVal, WORD rtVal, WORD reg32, WORD reg33,
                 WORD oldPC){
	 if (controlIn->extra2==1){
	               return fieldsIn->imm16;
	       }
	 if (controlIn->extra3==1){
		               return fieldsIn->shamt;
		       }
       if (controlIn->ALUsrc==1){
               return fieldsIn->imm32;
       }else{
    	   return rtVal;
    	           }
    	   }

//This is the function to get the cpu output.
// He will perform calculations with more control. 
//For example, if bnegate is 1, then he will directly 
//change input2 into a negative number. Others are 
//also performing some simple addition and subtraction 
//operations. He simplified the operation mode of the 
//cpu, the normal operation mode of the cpu only has and, or, add, zero.
    	   void execute_ALU(CPUControl *controlIn,
    	                    WORD input1, WORD input2,
    	                    ALUResult  *aluResultOut){
    		   if(controlIn->extra3==1){
    			   aluResultOut->result=input1<<input2;
    		       	        return;   }
    	           if(controlIn->ALU.bNegate==1){
    	                   input2=-input2;
    	           }
    	           if (controlIn->ALU.op==0){
    	                    aluResultOut->result=input1&input2;
    	           }
    	           else if(controlIn->ALU.op==1){
    	                   aluResultOut->result=input1|input2;
    	           }
    	           else if(controlIn->ALU.op==2){
    	                           aluResultOut->result=input1+input2;
    	                   }
    	           else if(controlIn->ALU.op==3){
    	                                   if(input1+input2<0){
    	                                   aluResultOut->result=1;}
    	                   else{
    	                           aluResultOut->result=0;
    	                   }
    	                           }
    	           else{
    	                   aluResultOut->result=input1^input2;
    	           }
    	           
    	           if (aluResultOut->result==0){
    	                   aluResultOut->zero =1;
    	           }
    	          
    	   }
//This is the function to get memory.
// He decides different situations according to 
//different controls. Some are the result of getting
// alu, and some are changing the result of alu. It is 
//the difference between lw and sw.
    	   void execute_MEM(CPUControl *controlIn,
    	                    ALUResult  *aluResultIn,
    	                    WORD        rsVal, WORD rtVal,
    	                    WORD       *memory,
    	                    MemResult  *resultOut){
    	           resultOut->readVal=0;
    	           if(controlIn->memRead==1){
    	                   resultOut->readVal=memory[(aluResultIn->result)/4];
    	           }
    	           if(controlIn->memWrite==1){
    	                   memory[(aluResultIn->result)/4]=rtVal;
    	           }
    	   }

//This is the function to get pc. Normally, 
//he will only +4. If there are beq, bne, jump, 
//he will have a big change. For example, jump 
//will make the pc jump to the specified position.
    	   WORD getNextPC(InstructionFields *fields, CPUControl *controlIn, int aluZero,
    	                  WORD rsVal, WORD rtVal,
    	                  WORD oldPC){
    		   if(aluZero==0&&controlIn->extra1==1){
    		       	   return oldPC+((fields->funct+1)*4);}
    	            if(aluZero==1&&controlIn->branch==1){
    	   return oldPC+((fields->funct+1)*4);}
    	           if(controlIn->jump==1){
    	           int a= oldPC;
    	           a=(a>>28)<<28;

    	   return a|(fields->address<<2);}
    	           return oldPC+4;
    	   }

//This is a back write function. He will
// re-store the final answer to the registration,
// and he will adjust the value according to different situations.
    	   void execute_updateRegs(InstructionFields *fields, CPUControl *controlIn,
    	                           ALUResult  *aluResultIn, MemResult *memResultIn,
    	                           WORD       *regs){
    	           int a=fields->rd;
    	           if(controlIn->ALUsrc==1){
    	                   a=fields->rt;

    	           }

    	           if (controlIn->regWrite==1){
    	                           regs[a]=aluResultIn->result;
    	                   }
    	            if(controlIn->memToReg==1){
    	                           regs[a]=memResultIn->readVal;
    	                   }
    	           }