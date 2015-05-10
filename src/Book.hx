package;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.events.MouseEvent;

/**
 * ...
 * @author Andor
 */
class Book extends StaticObject
{	
	var openBookObj:OpenBook;
	
	public function new(image:String) 
	{
		super(image);
	
		openBookObj = new OpenBook("img/bookopen.png",this);
		
		position();
	}
	
	function position ()
	{
		this.x = this.x - (this.width);
		this.y = this.y - (this.height);
		
		openBookObj.x = openBookObj.x - (openBookObj.width/2);
		openBookObj.y = openBookObj.y - (openBookObj.height/2);
		
		openBookObj.scaleX = 3 ;
		openBookObj.scaleY = 3 ;
	}
	
	public function openBook ()
	{
		//trace ("book is open");
		addChild (openBookObj);
	}
	
	public function closeBook ()
	{
		removeChild (openBookObj);
	}
}