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
		fadeIn();
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
		
		txtField.background = true;
		txtField.backgroundColor = 0xFFFFFF;
		txtField.border = true ;
		txtField.borderColor = 0x000000 ;
		
		addChild (txtField);
			
	}
	
	function fadeIn ()
	{
		this.alpha = 0 ;
		Actuate.tween (this, 0.6, { alpha:1.0 } );
	}
	
}