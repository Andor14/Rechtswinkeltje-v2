package ;

/**
 * ...
 * @author Andor
 */
class PCScreen extends StaticObject
{

	var caseSelected : Bool = false ;
	var timer:Timer ;
	
	public function new(image:String) 
	{
		super(image);
		init();
	}
	
	function init()
	{
		timer = new Timer ();
	}
	
	function setCountdown ()
	{
		timer.setTime(3000);
		
		trace ("time set");
		
		timer.startTimer();
		
	}
	
	function openCase ()
	{
		trace ("New case");
	}
	
	public function update ()
	{
		if (caseSelected == false )
		{
			if (timer.getDone() == true )
			{
				openCase();
				caseSelected = true ;
			}
			else
			{
				timer.update();
			}
		}
		else
		{
			//trace ("true") ;
		}
	}
	
}