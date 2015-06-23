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
	var nextPageButton:Button;
	var prevPageButton:Button;
	var book:Book;
	var jsonData:Dynamic;
	var pages:Array<Page> = new Array<Page>();
	var textHolder:Array<BookTextField> = new Array<BookTextField>();
	var currentTwoPages:Int = 0;
	var pageNumberRight : TextField ;
	var pageNumberLeft : TextField ;
	var rightPage:Int = 1 ;
	
	public function new(image:String,book:Book) 
	{
		super(image);
		this.book = book;
		
		bookInit();
		addButtons();
		fillbook();		
		showPages(0);
		addPageNumbers();
		
	}
	
	function bookInit ()
	{
		bookTextFormat = new TextFormat("OCR A std", 10, 0x000000, true, false, false, null, null, TextFormatAlign.LEFT) ;
	}
	
	function addPageNumbers ()
	{
		pageNumberRight = new TextField ();
		pageNumberRight.defaultTextFormat = bookTextFormat;
			
		pageNumberRight.x = (this.width/2) - 25;
		pageNumberRight.y = 370;
		pageNumberRight.width = 50 ;
		pageNumberRight.height = 50 ;
		pageNumberRight.selectable = false ;
		pageNumberRight.text = "1";
		
		addChild(pageNumberRight);
		
		pageNumberLeft = new TextField ();
		pageNumberLeft.defaultTextFormat = bookTextFormat;
			
		pageNumberLeft.x = (this.width/2) + 10;
		pageNumberLeft.y = 370;
		pageNumberLeft.width = 50 ;
		pageNumberLeft.height = 50 ;
		pageNumberLeft.selectable = false ;
		pageNumberLeft.text = "2";
		
		addChild(pageNumberLeft);
	}
	
	function updatePageNumbers ()
	{
		pageNumberRight.text = Std.string(rightPage) ;
		pageNumberLeft.text = Std.string((rightPage + 1));
	}
	
	function addButtons()
	{
		closeButton = new Button ("img/bookclose.png", "img/bookclose2.png");
		closeButton.x = 600 ;
		closeButton.y = 15 ;
		closeButton.addEventListener( MouseEvent.CLICK, clickButton );
		addChild(closeButton);
		
		nextPageButton = new Button ("img/bookclose.png", "img/bookclose2.png");
		nextPageButton.x = 600 ;
		nextPageButton.y = 380 ;
		nextPageButton.addEventListener( MouseEvent.CLICK, nextPage );
		addChild(nextPageButton);
		
		prevPageButton = new Button ("img/bookclose.png", "img/bookclose2.png");
		prevPageButton.x = 10 ;
		prevPageButton.y = 380 ;
		prevPageButton.addEventListener( MouseEvent.CLICK, prevPage );
		addChild(prevPageButton);
		
	}
	
	function clickButton(event:MouseEvent)
	{
		book.closeBook();
	}
	
	function nextPage(event:MouseEvent)
	{
		if (currentTwoPages < (pages.length - 1))
		{
		currentTwoPages = currentTwoPages + 1;
		showPages(currentTwoPages);
		rightPage = rightPage + 2 ;
		updatePageNumbers();
		
		}
	}
	
	function prevPage(event:MouseEvent)
	{
		if (currentTwoPages > 0)
		{
		currentTwoPages = currentTwoPages - 1;
		showPages(currentTwoPages);
		rightPage = rightPage - 2 ;
		updatePageNumbers();
		}
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
			
			if (i == book.entrys.length - 1)
			{
				pages.push(currentPage);
			}
			
		}
	}
	
	function showPages (input:Int)
	{
		for (i in 0...textHolder.length)
		{
			removeChild(textHolder.pop());
		}
		
		var a:Int = input ;
		
		for (i in 0...pages[a].pageArray.length)
		{
			textHolder.push(pages[a].pageArray[i]);
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