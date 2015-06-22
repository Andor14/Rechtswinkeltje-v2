package ;
import openfl.display.Sprite;
import openfl.text.TextField ;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import motion.Actuate ;

/**
 * ...
 * @author Andor
 */
class Popuptext extends Sprite
{

	var textField : TextField ;
	var textFormat : TextFormat ;
	
	var text:String ;
	var dur : Int ;
	
	public function new(inputText:String,time:Int) 
	{
		super();
		this.text = inputText ;
		this.dur = time ;
		
		textFormat = new TextFormat("OCR A std", 20, 0xE60000, true, false, false, null, null, TextFormatAlign.CENTER) ;
		drawText();
		animate();
		
	}
	
	function drawText ()
	{
		textField = new TextField ();
		textField.defaultTextFormat = textFormat;
		
		textField.selectable = false ;
		textField.text = text;
		textField.alpha = 0 ;
		textField.autoSize = CENTER ;
		//textField.scaleX = 0.5 ;
		//textField.scaleY = 0.5 ;
		//this.scaleX = 0.5 ;
		//this.scaleY = 0.5 ;
		
		addChild(textField);
	}
	
	function animate ()
	{
		Actuate.tween (textField, 1 , { alpha:1 } );
		//Actuate.tween (this, 1 , { scaleX:1 } );
		//Actuate.tween (this, 1 , { scaleY:1 } );
		
		haxe.Timer.delay(animate2, dur);
	}
	
	function animate2 ()
	{
		Actuate.tween (textField, 1 , { y:(textField.y - 300 ) } );
		Actuate.tween (textField, 1 , { alpha:0 } );
		haxe.Timer.delay(removeText, 400);
	}
	
	function removeText ()
	{
		removeChild(this);
	}
	
}