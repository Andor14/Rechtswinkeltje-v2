package ;

import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.text.TextLineMetrics;
import openfl.text.TextFieldAutoSize;
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
	var pages:Array<Page> = new Array<Page>();
	var currentTwoPages:Int = 0;
	
	public function new(image:String,book:Book) 
	{
		super(image);
		this.book = book;
		
		bookInit();
		addButton();
		fillbook();		
		showPages(0);
		
	}
	
	function bookInit ()
	{
		bookTextFormat = new TextFormat("OCR A std", 10, 0x000000, true, false, false, null, null, TextFormatAlign.LEFT) ;
	}
	
	function addButton()
	{
		closeButton = new Button ("img/bookclose.png", "img/bookclose2.png");
		closeButton.x = 600 ;
		closeButton.y = 15 ;
		closeButton.addEventListener( MouseEvent.CLICK, clickButton );
		addChild(closeButton);
	}
	
	function clickButton(event:MouseEvent)
	{
		book.closeBook();
	}
	
	function fillbook()
	{
		var yposTop:Int = 27 ;
		var ypos: Int = 27 ;
		var xpos: Int = 24 ;
		var xpos2: Int = 320 ;
		var pageLength:Int = 341 ;
		var page2:Bool = false ;
		
		var page:Page = new Page();
		var currentPage:Page = page;
		
		for (i in 0...book.entrys.length)
		{
			var bookTxtField : BookTextField = new BookTextField ();
			bookTxtField.defaultTextFormat = bookTextFormat;
			
			bookTxtField.x = xpos;
			bookTxtField.y = ypos;
			bookTxtField.width = 290 ;
			//bookTxtField.height = 50 ;
			bookTxtField.multiline = true ;
			bookTxtField.wordWrap = true ;
			bookTxtField.selectable = false ;
			bookTxtField.text = book.entrys[i].text;
			bookTxtField.ID = book.entrys[i].ID;
			bookTxtField.autoSize = LEFT ;
			//addChild (bookTxtField);
			
			//trace (bookTxtField.numLines);
			
			var txtMetrics : TextLineMetrics = bookTxtField.getLineMetrics(bookTxtField.numLines -1);
			
			//trace (txtMetrics.width);
			//trace (txtMetrics.height);
			
			bookTxtField.addEventListener( MouseEvent.MOUSE_DOWN, clickAnswer );
			bookTxtField.addEventListener(MouseEvent.MOUSE_OVER,mouseOverAnswer);
			bookTxtField.addEventListener(MouseEvent.MOUSE_OUT,mouseOutAnswer);
				

			ypos = ypos + Std.int(bookTxtField.height) + 15 ;

			if ((bookTxtField.y + Std.int(bookTxtField.height)) > pageLength )
			{
				if (page2 == true)
				{
					page2 = false ;
					
					pages.push(currentPage);
					
					
					var newPage :Page = new Page();
					currentPage = newPage ;
					
					ypos = yposTop;
					bookTxtField.y = ypos ;
					bookTxtField.x = xpos ;
					currentPage.pageArray.push(bookTxtField);
					
					ypos = ypos + Std.int(bookTxtField.height) + 15 ;
				}
				else
				{
					
					page2 = true ;
					
					ypos = yposTop;
					bookTxtField.y = ypos ;
					bookTxtField.x = xpos2 ;
					currentPage.pageArray.push(bookTxtField);

					
					ypos = ypos + Std.int(bookTxtField.height) + 15 ;
					
				}
			}
			else 
			{
				currentPage.pageArray.push(bookTxtField);
			}
		}
	}
	
	function showPages (input:Int)
	{
		var a:Int = input ;
		
		for (i in 0...pages[a].pageArray.length)
		{
			addChild(pages[a].pageArray[i]);
		}
	}
	
	function clickAnswer (event:MouseEvent)
	{
		//trace (event.currentTarget.text);
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