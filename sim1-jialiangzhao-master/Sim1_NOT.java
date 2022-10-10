

/* Simulates a physical NOT gate.
*
* Author: TODO
*/

public class Sim1_NOT
{
	public void execute()
	{
		if(in.get()==false) {
			out.set(true);
		}else {
			out.set(false);
		}
	}



	public RussWire in;    // input
	public RussWire out;   // output

	public Sim1_NOT()
	{
		in   = new RussWire();

		out = new RussWire();
	}
}
