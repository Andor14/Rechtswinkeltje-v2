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
	var startButton:Button = new Button("img/enginestart.png", "img/enginestart2.png");
	var exitButton:Button = new Button("img/Exit.png", "img/Exit2.png");	
	
	public function new(main:Main) 
	{
		super();	
		this.main = main;
		createButtons();
		playMusic();

	}
	
	private function createButtons()
	{
		
		startButton.scaleX = 0.5 ;
		startButton.scaleY = 0.5 ;
		startButton.x = ((main.stage.stageWidth) / 2) - (startButton.width / 2);
		startButton.y = ((main.stage.stageHeight) / 2) - (startButton.height / 2);
		startButton.addEventListener( MouseEvent.CLICK, onClick );
		addChild( startButton );
		
		exitButton.scaleX = 0.5 ;
		exitButton.scaleY = 0.5 ;
		exitButton.x = (main.stage.stageWidth) - exitButton.width;
		exitButton.y = 0;
		exitButton.addEventListener( MouseEvent.CLICK, onClickExit );
		addChild( exitButton );
		
	}
	
		function onClick( event:MouseEvent)
	{
		main.sound.playSound("click");
		main.startGame();
	}
	
		function onClickExit( event:MouseEvent)
	{
		System.exit(0);
	}
	
	function playMusic()
	{
		main.music.mainMenuMusic();
	}
	
}