package ;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Assets;

/**
 * ...
 * @author Andor
 */
class StaticObject extends Sprite 
{
	
	var img:Bitmap;
	
	public function new(image:String) 
	{
		super();
		img = new Bitmap(Assets.getBitmapData(image));
		draw();
	}
		function draw()
	{
		addChild(img);
	}
	
}