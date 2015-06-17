package ;

/**
 * ...
 * @author Andor
 */
class PCScreen extends StaticObject
{
	var game:GameMain ;
	var main:Main ;
	var popup:StaticObject ;
	var caseSelected : Bool = false ;
	var currentCase : Int ;
	var timer:Timer ;
	
	public function new(image:String,gameMain:GameMain,main:Main) 
	{
		super(image);
		this.game = gameMain ;
		this.main = main ;
		init();
		setCountdown();
	}
	
	function init()
	{
		timer = new Timer ();
	}
	
	function setCountdown ()
	{
		timer.setTime(100);
		
		trace ("time set");
		
		timer.startTimer();
		
	}
	
	function openCase ()
	{
		trace ("New case");
		selectCase();
		main.sound.playSound("incoming");
		
		popup = new StaticObject ("img/bookcase.png");
		popup.x = 900;
		popup.y = 0;
		//addChild(popup);
		
	}
	
	function selectCase ()
	{
		currentCase = Std.random(game.casesArray.length);
		trace(game.casesArray[Std.random(game.casesArray.length)].caseText);
	}
	
	function displayText ()
	{
		
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