package ;
import openfl.display.Sprite;

/**
 * ...
 * @author Andor
 */
class ChatBackground extends Sprite
{

	public function new(width:Float,height:Float) 
	{
		super();
		//this.graphics.lineStyle(5, 0xFF0000);
        this.graphics.beginFill(0xB5CEF9, 1);
        this.graphics.drawRoundRect(0, 0, width, height, 10, 10);
	}
	
}