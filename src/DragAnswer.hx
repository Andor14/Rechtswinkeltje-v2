package ;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import motion.Actuate;

/**
 * ...
 * @author Andor
 */
class DragAnswer extends Sprite
{

	var text : String ;
	
	public function new(inputText:String) 
	{
		super();
		text = inputText ;
		
		displayText();
	}
	
	
	function displayText ()
	{
		var textFormat: TextFormat = new TextFormat("OCR A std", 10, 0x000000, true, false, false, null, null, TextFormatAlign.LEFT) ;
		var txtField : TextField = new TextField ();
		txtField.defaultTextFormat = textFormat;

		txtField.width = 160 ;
		txtField.height = 50 ;
		txtField.multiline = true ;
		txtField.wordWrap = true ;
		txtField.selectable = false ;
		txtField.text = text;
		addChild (txtField);
			
	}
	
	function fadeIn ()
	{
		
	}
	
}