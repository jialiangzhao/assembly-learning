//Author: jialiangzhao
//Classroom: csc 252
//Introduction: This is a program that simulates a single 
//addition run with carry. When he has carryin, 
//he will perform an addition to produce the carryout and result.

public class Sim2_FullAdder {
	public RussWire a,b;
	// outputs
	public RussWire sum;
	public RussWire carryOut;
	public RussWire carryIn;
	// internal components
	public boolean temp;
	public Sim2_FullAdder()
	{
		a   = new RussWire();
		b   = new RussWire();

		sum = new RussWire();
		carryOut= new RussWire();
		carryIn= new RussWire();

		
	}
// Only use logical operations to calculate the answer. It looks complicated to use.
	public void execute()
	{
		temp=(a.get()&&!b.get())||(!a.get()&&b.get());
		sum.set((temp&&(!carryIn.get()))||((!temp)&&carryIn.get()));
		carryOut.set(((!(a.get())&&b.get()&&carryIn.get())||(a.get()&&!
			(b.get())&&carryIn.get())||(a.get()&&b.get()&&(!carryIn.get())))
				||(a.get()&&b.get()&&carryIn.get()));
		
			
			
	}
}
