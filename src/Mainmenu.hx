package;

import openfl.Lib;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.events.MouseEvent;
import openfl.events.KeyboardEvent;
import flash.system.System;

import openfl.text.TextField;
import openfl.text.TextFieldType;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

/**
 * ...
 * @author Andor
 */
class Mainmenu extends Sprite
{

	var main:Main;
	var startButton:Button = new Button("img/menu/button_spelen.png", "img/menu/button_spelen_hover.png");
	var fullScreenButton:Button = new Button("img/menu/button_fullscreen_off.png", "img/menu/button_fullscreen_off_hover.png");
	var fullScreenButton2:Button = new Button("img/menu/button_fullscreen_on.png", "img/menu/button_fullscreen_on_hover.png");
	var exitButton:Button = new Button("img/Exit.png", "img/Exit2.png");	
	
	var inputText:TextField;
	var inputTextFormat:TextFormat;
	var playerName:String;
	
	public function new(main:Main) 
	{
		super();
		this.main = main;
		createBackground();
		createButtons();
		createNameField();
		//playMusic();

	}
	
		function createBackground ()
	{
		var backGround:StaticObject = new StaticObject("img/background.png");
		addChild(backGround);
		
		var table:StaticObject = new StaticObject("img/menu/background_menu.png");
		table.scaleX = 1 ;
		table.scaleY = 1 ;
		table.x = ((main.stage.stageWidth) / 2) - (table.width / 2);
		table.y = ((main.stage.stageHeight) / 2) - (table.height / 2);
		addChild(table);
		
		var notePad:StaticObject = new StaticObject("img/menu/menuSheet.png");
		notePad.scaleX = 1 ;
		notePad.scaleY = 1 ;
		notePad.x = ((main.stage.stageWidth) / 2) - (notePad.width / 2);
		notePad.y = ((main.stage.stageHeight) / 2) - (notePad.height / 2);
		addChild(notePad);
	}
	
	function createNameField()
	{
		var inputTextFormat:TextFormat = new TextFormat("OCR A std", 20, 0x000000, true, false, false, null, null, TextFormatAlign.CENTER) ;
		
		inputText = new TextField();
		
		inputText.defaultTextFormat = inputTextFormat ;
		//inputText.background = true;
		inputText.backgroundColor = 0xFFFFFF;
		//inputText.border = true ;
		inputText.borderColor = 0x000000 ;
		inputText.width = 250 ;
		inputText.height = 30 ;
		//inputText.x = ((main.stage.stageWidth) / 2) - (inputText.width / 2);
		inputText.x = 220;
		inputText.y = 200;
		inputText.type = TextFieldType.INPUT;	
		inputText.text = "Naam" ;
		
		addChild(inputText);
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
		
		updateName();
		main.gameStats.playerName = playerName ;
		main.startGame();
	}
	
		function updateName()
	{
		playerName = Std.string (inputText.text);
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