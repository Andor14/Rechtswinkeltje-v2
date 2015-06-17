package ;

import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.text.TextLineMetrics;
import openfl.events.MouseEvent;
import openfl.Assets;
import haxe.Json;

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
	var jsonData:Dynamic;
	
	public function new(image:String,book:Book) 
	{
		super(image);
		this.book = book;
		
		bookInit();
		addButton();
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
		var ypos: Int = 10 ;
		var xpos: Int = 30 ;
		
		for (i in 0...book.entrys.length)
		{
			var bookTxtField : TextField = new TextField ();
			bookTxtField.defaultTextFormat = bookTextFormat;
			
			bookTxtField.x = xpos;
			bookTxtField.y = ypos;
			bookTxtField.width = 160 ;
			bookTxtField.height = 50 ;
			bookTxtField.multiline = true ;
			bookTxtField.wordWrap = true ;
			bookTxtField.selectable = false ;
			bookTxtField.text = book.entrys[i].text;
			addChild (bookTxtField);
			
			trace (bookTxtField.numLines);
			
			var txtMetrics : TextLineMetrics = bookTxtField.getLineMetrics(bookTxtField.numLines -1);
			
			//trace (txtMetrics.width);
			//trace (txtMetrics.height);
			
			bookTxtField.addEventListener( MouseEvent.MOUSE_DOWN, clickAnswer );
			bookTxtField.addEventListener(MouseEvent.MOUSE_OVER,mouseOverAnswer);
			bookTxtField.addEventListener(MouseEvent.MOUSE_OUT,mouseOutAnswer);
				
			ypos = ypos + Std.int(txtMetrics.height) + 50 ;
		}
	}
	
	
	function clickAnswer (event:MouseEvent)
	{
		trace (event.currentTarget.text);
		book.dragAnswer(event.currentTarget);
	}
	
	function mouseOverAnswer(event:MouseEvent)
	{
		book.overAnswer = true ;
	}
	
		function mouseOutAnswer(event:MouseEvent)
	{
		book.overAnswer = false ;
	}
}