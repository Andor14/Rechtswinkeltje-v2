package;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.events.MouseEvent;

/**
 * ...
 * @author Andor
 */
class Button extends Sprite
{

	var imgNormal:Bitmap;
	var imgHover:Bitmap; 
	
	
	public function new(image:String, imageHover:String) 
	{
		super();
		imgNormal = new Bitmap(Assets.getBitmapData(image));
		imgHover = new Bitmap(Assets.getBitmapData(imageHover));
		draw();
		addEventListener(MouseEvent.MOUSE_OVER, OnMouseOver);
		addEventListener(MouseEvent.MOUSE_OUT, OnMouseOut);
	}
	
	function draw()
	{
		addChild(imgNormal);
	}
	
	
	function OnMouseOver(e:MouseEvent) 
	{
		removeChildren();
		addChild(imgHover);	
	}	
	
	
	function OnMouseOut(e:MouseEvent) 
	{
		removeChildren();
		addChild(imgNormal);
	}
	
}