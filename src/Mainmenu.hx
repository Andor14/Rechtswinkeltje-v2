package;

import openfl.Lib;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.events.MouseEvent;
import openfl.events.KeyboardEvent;
import flash.system.System;

/**
 * ...
 * @author Andor
 */
class Mainmenu extends Sprite
{

	var main:Main;
	var startButton:Button = new Button("img/menu/button_spelen.png", "img/menu/button_spelen_hover.png");
	var fullScreenButton:Button = new Button("img/menu/button_fullscreen_off.png", "img/menu/button_fullscreen_off.png");
	var fullScreenButton2:Button = new Button("img/menu/button_fullscreen_on.png", "img/menu/button_fullscreen_on.png");
	var exitButton:Button = new Button("img/Exit.png", "img/Exit2.png");	
	
	public function new(main:Main) 
	{
		super();
		this.main = main;
		createBackground();
		createButtons();
		//playMusic();

	}
	
		function createBackground ()
	{
		var backGround:StaticObject = new StaticObject("img/background.png");
		addChild(backGround);
		
		var notePad:StaticObject = new StaticObject("img/menu/menuSheet.png");
		notePad.scaleX = 1 ;
		notePad.scaleY = 1 ;
		notePad.x = ((main.stage.stageWidth) / 2) - (notePad.width / 2);
		notePad.y = ((main.stage.stageHeight) / 2) - (notePad.height / 2);
		addChild(notePad);
	}
	
	private function createButtons()
	{
		
		startButton.scaleX = 0.5 ;
		startButton.scaleY = 0.5 ;
		startButton.x = ((main.stage.stageWidth) / 2) - (startButton.width / 2);
		startButton.y = ((main.stage.stageHeight) / 2) - (startButton.height / 2) - 70;
		startButton.addEventListener( MouseEvent.CLICK, onClick );
		addChild( startButton );
		
		exitButton.scaleX = 0.5 ;
		exitButton.scaleY = 0.5 ;
		exitButton.x = (main.stage.stageWidth) - exitButton.width;
		exitButton.y = 0;
		exitButton.addEventListener( MouseEvent.CLICK, onClickExit );
		addChild( exitButton );
		
		fullScreenButton.scaleX = 0.5 ;
		fullScreenButton.scaleY = 0.5 ;
		fullScreenButton.x = ((main.stage.stageWidth) / 2) - (fullScreenButton.width / 2);
		fullScreenButton.y = ((main.stage.stageHeight) / 2) - (fullScreenButton.height / 2) + 100;
		fullScreenButton.addEventListener( MouseEvent.CLICK, fullScreenOn );
		addChild( fullScreenButton );
		
		fullScreenButton2.scaleX = 0.5 ;
		fullScreenButton2.scaleY = 0.5 ;
		fullScreenButton2.x = ((main.stage.stageWidth) / 2) - (fullScreenButton2.width / 2);
		fullScreenButton2.y = ((main.stage.stageHeight) / 2) - (fullScreenButton2.height / 2) + 100;
		fullScreenButton2.addEventListener( MouseEvent.CLICK, fullScreenOff );
		
	}
		function onClick( event:MouseEvent)
	{
		main.sound.playSound("start");
		main.startGame();
	}
	
		function onClickExit( event:MouseEvent)
	{
		System.exit(0);
	}
	
		function fullScreenOn( event:MouseEvent)
	{
		main.sound.playSound("click");
		removeChild(fullScreenButton);
		addChild(fullScreenButton2);
		main.toggleFullscreen();
	}
	
	function fullScreenOff( event:MouseEvent)
	{
		main.sound.playSound("click");
		removeChild(fullScreenButton2);
		addChild(fullScreenButton);
		main.toggleFullscreen();
	}
	
	function playMusic()
	{
		main.music.mainMenuMusic();
	}
	
}