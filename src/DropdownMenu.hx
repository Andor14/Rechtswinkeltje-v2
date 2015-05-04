package ;
import openfl.display.Sprite;
import openfl.Lib;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.Assets;
import openfl.events.MouseEvent;
import openfl.events.KeyboardEvent;
import flash.system.System;
/**
 * ...
 * @author Andor
 */
class DropdownMenu extends Sprite
{
	var bgimg:Bitmap = new Bitmap(Assets.getBitmapData("img/dropmenu.png"));
	var exitButton:Button = new Button("img/dropexit.png", "img/dropexit2.png");
	var contButton:Button = new Button("img/continue.png", "img/continue2.png");
	var menuButton:Button = new Button("img/mainmenu.png", "img/mainmenu2.png");
	var gameUI:GameUI;
	var main:Main;
	
	public function new(gameUI:GameUI,main:Main) 
	{
		super();
		this.gameUI = gameUI;
		this.main = main;
		drawBG();
		createButtons();
	}
	
	function drawBG ()
	{
		bgimg.x = bgimg.x - (bgimg.width / 2) ;
		bgimg.y = bgimg.y - (bgimg.height / 2) ;
		addChild(bgimg);
	}
	
		private function createButtons()
	{

		contButton.x = 0 - (contButton.width / 2 );
		contButton.y = -200;
		contButton.addEventListener( MouseEvent.CLICK, onClickCont );
		addChild( contButton );
		
		menuButton.x = 0 - (menuButton.width / 2 );
		menuButton.y = -50;
		menuButton.addEventListener( MouseEvent.CLICK, onClickMenu );
		addChild( menuButton );
		
		exitButton.x = 0 - (exitButton.width / 2 );
		exitButton.y = 100;
		exitButton.addEventListener( MouseEvent.CLICK, onClickExit );
		addChild( exitButton );
	}
	
		function onClickCont( event:MouseEvent)
	{
		main.sound.playSound("click");
		gameUI.continueGame();
	}
	
		function onClickMenu( event:MouseEvent)
	{
		main.sound.playSound("click");
		main.gamePause();
		main.backToMain();
	}
	
		function onClickExit( event:MouseEvent)
	{
		System.exit(0);
	}
	
}