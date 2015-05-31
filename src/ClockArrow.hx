package ;

/**
 * ...
 * @author Andor
 */
class ClockArrow extends StaticObject
{

	public function new() 
	{
		super("img/clockarrow.png");
		
		img.x = img.x - (img.width / 2) ;
		img.y = img.y - (img.height / 2) ;
	}
	
	
	
}