package ;

import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.events.MouseEvent;

/**
 * ...
 * @author Andor
 */
class OpenBook extends StaticObject 
{
	var textField:TextField;
	var textField2:TextField;
	var bookTextFormat:TextFormat;
	var closeButton:Button;
	var book:Book;
	
	public function new(image:String,book:Book) 
	{
		super(image);
		this.book = book;
		
		bookInit();
		addButton();
		//drawText();
		fillbook();
		
	}
	
	function bookInit ()
	{
		bookTextFormat = new TextFormat("OCR A std", 10, 0x000000, true, false, false, null, null, TextFormatAlign.LEFT) ;
	}
	
	function addButton()
	{
		closeButton = new Button ("img/bookclose.png", "img/bookclose2.png");
		closeButton.x = 375 ;
		closeButton.y = 10 ;
		closeButton.addEventListener( MouseEvent.CLICK, clickButton );
		addChild(closeButton);
	}
	
	function clickButton(event:MouseEvent)
	{
		book.closeBook();
	}
	
	function fillbook()
	{
		for (i in 0...6 )
		{
			var ypos: Int = 10 ;
			var xpos: Int = 30 ;
			
			
			textField2 = new TextField();
			textField2.defaultTextFormat = bookTextFormat;
			textField2.x = xpos;
			textField2.y = ypos;
			textField2.width = 150 ;
			textField2.height = 20 ;
			textField2.text = "test";
			addChild (textField2);
			
			ypos = ypos + 20 ;
			
		}
	}
	
	function drawText()
	{
		//bookTextFormat = new TextFormat("OCR A std", 10, 0x000000, true, false, false, null, null, TextFormatAlign.LEFT) ;
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