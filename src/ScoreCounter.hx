package ;

import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

/**
 * ...
 * @author Andor
 */
class ScoreCounter extends Sprite
{

	var score:Int = 0 ;
	var scoreTextField:TextField;
	var bg : StaticObject ;
	
	public function new() 
	{
		super();
		drawbg();
		display();
	}
	
	public function update (input:Int)
	{
		score = input ;	
		scoreTextField.text = "Punten: "+score;
	}
	
	function display ()
	{
		
		var scoreTextFormat:TextFormat = new TextFormat("Viner Hand ITC", 25, 0x000000, true, true, false, null, null, TextFormatAlign.CENTER) ;
		scoreTextField = new TextField();
		scoreTextField.defaultTextFormat = scoreTextFormat ;
		scoreTextField.width = 400 ;
		scoreTextField.height = 50 ;
		scoreTextField.selectable = false ;
		addChild (scoreTextField);
	}
	
	function drawbg ()
	{
		bg = new StaticObject ("img/Scoreboard.png");
		bg.x = 110 ;
		bg.y = -12 ;
		addChild(bg);
	}
	
}