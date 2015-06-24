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
	var id : Int ;
	var txtBG : ChatBackground ;
	
	public function new(inputText:String,inputId:Int) 
	{
		super();
		text = inputText ;
		id = inputId ;
		
		displayText();
		fadeIn();
	}
	
	
	function displayText ()
	{
		var textFormat: TextFormat = new TextFormat("Calibri", 10, 0x000000, true, false, false, null, null, TextFormatAlign.LEFT) ;
		var txtField : TextField = new TextField ();
		txtField.defaultTextFormat = textFormat;

		txtField.width = 160 ;
		txtField.height = 50 ;
		txtField.multiline = true ;
		txtField.wordWrap = true ;
		txtField.selectable = false ;
		txtField.text = text;
		
		txtBG = new ChatBackground((txtField.width + 10), (txtField.height + 10));
		txtBG.x = txtField.x - 5 ;
		txtBG.y = txtField.y - 5 ;
		
		addChild (txtBG);
		addChild (txtField);
			
	}
	
	function fadeIn ()
	{
		this.alpha = 0 ;
		Actuate.tween (this, 0.6, { alpha:1.0 } );
	}
	
	public function getText ():String
	{
		return text ;
	}
	
	public function getID ():Int
	{
		return id ;
	}
}