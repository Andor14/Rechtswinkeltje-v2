package ;
import openfl.display.Sprite;

/**
 * ...
 * @author Andor
 */
class Advancementscreen extends Sprite
{

	var main:Main ;
	
	public function new(input:Main) 
	{
		super();
		this.main = input ;
		
		
		createBackground();
	}
	
	function createBackground ()
	{
		var backGround:StaticObject = new StaticObject("img/background.png");
		addChild(backGround);
	}
	
}