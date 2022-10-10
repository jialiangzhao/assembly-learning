/* Implementation of a 32-bit adder in C.
 *
 * Author: TODO
 */


#include "sim1.h"



void execute_add(Sim1Data *obj)
{
		
		int carryOne=0;
		int tempSum=0;
		int one=1;
		int orgB=obj->b;
		int sub=obj->b;
		int c=0;
		if(obj->isSubtraction==1){
			
			
		for(int j=0;j<32;j++) {	
				sub=sub ^ (0x1 << j);
		}
		for(int i=0;i<32;i++) {
					
						if(!((sub >> i) & 0x1==1 && (one >> i) & 0x1==1)) {
							tempSum=(sub >> i) & 0x1 || (one >> i) & 0x1;
							
							if (carryOne==1) {
								if(tempSum==1) {
									//no change for sum
									carryOne=1;
								}else {
									c=c | (0x1 << i);
									carryOne=0;
								}
							}else {
								if(tempSum==1){
									
									c=c| (0x1 << i);}
								
							}
							
						
						}else {
							tempSum=0;
							if (carryOne==1) {
								c=c | (0x1 << i);
								
								
							}else {
								if(tempSum==1){
									c=c | (0x1 << i);}
								
							}
							carryOne=1;
						}
						
						obj->b=c;
						}
			}
		
	 	
		
	 	
		
		
		int i=0;
		int sum=0;
		carryOne=0;
		tempSum=0;
		for(int i=0;i<32;i++) {
			
				if(!((obj->a >> i) & 0x1==1 && (obj->b >> i) & 0x1==1)) {
					tempSum=(obj->a >> i) & 0x1 || (obj->b >> i) & 0x1;
					
					if (carryOne==1) {
						if(tempSum==1) {
							//no change for sum
							carryOne=1;
						}else {
							sum=sum | (0x1 << i);
							carryOne=0;
						}
					}else {
						if(tempSum==1){
							
							sum=sum | (0x1 << i);}
						
					}
					
				
				}else {
					tempSum=0;
					if (carryOne==1) {
						sum=sum | (0x1 << i);
						
						
					}else {
						if(tempSum==1){
							sum=sum | (0x1 << i);}
						
					}
					carryOne=1;
				}
				
				
				}
		obj->b=orgB;
		
		obj->carryOut=carryOne;
		int carryA=0;
		int carryB=0;
			if(((obj->a >> 30) & 0x1==1) && ((obj->b >> 30) & 0x1==1)) {
				carryA=1;
			}
			 if(((obj->a >> 31) & 0x1==1 )&&( (obj->b >> 31) & 0x1==1)) {
				carryB=1;
			}
			if(carryA!=carryB) {
				obj->overflow=1;
			}
			else {
				obj->overflow=0;
			}	
		int x=(obj->a >> 31) & 0x1;
		if(x==0){
			obj->aNonNeg=1;
		}else{
			obj->aNonNeg=0;
		}
		int y=(obj->b >> 31) & 0x1;
		if(y==0){
			obj->bNonNeg=1;
		}else{
			obj->bNonNeg=0;
		}
		int z=(sum >> 31) & 0x1;
		if(z==0){
			obj->sumNonNeg=1;
		}else{
			obj->sumNonNeg=0;
		}
		
		obj->sum=sum;
}