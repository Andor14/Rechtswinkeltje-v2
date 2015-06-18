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
	
	public function new() 
	{
		super();
		display();
	}
	
	public function update (input:Int)
	{
		score = input ;	
		scoreTextField.text = "score: "+score;
	}
	
	function display ()
	{
		var scoreTextFormat:TextFormat = new TextFormat("OCR A std", 25, 0x000000, true, false, false, null, null, TextFormatAlign.CENTER) ;
		scoreTextField = new TextField();
		scoreTextField.defaultTextFormat = scoreTextFormat ;
		scoreTextField.width = 400 ;
		scoreTextField.height = 50 ;
		scoreTextField.selectable = false ;
		addChild (scoreTextField);
	}
	
}