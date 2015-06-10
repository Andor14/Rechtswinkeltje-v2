package ;
import openfl.Lib;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.events.MouseEvent;
import openfl.events.KeyboardEvent;
import openfl.system.System;

import openfl.text.TextField;
import openfl.text.TextFieldType;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
/**
 * ...
 * @author Andor
 */
class Advancementscreen extends Sprite
{

	var main:Main ;
	var playerName: String ;
	var score: Int ;
	
	var exitButton:Button = new Button("img/Exit.png", "img/Exit2.png");
	var contButton:Button = new Button("img/continue.png", "img/continue2.png");
	var menuButton:Button = new Button("img/mainmenu.png", "img/mainmenu2.png");
	
	public function new(input:Main) 
	{
		super();
		this.main = input ;
		playerName = main.gameStats.playerName ;
		score = main.gameStats.score ;
		
		createBackground();
		createButtons();
		showstats();
	}
	
	function createBackground ()
	{
		var backGround:StaticObject = new StaticObject("img/background.png");
		addChild(backGround);
	}
	
		private function createButtons()
	{
		
		exitButton.scaleX = 0.5 ;
		exitButton.scaleY = 0.5 ;
		exitButton.x = (main.stage.stageWidth) - exitButton.width;
		exitButton.y = 0;
		exitButton.addEventListener( MouseEvent.CLICK, onClickExit );
		addChild( exitButton );
		
		contButton.x = (main.stage.stageWidth/2) - (contButton.width / 2 ) + 200;
		contButton.y = 600;
		contButton.addEventListener( MouseEvent.CLICK, onClickCont );
		addChild( contButton );
		
		menuButton.x = (main.stage.stageWidth/2) - (menuButton.width / 2 ) - 200;
		menuButton.y = 600;
		menuButton.addEventListener( MouseEvent.CLICK, onClickMenu );
		addChild( menuButton );
	}
	
		function onClickCont( event:MouseEvent)
	{
		main.sound.playSound("click");
		main.startGame();
	}
	
		function onClickMenu( event:MouseEvent)
	{
		main.sound.playSound("click");
		main.backToMain();
	}
	
		function onClickExit( event:MouseEvent)
	{
		System.exit(0);
	}
	
	function showstats()
	{
		var scoreTextFormat:TextFormat = new TextFormat("OCR A std", 25, 0xFF0000, true, false, false, null, null, TextFormatAlign.CENTER) ;
		var scoreTextField:TextField = new TextField();
		scoreTextField.defaultTextFormat = scoreTextFormat ;
		scoreTextField.width = 700 ;
		scoreTextField.height = 50 ;
		scoreTextField.x = ((main.stage.stageWidth) / 2) - (scoreTextField.width / 2);
		scoreTextField.y = 100 ;
		addChild (scoreTextField);
		scoreTextField.text = playerName+"'s score: "+score;
	}
	
}