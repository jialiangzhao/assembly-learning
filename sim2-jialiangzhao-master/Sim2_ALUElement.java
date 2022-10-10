//Author: jialiangzhao
//Classroom: csc 252
//Introduction: This is a program that simulates the operation of ALU one bit. 
//His functions are very complete. and, or.xor.add,less. At the same time he 
//also has two different execute. Responsible for different output.

public class Sim2_ALUElement {
	public RussWire[] aluOp;
	public RussWire carryIn;
	public RussWire a,b;
	public RussWire bInvert;
	public RussWire less;
	public RussWire result;
	public RussWire addResult;
	public RussWire carryOut;
	public XOR forLess;
	public XOR xor;
	public Sim2_FullAdder add;
	public Sim2_MUX_8by1 mux;
	boolean temp;
	
public Sim2_ALUElement() {
	 add=new Sim2_FullAdder();
	 mux=new Sim2_MUX_8by1();
	xor=new XOR();
	forLess=new XOR();
	
	aluOp=new RussWire[3];
	carryIn=new RussWire();
	a=new RussWire();
	b=new RussWire();
	bInvert=new RussWire();
	less=new RussWire();
	result=new RussWire();
	addResult=new RussWire();
	carryOut=new RussWire();
	
	for (int i=0; i<3; i++)
	{
		aluOp [i] = new RussWire();
	
	}
	
}
//The first execution only got the answer of addition and carryout.
public void execute_pass1() {
	
	forLess.a.set(b.get());
	forLess.b.set(bInvert.get());
	forLess.execute();
	temp=forLess.out.get();
	
	
	
	add.a.set(a.get());
	add.b.set(temp);
	add.carryIn.set(carryIn.get());
	add.execute();
	carryOut.set(add.carryOut.get());
	addResult.set(add.sum.get());
	
}
//The second execution assigns different data to 
//different mux, and finally can get different answers from mux.	
public void execute_pass2() {
	boolean resultAnd=a.get()&temp;
	boolean resultOr=a.get()|temp;
	xor.a.set(a.get());
	xor.b.set(temp);
	xor.execute();
	boolean resultXor=xor.out.get();
	mux.in[0].set(resultAnd);
	mux.in[1].set(resultOr);
	mux.in[2].set(addResult.get());
	
	mux.in[3].set(less.get());
	mux.in[4].set(resultXor);
	mux.in[5].set(false);
	mux.in[6].set(false);
	mux.in[7].set(false);
	mux.control[0].set( aluOp[0].get());
	mux.control[1].set( aluOp[1].get());
	mux.control[2].set( aluOp[2].get());
	mux.execute();
	result.set(mux.out.get());
	
	
}


}
