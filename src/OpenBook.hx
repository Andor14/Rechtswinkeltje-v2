package ;

import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

/**
 * ...
 * @author Andor
 */
class OpenBook extends StaticObject 
{
	var textField:TextField;
	var bookTextFormat:TextFormat;
	
	public function new(image:String) 
	{
		super(image);
		
		drawText();
	}
	
	function drawText()
	{
		bookTextFormat = new TextFormat("OCR A std", 10, 0xFF0000, true, false, false, null, null, TextFormatAlign.LEFT) ;
		textField = new TextField();
		textField.defaultTextFormat = bookTextFormat;
		textField.x = 30;
		textField.y = 10;
		textField.width = 150 ;
		textField.height = 20 ;
		textField.text = "Law and shit...";
		addChild (textField);
	}
	
}