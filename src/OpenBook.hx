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
	var bookTextFormat:TextFormat;
	var closeButton:Button;
	var book:Book;
	
	public function new(image:String,book:Book) 
	{
		super(image);
		this.book = book;
		addButton();
		drawText();
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
	
	function drawText()
	{
		bookTextFormat = new TextFormat("OCR A std", 10, 0x000000, true, false, false, null, null, TextFormatAlign.LEFT) ;
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