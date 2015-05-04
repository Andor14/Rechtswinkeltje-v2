package;

import flash.display.Sprite;
import flash.events.Event;
import openfl.events.MouseEvent;
import openfl.Lib;
import motion.Actuate;
import openfl.geom.Rectangle;

/**
 * ...
 * @author Andor
 */
class GameMain extends Sprite
{
	
	var main:Main;
	var book1:Book;
	var book1PosX:Float;
	var book1PosY:Float;
	var desk:StaticObject;
	
	public function new(main:Main) 
	{
		super();	
		this.main = main;
		
		createBackground();
		createObjects();
		createBooks();	
	
	}
	
		
		
	function createBackground ()
	{
		var backGround:StaticObject = new StaticObject("img/background.png");
		addChild(backGround);
	}
	
	function createBooks ()
	{
		book1 = new Book("img/book.png", "img/book.png");
		book1.x = 1000;
		book1.y = 40;
		book1PosX = book1.x ;
		book1PosY = book1.y ;
		book1.scaleX = 0.3 ;
		book1.scaleY = 0.3 ;
		addChild( book1 );
		
		book1.addEventListener( MouseEvent.MOUSE_DOWN, startDraggingBook );
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
	
	function startDraggingBook( event:MouseEvent ):Void
	{
		cast( event.currentTarget, Book ).startDrag( );
		stage.addEventListener( MouseEvent.MOUSE_UP, releaseObjectBook );
	}
	
	function releaseObjectBook( event:MouseEvent ):Void
	{
		stage.removeEventListener( MouseEvent.MOUSE_UP, releaseObjectBook );
		stopDrag();
		
		var rect:Rectangle = desk.getBounds(this);
		
		if (rect.contains(event.stageX, event.stageY))
		{
			
		}
		else
		{
			Actuate.tween (book1, 0.3, { x:book1PosX } );
			Actuate.tween (book1, 0.3, { y:book1PosY } );
		}
		
	}
	
}