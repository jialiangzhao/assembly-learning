//Author: jialiangzhao
//Classroom: csc 252
//Introduction: This is a program that simulates the operation of MUX.
//He can magically use only binary and logical operations 
//to get different positions in the array we want.

public class Sim2_MUX_8by1 {
	public RussWire[] in,control;
	public RussWire out;
	public Sim2_MUX_8by1() {
		in  = new RussWire[8];
		control = new RussWire[3];
		out = new RussWire();
		for (int i=0; i<8; i++)
		{
			in [i] = new RussWire();
		
		}
		for (int i=0; i<3; i++)
		{
			control [i] = new RussWire();
		
		}
	}
	//This is a complex logical operation symbol. Use them to achieve array positioning.
	public void execute()
	{	
		boolean a=control[2].get();
		boolean b=control[1].get();
		boolean c=control[0].get();
		boolean d=in[0].get();
		boolean e=in[1].get();
		boolean f=in[2].get();
		boolean g=in[3].get();
		boolean h=in[4].get();
		boolean i=in[5].get();
		boolean j=in[6].get();
		boolean k=in[7].get();
		boolean p=(!a&&!b&&!c&&d)||(!a&&!b&&c&&e)||
				(!a&&b&&!c&&f)||(!a&&b&&c&&g)||(a&&!b&&!c&&h)
				||(a&&!b&&c&&i)||(a&&b&&!c&&j)||(a&&b&&c&&k);
		out.set(p);
		
			
	}
	
	
}
