package ;

import motion.Actuate;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.text.TextFieldAutoSize;
import openfl.events.MouseEvent ;

/**
 * ...
 * @author Andor
 */
class PCScreen extends StaticObject
{
	var game:GameMain ;
	var main:Main ;
	var popup:Button ;
	var onScreen:StaticObject ;
	public var inputField:StaticObject ;
	var caseSelected : Bool = false ;
	var currentCase : Int ;
	var txtField : TextField ;
	var txtField2 : TextField ;
	var textFormat: TextFormat ;
	var txtBG : ChatBackground ;
	var txtBG2: ChatBackground ;
	var timer:Timer ;
	var goodAnswerImg:StaticObject ;
	var goodAnswer:Bool;
	
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
		inputField = new StaticObject("img/AntwoordBox.png") ;
		inputField.x = 50 ;
		inputField.y = 300 ;
		inputField.alpha = 0 ;
		textFormat = new TextFormat("OCR A std", 10, 0x000000, true, false, false, null, null, TextFormatAlign.LEFT) ;
	}
	
	function startCountdown ()
	{
		timer.setTime(100);
		
		
		timer.startTimer();
	}
	
	public function goodAnswerSeq (chatText:String, goodAnswerInput:Bool )
	{
		goodAnswer = goodAnswerInput ;
		
		txtField2 = new TextField();
		txtField2.defaultTextFormat = textFormat;	
		
		txtField2.x = 100 ;
		txtField2.y = texty + 30 + txtField.height;
		txtField2.width = 350 ;
		txtField2.height = 300 ;
		txtField2.multiline = true ;
		txtField2.wordWrap = true ;
		txtField2.selectable = false ;
		txtField2.text = chatText;
		txtField2.alpha = 0 ;
		txtField2.autoSize = LEFT ;
		
		txtBG2 = new ChatBackground((txtField2.width + 10), (txtField2.height + 10));
		txtBG2.x = txtField2.x - 5 ;
		txtBG2.y = txtField2.y - 5 ;
		
		addChild (txtBG2);
		addChild (txtField2);
		
		Actuate.tween (txtBG2, 1.0 , { alpha:1 } );
		Actuate.tween (txtField2, 1.0 , { alpha:1 } );
		
		if (goodAnswer == true)
		{
			haxe.Timer.delay(goodAnswerSeq2, 500);
		}
		else
		{
			haxe.Timer.delay(badAnswerSeq, 500);
		}
		
		
	}
	
	function badAnswerSeq ()
	{
		goodAnswerImg = new StaticObject("img/badanswer.png");
		goodAnswerImg.x = 30 ;
		goodAnswerImg.y = txtField2.y ;
		goodAnswerImg.alpha = 0 ;
		goodAnswerImg.scaleX = 1 ;
		goodAnswerImg.scaleY = 1 ;
		addChild(goodAnswerImg);
		
		Actuate.tween (goodAnswerImg, 1.0 , { alpha:1 } );
		
		main.sound.playSound("badanswer");
		
		haxe.Timer.delay(badAnswerSeq2, 1000);
	}
	
		function badAnswerSeq2 ()
	{
		Actuate.tween (txtBG2, 1.0 , { alpha:0 } );
		Actuate.tween (txtField2, 1.0 , { alpha:0 } );
		Actuate.tween (goodAnswerImg, 1.0 , { alpha:0 } );
		
		haxe.Timer.delay(badAnswerSeq3, 500);
	}
	
		function badAnswerSeq3 ()
	{
		removeChild(txtField2);
		removeChild(txtBG2);
		removeChild(goodAnswerImg);
	}
	
	function goodAnswerSeq2 ()
	{
		goodAnswerImg = new StaticObject("img/goodanswer.png");
		goodAnswerImg.x = 30 ;
		goodAnswerImg.y = txtField2.y ;
		goodAnswerImg.alpha = 0 ;
		goodAnswerImg.scaleX = 1 ;
		goodAnswerImg.scaleY = 1 ;
		addChild(goodAnswerImg);
		
		Actuate.tween (goodAnswerImg, 1.0 , { alpha:1 } );
		
		main.sound.playSound("goodanswer");
		
		haxe.Timer.delay(goodAnswerSeq3, 1000);
	}
	
		function goodAnswerSeq3 ()
	{
		Actuate.tween (txtBG, 1.0 , { alpha:0 } );
		Actuate.tween (txtField, 1.0 , { alpha:0 } );
		Actuate.tween (txtBG2, 1.0 , { alpha:0 } );
		Actuate.tween (txtField2, 1.0 , { alpha:0 } );
		Actuate.tween (inputField, 1.0 , { alpha:0 } );
		Actuate.tween (onScreen, 2.0 , { alpha:0 } );
		Actuate.tween (goodAnswerImg, 1.0 , { alpha:0 } );
		
		haxe.Timer.delay(closeCase, 500);
	}
	
	function closeCase ()
	{
		removeChild(inputField);
		removeChild(txtField);
		removeChild(txtBG);
		removeChild(txtField2);
		removeChild(txtBG2);
		removeChild(onScreen);
		caseSelected = false ;
		startCountdown();
		
		removeChild(goodAnswerImg);
	}
	
	function openCase ()
	{
		selectCase();
		showOnScreen();
		
		haxe.Timer.delay(displayText, 500);
		haxe.Timer.delay(displayInputBox, 700);
		
		//displayText();
		//displayInputBox();
	}
	
	function selectCase ()
	{
		currentCase = Std.random(game.casesArray.length);
		//trace(game.casesArray[currentCase].caseText);
	}
	
	function displayInputBox ()
	{
		addChild(inputField);
		
		Actuate.tween (inputField, 2.0 , { alpha:1 } );
	}
	
	function displayText ()
	{
		
		textFormat = new TextFormat("OCR A std", 10, 0x000000, true, false, false, null, null, TextFormatAlign.LEFT) ;
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
		txtField.autoSize = LEFT ;
		
		txtBG = new ChatBackground((txtField.width + 10), (txtField.height + 10));
		txtBG.x = txtField.x - 5 ;
		txtBG.y = txtField.y - 5 ;
		
		addChild (txtBG);
		addChild (txtField);
		
		Actuate.tween (txtBG, 1.0 , { alpha:1 } );
		Actuate.tween (txtField, 1.0 , { alpha:1 } );
		
		main.sound.playSound("chat");
	}
	
		function showOnScreen ()
	{
		onScreen = new StaticObject ("img/PCon.png");
		onScreen.x = 18;
		onScreen.y = 13;
		addChild(onScreen);
	}
	
	function showPopup ()
	{
		popup = new Button ("img/PCmessage.png", "img/PCmessageHover.png");
		popup.x = 18;
		popup.y = 13;
		popup.alpha = 0 ;
		popup.addEventListener( MouseEvent.CLICK, clickPopup );
		addChild(popup);
		Actuate.tween (popup, 1.0 , { alpha:1 } );
		main.sound.playSound("incoming");
	}
	
	function clickPopup (event:MouseEvent)
	{
		if (game.gamePause == false)
		{
			removeChild(popup);
			openCase();
		}
		
	}
	
	public function update ()
	{
		if (caseSelected == false )
		{
			if (timer.getDone() == true )
			{
				showPopup();
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