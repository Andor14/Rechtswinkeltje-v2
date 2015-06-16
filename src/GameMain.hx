package;

import openfl.display.Sprite;
import openfl.events.Event;
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
	var bookcase:StaticObject;
	var screen:PCScreen;
	public var casesArray:Array<Case> = new Array<Case>();
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
		//trace (main.gameStats.playerName);
		clock.start();
	}
	
	public function endLvl()
	{
		clock.stop();
		main.openAdvanceScreen();
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
		book1.x = 915;
		book1.y = 60;
		book1PosX = book1.x ;
		book1PosY = book1.y ;
		book1.scaleX = 0.2 ;
		book1.scaleY = 0.2 ;
		addChild( book1 );
		
		book1.addEventListener( MouseEvent.MOUSE_DOWN, startDraggingBook );
	}
	
	function createObjects ()
	{
		bookcase = new StaticObject ("img/bookcase.png");
		bookcase.x = 900;
		bookcase.y = 0;
		bookcase.scaleX = 1 ;
		bookcase.scaleY = 1 ;
		addChild(bookcase);
		
		desk = new StaticObject ("img/desk.png");
		//desk.x = ((main.stage.stageWidth) / 2) - (desk.width / 2);
		//desk.y = 300;
		desk.x = 0 ;
		desk.y = 320 ;
		desk.scaleX = 1 ;
		desk.scaleY = 1 ;
		addChild(desk);
		
		screen = new PCScreen ("img/pcscreen.png");
		screen.x = 20;
		screen.y = 20;
		screen.scaleX = 1 ;
		screen.scaleY = 1 ;
		addChild(screen);
		
	}
	
	function createClock ()
	{
		clock = new Clock(this);
		clock.x = 550 + 85 ;
		clock.y = 50 + 85 ;
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
			screen.update();
		}
	}
	
}