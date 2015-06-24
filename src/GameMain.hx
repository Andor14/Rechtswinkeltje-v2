package;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.Lib;
import motion.Actuate;
import openfl.geom.Rectangle;
import openfl.Assets;
import haxe.Json;
import openfl.text.TextField;

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
	var book2:Book;
	
	var desk:StaticObject;
	var bookcase:StaticObject;
	var screen:PCScreen;
	public var casesArray:Array<Case> = new Array<Case>();
	var clock:Clock;
	var scoreCounter:ScoreCounter;
	public var gamePause:Bool = false ;
	
	var tempDragAnswer : DragAnswer ;
	var tempBook : Book ;
	
	var casePointsAdd: Int = 10 ;
	var casePointsSub: Int = 5 ;
	
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
		book1 = new Book("img/book.png",main,this,"lib/book1.json","img/bookopen.png");
		book1.x = 915;
		book1.y = 23;
		book1.startX = book1.x ;
		book1.startY = book1.y ;
		book1.scaleX = 0.8 ;
		book1.scaleY = 0.8 ;
		addChild( book1 );
		
		book1.addEventListener( MouseEvent.MOUSE_DOWN, startDraggingBook );
		
		book2 = new Book("img/book2.png",main,this,"lib/book2.json","img/bookopenkjrw.png");
		book2.x = 995;
		book2.y = 23;
		book2.startX = book2.x ;
		book2.startY = book2.y ;
		book2.scaleX = 0.8 ;
		book2.scaleY = 0.8 ;
		addChild( book2 );
		
		book2.addEventListener( MouseEvent.MOUSE_DOWN, startDraggingBook );
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
		
		screen = new PCScreen ("img/pcscreen.png",this,main);
		screen.x = 20;
		screen.y = 20;
		screen.scaleX = 1 ;
		screen.scaleY = 1 ;
		addChild(screen);
		
		scoreCounter = new ScoreCounter ();
		scoreCounter.x = 480 ;
		scoreCounter.y = 185 ;
		addChild(scoreCounter);
		
		
	}
	
	function createClock ()
	{
		clock = new Clock(this);
		clock.x = 620 + 85 ;
		clock.y = 2 + 85 ;
		addChild(clock);
	}
	
	function startDraggingBook( event:MouseEvent ):Void
	{
		if (gamePause == false)
		{
			if (event.currentTarget.overAnswer == false)
			{
				cast( event.currentTarget, Book ).startDrag( );
				tempBook = event.currentTarget ;
				stage.addEventListener( MouseEvent.MOUSE_UP, releaseObjectBook );
			}
		}
	}
	
	function releaseObjectBook( event:MouseEvent ):Void
	{
		stage.removeEventListener( MouseEvent.MOUSE_UP, releaseObjectBook );
		stopDrag();
		
		var rect:Rectangle = desk.getBounds(this);
		
		if (rect.contains(event.stageX, event.stageY))
		{
			tempBook.openBook();
		}
		else
		{
			Actuate.tween (tempBook, 0.3, { x:tempBook.startX } );
			Actuate.tween (tempBook, 0.3, { y:tempBook.startY } );
			tempBook.closeBook();
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
			scoreCounter.update(main.gameStats.score);
		}
	}
	
	public function dragAnswer (inputObj:BookTextField)
	{
		if (gamePause == false)
		{
			var dragAnswer : DragAnswer = new DragAnswer (inputObj.text,inputObj.ID) ;
			dragAnswer.x = Std.int(mouseX) - (inputObj.width/2) ;
			dragAnswer.y = Std.int(mouseY) - 10 ;
			addChild (dragAnswer);
			
			tempDragAnswer = dragAnswer ;
			dragAnswer.startDrag();
			stage.addEventListener( MouseEvent.MOUSE_UP, releaseDragAnswer );
		}
	}
	
	function releaseDragAnswer (event:MouseEvent)
	{
		// check if over input field
		
		var rect:Rectangle = screen.inputField.getBounds(this);
		var caseID:Int = screen.getCaseID() ;
		
		if (rect.contains(event.stageX, event.stageY))
		{
			if (screen.inputFieldOnScreen == true)
			{
				if (screen.answerGiven == false )
				{
					// check answer
					if (tempDragAnswer.getID() == casesArray[caseID].caseID)
					{
						//trace ("inputs: "+tempDragAnswer.getID()+", "+ casesArray[caseID].caseID);
						//trace ("good answer");
						
						main.gameStats.score = main.gameStats.score + casePointsAdd ;
						screen.goodAnswerSeq(tempDragAnswer.getText(),true);
						main.sound.playSound("chat");
						main.gameStats.casesAnswered = main.gameStats.casesAnswered + 1 ;
					}
					else
					{
						//trace ("try again");
						//trace ("inputs: " + tempDragAnswer.getID() + ", " + casesArray[caseID].caseID);
						
						screen.goodAnswerSeq(tempDragAnswer.getText(),false);
						main.gameStats.score = main.gameStats.score - casePointsSub ;
						main.sound.playSound("chat");
					}
				}
			}
		}
		
		
		
		removeChild(tempDragAnswer);
		stage.removeEventListener( MouseEvent.MOUSE_UP, releaseDragAnswer );
		
	}
	
}