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
	var title: String = "Welkom." ;
	var text: String = "Je hebt je eigen rechtswinkeltje opgezet, en de eerste klanten staan al klaar! Verdien punten door zo veel mogelijk van hun vragen te beantwoorden voor de tijd op is. Wanneer je een berichtje krijgt, klik op het scherm om te beginnen. Sleep daarna een boek uit de boekenkast op de tafel om het antwoord op te zoeken. Wanneer je je antwoord gevonden hebt, sleep deze naar het invul hokje onder het scherm. Veel succes!" ;
	
	var textField: TextField ;
	var titleTextField: TextField ;
	
	var main:Main;
	
	var contButton:Button = new Button("img/tutstart2.jpg", "img/tutstart.jpg");
	var TitletextFormat : TextFormat = new TextFormat("Calibri", 20, 0x000000, true, false, false, null, null, TextFormatAlign.LEFT) ;
	var textFormat : TextFormat = new TextFormat("Calibri", 15, 0x000000, true, false, false, null, null, TextFormatAlign.LEFT) ;
	
	
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
		titleTextField.x = 25 ;
		titleTextField.y = 20 ;
		
		addChild(titleTextField);
	}
	
	function drawText ()
	{
		textField = new TextField ();
		textField.defaultTextFormat = textFormat;
		
		textField.selectable = false ;
		textField.text = text;
		textField.width = 350 ;
		textField.height = 400 ;
		//textField.autoSize = LEFT ;
		textField.wordWrap = true ;
		textField.multiline = true ;
		textField.x = 25 ;
		textField.y = 70 ;
		
		addChild(textField);
	}
	
	function drawbutton ()
	{
		contButton.x = (this.width/2) - (contButton.width / 2 );
		contButton.y = 503;
		contButton.addEventListener( MouseEvent.CLICK, removeThis );
		addChild( contButton );
	}
	
	function removeThis (event:MouseEvent)
	{
		main.sound.playSound("click");
		main.gameUnPause();
		main.removeTut();
		
	}
}