package;

import flash.display.Sprite;
import flash.events.Event;
import openfl.events.MouseEvent;
import openfl.Lib;
import motion.Actuate;
import openfl.geom.Rectangle;
import openfl.Assets;
import haxe.Json;

// define the type a answer 'is'
typedef JSONCase = 
{
	var ID:Int;
	var text:String;
	var type:String;
	var correct:Int;
}

// define the type the book1 'is'
typedef JSONCases = 
{
  var cases:Array<GameMain.JSONCase>;
}


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
	var casesArray:Array<Case> = new Array<Case>();
	var clock:Clock;
	
	var gamePause:Bool = false ;
	
	public function new(main:Main) 
	{
		super();	
		this.main = main;
		
		createBackground();
		createObjects();
		createClock();
		createBooks();
		createCases();
		
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
		var jsonString = Assets.getText("lib/cases.json");
		var jsonObject:GameMain.JSONCases = Json.parse( jsonString );
		var caseCount:Int = jsonObject.cases.length;
		
		for (i in 0...caseCount)
		{
			var aCase:Case = new Case();
			aCase.caseID = jsonObject.cases[i].ID ;
			aCase.caseText = jsonObject.cases[i].text ;
			aCase.caseType = jsonObject.cases[i].type ;
			aCase.correctAnswer = jsonObject.cases[i].correct ;
			
			casesArray.push(aCase);
 		}
		
	}
	
	
	function createBooks ()
	{
		book1 = new Book("img/book.png",main);
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
		desk.x = ((main.stage.stageWidth) / 2) - (desk.width / 2);
		desk.y = 300;
		//desk.scaleX = 0.5 ;
		//desk.scaleY = 0.5 ;
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