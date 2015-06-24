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
	var answeredCases:Int ;
	var casesWrong:Int ;
	
	var exitButton:Button = new Button("img/Exit.png", "img/Exit2.png");
	var contButton:Button = new Button("img/scorescreen/speelopnieuw.png", "img/scorescreen/speelopnieuw2.png");
	var menuButton:Button = new Button("img/scorescreen/Hoofdmenu.png", "img/scorescreen/Hoofdmenu2.png");
	
	public function new(input:Main) 
	{
		super();
		this.main = input ;
		playerName = main.gameStats.playerName ;
		score = main.gameStats.score ;
		casesWrong = main.gameStats.wrongAnswered ;
		answeredCases = main.gameStats.casesAnswered ;
		
		createBackground();
		createButtons();
		showstats();
	}
	
	function createBackground ()
	{
		var backGround:StaticObject = new StaticObject("img/scorescreen/bg.png");
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
		contButton.y = 470;
		contButton.addEventListener( MouseEvent.CLICK, onClickCont );
		addChild( contButton );
		
		menuButton.x = (main.stage.stageWidth/2) - (menuButton.width / 2 ) - 200;
		menuButton.y = 470;
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
		var scoreTextFormat:TextFormat = new TextFormat("Viner Hand ITC", 26, 0x000000, true, true, false, null, null, TextFormatAlign.LEFT) ;
		
		var scoreTextField:TextField = new TextField();
		scoreTextField.defaultTextFormat = scoreTextFormat ;
		scoreTextField.width = 280 ;
		scoreTextField.height = 300 ;
		scoreTextField.x = 280;
		scoreTextField.y = 100 ;
		addChild (scoreTextField);
		scoreTextField.text = playerName+"'s score: " + score;
		scoreTextField.selectable = false ;
		scoreTextField.wordWrap = true ;
		scoreTextField.multiline = true ;
		
		var scoreTextField2:TextField = new TextField();
		scoreTextField2.defaultTextFormat = scoreTextFormat ;
		scoreTextField2.width = 280 ;
		scoreTextField2.height = 300 ;
		scoreTextField2.x = 730;
		scoreTextField2.y = 100 ;
		addChild (scoreTextField2);
		scoreTextField2.text = "Vragen goed beantwoord: " + answeredCases + "  " + "Verkeerde antwoorden: " + casesWrong ;
		scoreTextField2.selectable = false ;
		scoreTextField2.wordWrap = true ;
		scoreTextField2.multiline = true ;
	}
	
}