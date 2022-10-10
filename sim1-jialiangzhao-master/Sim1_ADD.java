

/* Simulates a physical device that performs (signed) addition on
 * a 32-bit input.
 *
 * Author: TODO
 */

public class Sim1_ADD
{
	public void execute()
	{	boolean carryOne=false;
		boolean tempSum=false;
		
		for(int i=0;i<32;i++) {
		
			if(!(a[i].get()==true && b[i].get()==true)) {
				tempSum=a[i].get() || b[i].get();
				
				if (carryOne==true) {
					if(tempSum==true) {
						sum[i].set(false);
						
						carryOne=true;
					}else {
						sum[i].set(true);
						carryOne=false;
					}
				}else {
					sum[i].set(tempSum);
				}
				
			
			}else {
				tempSum=false;
				if (carryOne==true) {
					sum[i].set(true);
					
					
				}else {
					sum[i].set(tempSum);
				}
				carryOne=true;
			}
			
			
			}
		
		carryOut.set(carryOne);
		boolean carryA=false;
		boolean carryB=false;
		if(a[30].get()==true && b[30].get()==true) {
			carryA=true;
		}
		if(a[31].get()==true && b[31].get()==true) {
			carryB=true;
		}
		if(carryA!=carryB) {
			overflow.set(true);
		}
		// TODO: fill this in!
	}



	// ------ 
	// It should not be necessary to change anything below this line,
	// although I'm not making a formal requirement that you cannot.
	// ------ 

	// inputs
	public RussWire[] a,b;

	// outputs
	public RussWire[] sum;
	public RussWire   carryOut, overflow;

	public Sim1_ADD()
	{
		/* Instructor's Note:
		 *
		 * In Java, to allocate an array of objects, you need two
		 * steps: you first allocate the array (which is full of null
		 * references), and then a loop which allocates a whole bunch
		 * of individual objects (one at a time), and stores those
		 * objects into the slots of the array.
		 */

		a   = new RussWire[32];
		b   = new RussWire[32];
		sum = new RussWire[32];

		for (int i=0; i<32; i++)
		{
			a  [i] = new RussWire();
			b  [i] = new RussWire();
			sum[i] = new RussWire();
		}

		carryOut = new RussWire();
		overflow = new RussWire();
	}
}
