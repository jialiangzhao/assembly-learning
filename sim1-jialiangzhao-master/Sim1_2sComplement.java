
/* Simulates a physical device that performs 2's complement on a 32-bit input.
*
* Author: TODO
*/

public class Sim1_2sComplement
{
	public void execute()
	{
		for(int i=0;i<32;i++) {
			
			not[i].in.set(this.in[i].get());
			not[i].execute();
			p.a[i].set(not[i].out.get());
			
		}
		p.execute();
		this.out=p.sum;
		// TODO: fill this in!
		//
		// REMEMBER: You may call execute() on sub-objects here, and
		//           copy values around - but you MUST NOT create
		//           objects while inside this function.
	}



	// you shouldn't change these standard variables...
	public RussWire[] in;
	public RussWire[] out;
	
	Sim1_NOT[] not = new Sim1_NOT[32];
	public RussWire[] addOne;
	Sim1_ADD p = new Sim1_ADD();
	
	
	// TODO: add some more variables here.  You must create them
	//       during the constructor below.  REMEMBER: You're not
	//       allowed to create any object inside the execute()
	//       method above!


	public Sim1_2sComplement()
	{
		
		p.b[0].set(true);
		p.b[ 1].set(false);
		p.b[ 2].set(false);
		p.b[ 3].set(false);
		p.b[ 4].set(false);
		p.b[ 5].set(false);
		p.b[ 6].set(false);
		p.b[ 7].set(false);
		p.b[ 8].set(false);
		p.b[ 9].set(false);
		p.b[10].set(false);
		p.b[11].set(false);
		p.b[12].set(false);
		p.b[13].set(false);
		p.b[14].set(false);
		p.b[15].set(false);
		p.b[16].set(false);
		p.b[17].set(false);
		p.b[18].set(false);
		p.b[19].set(false);
		p.b[20].set(false);
		p.b[21].set(false);
		p.b[22].set(false);
		p.b[23].set(false);
		p.b[24].set(false);
		p.b[25].set(false);
		p.b[26].set(false);
		p.b[27].set(false);
		p.b[28].set(false);
		p.b[29].set(false);
		p.b[30].set(false);
		p.b[31].set(false);
		in  = new RussWire[32];
	
		for (int i=0; i<32; i++)
		{
			in[i] = new RussWire();
			
			not[i] = new Sim1_NOT() ;
		}
		
	}
}
