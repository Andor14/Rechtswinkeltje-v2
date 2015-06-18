package ;
import openfl.Lib;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.events.MouseEvent;
import openfl.events.KeyboardEvent;
import flash.system.System;
import motion.Actuate;

/**
 * ...
 * @author Andor
 */
class GameUI extends Sprite
{

	var main:Main;
	var optionsButton:Button = new Button("img/options.png", "img/options2.png");
	var dropDownmenu:DropdownMenu;
	var menuShown:Bool = false ;
	
	public function new(main:Main) 
	{
		super();
		this.main = main;
		
		
		createButtons();
	}
	
	function createButtons()
	{
		optionsButton.scaleX = 0.5 ;
		optionsButton.scaleY = 0.5 ;
		optionsButton.x = (main.stage.stageWidth) - optionsButton.width;
		optionsButton.y = 0;
		optionsButton.addEventListener( MouseEvent.CLICK, onClickOptions );
		addChild( optionsButton );
	}
		
		function onClickOptions( event:MouseEvent)
	{
		main.sound.playSound("click");
		
		if (menuShown == false )
		{
			dropDownmenu = new DropdownMenu (this,main);
			dropDownmenu.x = (main.stage.stageWidth) / 2 ;
			dropDownmenu.y = (main.stage.stageHeight) - 1050 ;
			addChild(dropDownmenu);
			main.gamePause();
			menuShown = true;
			
			Actuate.apply (dropDownmenu, { y: (main.stage.stageHeight) - 1050 } );
			Actuate.tween (dropDownmenu, 0.7, { y: (main.stage.stageHeight) / 2 } );
			
			main.sound.playSound("dropdown2");
		}
		else
		{
			continueGame();
			main.sound.playSound("dropdown1");
		}
	}
	
	public function continueGame()
	{
		Actuate.apply (dropDownmenu, { y: (main.stage.stageHeight) / 2 } );
		Actuate.tween (dropDownmenu, 0.7, { y: (main.stage.stageHeight) -1050 } ).onComplete(removeMenu, null);
		main.gameUnPause();
		main.sound.playSound("dropdown1");
	}
	
	function removeMenu()
	{
		removeChild(dropDownmenu);
		menuShown = false;
	}	
	
}