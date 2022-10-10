//Author: jialiangzhao
//Classroom: csc 252
//Introduction: This is a program run by a half adder.
//He only counts the first addition, so he has no carryin.

public class Sim2_HalfAdder {
	public RussWire a,b;
	// outputs
	public RussWire sum;
	public RussWire carry;

	// internal components
	public AND and;
	public XOR xor;
	public Sim2_HalfAdder()
	{
		a   = new RussWire();
		b   = new RussWire();

		sum = new RussWire();
		carry= new RussWire();

		and = new AND();
		xor = new XOR();
	}
	//Use the teacher to give the class a simple addition.
	public void execute()
	{
		
			and.a.set(a.get());
			and.b.set(b.get());
				
			and.execute();
			carry.set(and.out.get());
			xor.a.set(a.get());
			xor.b.set(b.get());
			xor.execute();
			sum.set(xor.out.get());
			
			
	}

}
