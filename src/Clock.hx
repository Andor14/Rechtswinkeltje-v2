package ;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Assets;
/**
 * ...
 * @author Andor
 */
class Clock extends StaticObject
{
	var gameMain:GameMain;

	var arrow:ClockArrow;
	
	var timeLimit: Float = 0;
	var timeLeft: Float = 0;
	var angle: Float = 0 ;
	var anglePerTime:Float = 0 ;
	var timeUp:Bool = false ;
	var running:Bool = false ;
	
	public function new(input:GameMain) 
	{
		super("img/clockbg.png");
		this.gameMain = input;
		init();
	}
	
	function init()
	{
		timeLimit = 10000 ;
		//timeLimit = 3000 ;
		//timeLimit = 200 ;

		anglePerTime = 360 / timeLimit ;
		
		
		arrow = new ClockArrow();
		
		//img.scaleX = 0.7 ;
		//img.scaleY = 0.7 ;
		
		arrow.scaleX = 1.8 ;
		arrow.scaleY = 1.8 ;
		
		img.x = img.x - (img.width / 2) ;
		img.y = img.y - (img.height / 2) ;
		
		addChild(arrow);
		reset();
		
	}
	
	public function start()
	{
		running = true ;
	}
	
	public function stop()
	{
		running = false ;
	}
	
	public function reset()
	{
		timeLeft = timeLimit;
	}
	
	public function update()
	{
		if (running == true )
		{
			if (timeLeft == 0)
			{
				done();
			}
			else
			{
				timeLeft = (timeLeft - 1) ;
				angle = 360 - (timeLeft * anglePerTime) ;
				arrow.rotation = angle ;
			}
		}
	}
	
	function done()
	{
		//trace ("lvl is over.");
		gameMain.endLvl();
	}
	
}