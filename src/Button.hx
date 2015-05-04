package;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.events.MouseEvent;

/**
 * ...
 * @author Andor
 */
class Button extends StaticObject
{

	var imgHover:Bitmap; 
	
	
	public function new(image:String, imageHover:String) 
	{
		super(image);
		imgHover = new Bitmap(Assets.getBitmapData(imageHover));
		addEventListener(MouseEvent.MOUSE_OVER, OnMouseOver);
		addEventListener(MouseEvent.MOUSE_OUT, OnMouseOut);
	}
	
	function OnMouseOver(e:MouseEvent) 
	{
		removeChildren();
		addChild(imgHover);	
	}	
	
	
	function OnMouseOut(e:MouseEvent) 
	{
		removeChildren();
		addChild(img);
	}
	
}