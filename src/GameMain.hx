package;

import flash.display.Sprite;
import flash.events.Event;
import openfl.events.MouseEvent;
import openfl.Lib;

/**
 * ...
 * @author Andor
 */
class GameMain extends Sprite
{
	
	var main:Main;
	var book1:Book;
	var desk:StaticObject;
	
	public function new(main:Main) 
	{
		super();	
		this.main = main;
		
		trace ("game") ;
		
		createObjects();
		createBooks();	
	}
	
	function createBooks ()
	{
		book1 = new Book("img/book.png", "img/book.png");
		book1.x = 1000;
		book1.y = 40;
		book1.scaleX = 0.3 ;
		book1.scaleY = 0.3 ;
		addChild( book1 );
		
		book1.addEventListener( MouseEvent.MOUSE_DOWN, startDragging );
	}
	
	function createObjects ()
	{
		desk = new StaticObject ("img/desk.png");
		desk.x = 700;
		desk.y = 450;
		desk.scaleX = 0.5 ;
		desk.scaleY = 0.5 ;
		addChild(desk);
	}
	
	function startDragging( event:MouseEvent ):Void
	{
		cast( event.currentTarget, Book ).startDrag( );
		stage.addEventListener( MouseEvent.MOUSE_UP, releaseObject );
	}
	
	function releaseObject( event:MouseEvent ):Void
	{
		stage.removeEventListener( MouseEvent.MOUSE_UP, releaseObject );
		stopDrag();
	}
	
}