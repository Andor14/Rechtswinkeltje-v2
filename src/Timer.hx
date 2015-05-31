package ;

/**
 * ...
 * @author Andor
 */
class Timer
{

	var startTime:Int = 0;
	var timeLeft:Int = 0 ;
	var timeUp:Bool = false ;
	
	
	public function new() 
	{
		
	}
	
	public function setTime(input:Int)
	{
		timeUp = false ;
		startTime = input;
	}
	
	public function startTimer()
	{
		timeLeft = startTime ;
	}
	
	public function getTimeLeft():Int
	{
		return timeLeft;
	}
	
	public function update()
	{
		if (timeLeft == 0)
		{
			done();
		}
		else
		{
			timeLeft = (timeLeft - 1) ;
		}
	}
	
	function done()
	{
		timeUp = true ;
	}
	
	public function getDone():Bool
	{
		return timeUp;
	}
}