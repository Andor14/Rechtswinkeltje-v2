package ;

import motion.Actuate;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

/**
 * ...
 * @author Andor
 */
class PCScreen extends StaticObject
{
	var game:GameMain ;
	var main:Main ;
	var popup:StaticObject ;
	var caseSelected : Bool = false ;
	var currentCase : Int ;
	var timer:Timer ;
	
	var textx : Int = 50 ;
	var texty : Int = 50 ;
	
	public function new(image:String,gameMain:GameMain,main:Main) 
	{
		super(image);
		this.game = gameMain ;
		this.main = main ;
		init();
		setCountdown();
	}
	
	function init()
	{
		timer = new Timer ();
	}
	
	function setCountdown ()
	{
		timer.setTime(100);
		
		trace ("time set");
		
		timer.startTimer();
		
	}
	
	function openCase ()
	{
		trace ("New case");
		selectCase();
		displayText();
		main.sound.playSound("incoming");
		
		popup = new StaticObject ("img/bookcase.png");
		popup.x = 900;
		popup.y = 0;
		//addChild(popup);
		
	}
	
	function selectCase ()
	{
		currentCase = Std.random(game.casesArray.length);
		//trace(game.casesArray[currentCase].caseText);
	}
	
	function displayText ()
	{
		var textFormat: TextFormat = new TextFormat("OCR A std", 10, 0x000000, true, false, false, null, null, TextFormatAlign.LEFT) ;
		var txtField : TextField = new TextField ();
		txtField.defaultTextFormat = textFormat;	
		
		txtField.x = textx;
		txtField.y = texty;
		txtField.width = 160 ;
		txtField.height = 50 ;
		txtField.multiline = true ;
		txtField.wordWrap = true ;
		txtField.selectable = false ;
		txtField.text = game.casesArray[currentCase].caseText;
		txtField.alpha = 0 ;
		addChild (txtField);
		
		Actuate.tween (txtField, 1.0 , { alpha:1 } );
	}
	
	public function update ()
	{
		if (caseSelected == false )
		{
			if (timer.getDone() == true )
			{
				openCase();
				caseSelected = true ;
			}
			else
			{
				timer.update();
			}
		}
		else
		{
			//trace ("true") ;
		}
	}
	
}