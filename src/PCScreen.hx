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
	public var inputField:StaticObject ;
	var caseSelected : Bool = false ;
	var currentCase : Int ;
	var txtField : TextField ;
	var timer:Timer ;
	
	var textx : Int = 50 ;
	var texty : Int = 50 ;
	
	public function new(image:String,gameMain:GameMain,main:Main) 
	{
		super(image);
		this.game = gameMain ;
		this.main = main ;
		init();
		startCountdown();
	}
	
	function init()
	{
		timer = new Timer ();
	}
	
	function startCountdown ()
	{
		timer.setTime(100);
		
		
		timer.startTimer();
	}
	
	public function closeCase ()
	{
		removeChild(inputField);
		removeChild(txtField);
		caseSelected = false ;
		startCountdown();
	}
	
	function openCase ()
	{
		selectCase();
		displayText();
		displayInputBox();
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
	
	function displayInputBox ()
	{
		inputField = new StaticObject("img/AntwoordBox.png") ;
		inputField.x = 50 ;
		inputField.y = 300 ;
		inputField.alpha = 0 ;
		addChild(inputField);
		
		Actuate.tween (inputField, 2.0 , { alpha:1 } );
	}
	
	function displayText ()
	{
		var textFormat: TextFormat = new TextFormat("OCR A std", 10, 0x000000, true, false, false, null, null, TextFormatAlign.LEFT) ;
		txtField = new TextField ();
		txtField.defaultTextFormat = textFormat;	
		
		txtField.x = textx;
		txtField.y = texty;
		txtField.width = 350 ;
		txtField.height = 300 ;
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
	
	public function getCaseID ():Int
	{
		return currentCase;
	}
	
	public function feedbackGood ()
	{
		// WIP
		
		var vinkje : StaticObject = new StaticObject ("img/goodanswer.png") ;
		vinkje.x = this.width / 2 ;
		vinkje.y = (this.height / 2) + 100 ;
		addChild(vinkje) ;
		vinkje.alpha = 0 ;
		
		Actuate.tween (vinkje, 1.0 , { alpha:1 } );
		
	}
	
}