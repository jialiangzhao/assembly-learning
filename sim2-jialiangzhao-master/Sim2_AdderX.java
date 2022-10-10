//Author: jialiangzhao
//Classroom: csc 252
//Introduction: This is a program that simulates the continuous
//operation of an adder. He will produce carry out, and then 
//carry this carry out into the next operation.

public class Sim2_AdderX {
	public RussWire[] a,b;
	public int number;
	// outputs
	public RussWire[] sum;
	public Sim2_FullAdder value;
	public Sim2_HalfAdder first;
	public RussWire carryOut;
	public RussWire overflow;
	public boolean temp;
	public Sim2_AdderX(int number)
	{
		this.number=number;
		a   = new RussWire[number];
		b   = new RussWire[number];
		sum = new RussWire[number];
		first =new Sim2_HalfAdder();
		for (int i=0; i<number; i++)
		{
			a  [i] = new RussWire();
			b  [i] = new RussWire();
			sum[i] = new RussWire();
		}

		carryOut = new RussWire();
		overflow = new RussWire();
	}
		
//Use for loop and logic operation to realize addition and continuous addition.
	public void execute()
	{	
		
		first.a.set(a[0].get());
		first.b.set(b[0].get());
		first.execute();
		this.sum[0].set(first.sum.get());
		temp=first.carry.get();
		
		for(int i=1;i<number;i++) {
			
			value=new Sim2_FullAdder();
			value.a.set(a[i].get());
			value.b.set(b[i].get());
			
			value.carryIn.set(temp);
			value.execute();
			
			temp=value.carryOut.get();
			this.sum[i].set(value.sum.get());
			
		}
		carryOut=value.carryOut;
		
		boolean answer1=a[number-1].get()&&b[number-1].get();
		boolean answer2=a[number-2].get()&&b[number-2].get();
		boolean xor=(answer1&&!answer2)||(!answer1&&answer2);
		overflow.set(!xor);
			
	}
}
