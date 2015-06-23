package ;
import openfl.text.TextField;

/**
 * ...
 * @author Andor
 */
class TutorialScreen extends StaticObject
{
	var title: String = "" ;
	var text: String = "" ;
	
	var textField: TextField ;
	var titleTextField: TextField ;
	
	public function new() 
	{
		super(gameUI,main);
	}
	
}