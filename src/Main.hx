package ;

import flash.display.Sprite;
import flash.display.Stage;
import flash.display.StageScaleMode;
import flash.events.Event;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.Lib;
import openfl.display.StageDisplayState;
import openfl.Lib.getTimer;

/**
 * ...
 * @author Andor
 */

class Main extends Sprite 
{
	var inited:Bool;
	var lastTime:Int = 0;
	var gameMain:GameMain;
	var gameUI:GameUI;
	var mainMenu:Mainmenu;
	var advanceScreen:Advancementscreen;
	var tutorial:TutorialScreen;
	public var sound:Sound;
	public var music:Music;
	public var gameStats:GameStats = new GameStats();
	var pause:Bool = false ;
	var pauseOverlay:Bitmap = new Bitmap (Assets.getBitmapData("img/pausescreen.png"));
	var firstLaunch:Bool = true ;
	
	var currentScreen : Dynamic ;
	
	
	function resize(e) 
	{
		if (!inited) init();
		// else (resize or orientation change)
	}
	
	function init() 
	{
		if (inited) return;
		inited = true;
		
		//this.onResize(new Event("resize"));
		//this.stage.addEventListener(Event.RESIZE, this.onResize);
		
		addEventListener( Event.ENTER_FRAME, onEnterFrame);
		
		//toggleFullscreen();
		
		mainMenu = new Mainmenu(this);
		
		sound = new Sound();
		addChild(sound);
		
		music = new Music();
		addChild(music);
		
		addChild(mainMenu);
		currentScreen = mainMenu ;
		
		//advanceScreen = new Advancementscreen(this);
		//addChild(advanceScreen);
		//currentScreen = advanceScreen ;
		
		music.mainMenuMusic();
	}
	
	/**
	
	public function onResize(event:Event) : Void {
		
			this.width = this.stage.stageWidth;
			this.height = this.stage.stageHeight;
			//this.scaleX = this.scaleY = 1;
	}
	
	*/ 
	
	public function toggleFullscreen() 
	{
		if (stage.displayState != StageDisplayState.FULL_SCREEN_INTERACTIVE)
		{
			stage.scaleMode = StageScaleMode.EXACT_FIT ;
			stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
			
		}
		else 
		{
			stage.displayState = StageDisplayState.NORMAL;
		}
	}

	
	public function startGame():Void
	{
		if (currentScreen == gameMain)
		{
		removeChild (currentScreen) ;
		removeChild (gameUI);
		}
		else 
		{
		removeChild (currentScreen) ;
		}
		
		gameMain = new GameMain (this);
		addChild (gameMain);
		
		if (firstLaunch == true )
		{
			tutorial = new TutorialScreen (this,"img/tutbg.png");
			tutorial.x = ((this.stage.stageWidth) / 2) - (tutorial.width/2);
			tutorial.y = ((this.stage.stageHeight) / 2) - (tutorial.height/2) ;
			addChild(tutorial);
			gamePause();
			firstLaunch = false ;
		}
		
		gameUI = new GameUI(this);
		addChild(gameUI);
		currentScreen = gameMain;
		
		resetScore();
		
		
	}
	
	public function openAdvanceScreen()
	{
		if (currentScreen == gameMain)
		{
		removeChild (currentScreen) ;
		removeChild (gameUI);
		}
		else 
		{
		removeChild (currentScreen) ;
		}
		
		advanceScreen = new Advancementscreen(this);
		addChild (advanceScreen);
		currentScreen = advanceScreen ;
		
	}
	
	public function backToMain()
	{
		if (currentScreen == gameMain)
		{
		removeChild (currentScreen) ;
		removeChild (gameUI);
		}
		else 
		{
		removeChild (currentScreen) ;
		}
		
		addChild (mainMenu);
		currentScreen = mainMenu ;
		resetScore();
	}
	
	public function removeTut ()
	{
		removeChild(tutorial);
	}
	
	
	public function resetScore ()
	{
		gameStats.score = 0 ;
		gameStats.casesAnswered = 0 ;
		gameStats.wrongAnswered = 0 ;
	}
	
	public function gamePause ()
	{
		addChildAt(pauseOverlay,3);
		pause = true ;
		gameMain.pauseGame();
	}
	public function gameUnPause ()
	{
		removeChild(pauseOverlay);
		pause = false ;
		gameMain.unPauseGame();
	}
	
	/* SETUP */

	public function new() 
	{
		super();	
		addEventListener(Event.ADDED_TO_STAGE, added);
	}

	function added(e) 
	{
		removeEventListener(Event.ADDED_TO_STAGE, added);
		stage.addEventListener(Event.RESIZE, resize);
		#if ios
		haxe.Timer.delay(init, 100); // iOS 6
		#else
		init();
		#end
	}
	
	public static function main() 
	{
		// static entry point
		Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
		Lib.current.addChild(new Main());
	}
	
	function onEnterFrame (event: Event)
	{
		var currentTime:Int = getTimer();
		// time since last update
		var elapsedTime:Float = (currentTime - lastTime)/1000 ;
		
		// update below this
		
		gameMain.update();
		
		// reset lasttime
		lastTime = currentTime ;
	}
	
}
