package ;

import flash.display.Sprite;
import flash.events.Event;
//import flash.Lib;
import openfl.Lib;
import openfl.display.StageDisplayState;


/**
 * ...
 * @author Andor
 */

class Main extends Sprite 
{
	var inited:Bool;
	var gameMain:GameMain;
	var mainMenu:Mainmenu;
	public var sound:Sound;
	public var music:Music;
	
	
	function resize(e) 
	{
		if (!inited) init();
		// else (resize or orientation change)
	}
	
	function init() 
	{
		if (inited) return;
		inited = true;
		
		//toggleFullscreen();
		
		sound = new Sound();
		addChild(sound);
		
		music = new Music();
		addChild(music);
		
		mainMenu = new Mainmenu(this);
		addChild(mainMenu);
	}
	
	private function toggleFullscreen() 
	{
		if (Lib.current.stage.displayState != StageDisplayState.FULL_SCREEN_INTERACTIVE)
		{
			Lib.current.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
		}
		else 
		{
			Lib.current.stage.displayState = StageDisplayState.NORMAL;
		}
	}

	public function startGame():Void
	{
		removeChild (mainMenu) ;
		gameMain = new GameMain(this);
		addChild(gameMain) ;
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
}
