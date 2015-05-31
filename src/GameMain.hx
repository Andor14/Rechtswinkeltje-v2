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
	var screen:StaticObject;
	var cases:Array<Case> = new Array<Case>();
	var clock:Clock;
	
	var gamePause:Bool = false ;
	
	public function new(main:Main) 
	{
		super();	
		this.main = main;
		
		createBackground();
		createObjects();
		createBooks();
		createCases();
		createClock();
		
		init();
	}
		
	
	function init()
	{
		trace (main.gameStats.playerName);
		clock.start();
	}
	
	
	public function endLvl()
	{
		clock.stop();
		main.backToMain();
	}
	
	function createBackground ()
	{
		var backGround:StaticObject = new StaticObject("img/background.png");
		addChild(backGround);
	}
	
	function createCases()
	{
		for (i in 0...3)
		{
			var aCase:Case = new Case();
			aCase.caseName = "case 1";
			aCase.caseText = "Test Case: Bla bla bla bla bla" ;
			aCase.caseType = 0 ;
			aCase.correctAnswer = 0 ;
			
			cases.push(aCase);
 		}
		
		trace (cases);
	}
	
	
	function createBooks ()
	{
		book1 = new Book("img/book.png");
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
		
		screen = new StaticObject ("img/pcscreen.png");
		screen.x = 50;
		screen.y = 50;
		screen.scaleX = 0.5 ;
		screen.scaleY = 0.5 ;
		addChild(screen);
		
	}
	
	function createClock ()
	{
		clock = new Clock(this);
		clock.x = 600 ;
		clock.y = 60 ;
		addChild(clock);
	}
	
	function startDraggingBook( event:MouseEvent ):Void
	{
		if (gamePause == false)
		{
		cast( event.currentTarget, Book ).startDrag( );
		stage.addEventListener( MouseEvent.MOUSE_UP, releaseObjectBook );
		}
	}
	
	function releaseObjectBook( event:MouseEvent ):Void
	{
		stage.removeEventListener( MouseEvent.MOUSE_UP, releaseObjectBook );
		stopDrag();
		
		var rect:Rectangle = desk.getBounds(this);
		
		if (rect.contains(event.stageX, event.stageY))
		{
			book1.openBook();
		}
		else
		{
			Actuate.tween (book1, 0.3, { x:book1PosX } );
			Actuate.tween (book1, 0.3, { y:book1PosY } );
			book1.closeBook();
		}
	}
	
	public function pauseGame()
	{
		gamePause = true ;
	}
	
	public function unPauseGame()
	{
		gamePause = false ;
	}
	
	public function update()
	{
		if (gamePause == false)
		{
			clock.update();
		}
	}
	
}