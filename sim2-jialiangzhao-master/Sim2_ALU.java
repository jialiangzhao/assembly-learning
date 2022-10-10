
//Author: jialiangzhao
//Classroom: csc 252
//Introduction: This is a program that simulates ALU operation.
//In this class so that it can handle inputs with any number of bits (not just 32).
//He will produce different results according to our different aluop.
public class Sim2_ALU {
	public RussWire[] a,b,result;
	public RussWire[] aluOp;
	public RussWire bNegate;
	public Sim2_ALUElement[] element;
	int x;
	boolean temp;
	public RussWire[] addAnswer;
	public Sim2_ALU(int x) {
		
		this.x=x;
		 addAnswer=new RussWire[x];
		a=new RussWire[x];
		addAnswer=new RussWire[x];
		b=new RussWire[x];
		result=new RussWire[x];
		 element=new Sim2_ALUElement[x];
		for(int i=0;i<x;i++) {
			a[i]=new RussWire();
			b[i]=new RussWire();
			result[i]=new RussWire();
			addAnswer[i]=new RussWire();
			element[i]=new Sim2_ALUElement();
		}
		
		aluOp=new RussWire[3];
		for (int i=0; i<3; i++)
		{
			aluOp [i] = new RussWire();
		
		}
		
		 bNegate=new RussWire();
		 
		
	}
	
	//This execution is executed first except for the last bit, after getting less data.
	//Put him on the far left, and fill the rest of false with false. Finally get the result.
	public void execute() {
		temp=bNegate.get();
		for(int i=0;i<x;i++){
			element[i].aluOp[0].set(aluOp[0].get());
			element[i].aluOp[1].set(aluOp[1].get());
			element[i].aluOp[2].set(aluOp[2].get());
			element[i].bInvert.set(bNegate.get());
			element[i].carryIn.set(temp);
			element[i].a.set(a[i].get());
			element[i].b.set(b[i].get());
			element[i].execute_pass1();
			temp=element[i].carryOut.get();
			addAnswer[i].set(element[i].addResult.get());
			

		}
		element[0].less.set(addAnswer[x-1].get());
		element[0].execute_pass2();
		result[0].set(element[0].result.get());
		for(int i=1;i<x;i++){
			element[i].less.set(false);
			element[i].execute_pass2();
			result[i].set(element[i].result.get());
		}
		
	}
	
	
	
}
