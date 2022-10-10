

/* Simulates a physical device that performs (signed) subtraction on
 * a 32-bit input.
 *
 * Author: TODO
 */

public class Sim1_SUB
{
	public void execute()
	{
		complement.in=this.b;
		complement.execute();
		p.a=this.a;
		p.b=complement.out;
		p.execute();
		this.sum=p.sum;
	}



	// --------------------
	// Don't change the following standard variables...
	// --------------------

	// inputs
	public RussWire[] a,b;

	// output
	public RussWire[] sum;
	Sim1_ADD p = new Sim1_ADD();
	Sim1_2sComplement complement = new Sim1_2sComplement();
	// --------------------
	// But you should add some *MORE* variables here.
	// --------------------
	// TODO: fill this in



	public Sim1_SUB()
	{
		a   = new RussWire[32];
		b   = new RussWire[32];
		sum = new RussWire[32];

		for (int i=0; i<32; i++)
		{
			a  [i] = new RussWire();
			b  [i] = new RussWire();
			sum[i] = new RussWire();
		}
	}
}
