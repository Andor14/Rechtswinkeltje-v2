package ;
import openfl.text.TextField;
import openfl.Assets;
import openfl.events.MouseEvent;
import openfl.events.KeyboardEvent;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.text.TextFieldAutoSize;


/**
 * ...
 * @author Andor
 */
class TutorialScreen extends StaticObject
{
	var title: String = "Wat te doen?" ;
	var text: String = "Speel dit spel, bla bla bla bal abla banwjad jifwanfwna nfwnafianwi nfjwnafnawi nfjwnafnwai jiu" ;
	
	var textField: TextField ;
	var titleTextField: TextField ;
	
	var main:Main;
	
	var contButton:Button = new Button("img/continue.png", "img/continue2.png");
	var TitletextFormat : TextFormat = new TextFormat("OCR A std", 20, 0x000000, true, false, false, null, null, TextFormatAlign.LEFT) ;
	var textFormat : TextFormat = new TextFormat("OCR A std", 10, 0x000000, true, false, false, null, null, TextFormatAlign.LEFT) ;
	
	
	public function new(main:Main,img:String) 
	{
		super(img);
		this.main = main;
		drawbutton();
		drawTitle();
		drawText();
		
	}
	
	function drawTitle ()
	{
		titleTextField = new TextField ();
		titleTextField.defaultTextFormat = TitletextFormat;
		
		titleTextField.selectable = false ;
		titleTextField.text = title;
		titleTextField.width = 400 ;
		titleTextField.autoSize = LEFT ;
		titleTextField.wordWrap = true ;
		titleTextField.multiline = true ;
		titleTextField.x = 10 ;
		titleTextField.y = 20 ;
		
		addChild(titleTextField);
	}
	
	function drawText ()
	{
		textField = new TextField ();
		textField.defaultTextFormat = textFormat;
		
		textField.selectable = false ;
		textField.text = text;
		textField.width = 380 ;
		textField.height = 400 ;
		//textField.autoSize = LEFT ;
		textField.wordWrap = true ;
		textField.multiline = true ;
		textField.x = 10 ;
		textField.y = 50 ;
		
		addChild(textField);
	}
	
	function drawbutton ()
	{
		contButton.x = (this.width/2) - (contButton.width / 2 );
		contButton.y = 450;
		contButton.addEventListener( MouseEvent.CLICK, removeThis );
		addChild( contButton );
	}
	
	function removeThis (event:MouseEvent)
	{
		main.gameUnPause();
		main.removeTut();
		
	}
}