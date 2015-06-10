package;

import haxe.Json;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.events.MouseEvent;

// define the type a answer 'is'
typedef JSONAnswer = 
{
	var ID:Int;
	var text:String;
}

// define the type the book1 'is'
typedef Book1 = 
{
  var book1:Array<Book.JSONAnswer>;
}

/**
 * ...
 * @author Andor
 */
class Book extends StaticObject
{	
	var openBookObj:OpenBook;
	var main:Main;
	public var entrys:Array<Answer> = new Array<Answer>();
	
	public function new(image:String,main:Main) 
	{
		super(image);
		this.main = main;
	
		createEntrys();
		openBookObj = new OpenBook("img/bookopen.png",this);
		position();
	}
	
	function position ()
	{
		this.x = this.x - (this.width);
		this.y = this.y - (this.height);
		
		openBookObj.x = openBookObj.x - (openBookObj.width/2);
		openBookObj.y = openBookObj.y - (openBookObj.height/2);
		
		openBookObj.scaleX = 5 ;
		openBookObj.scaleY = 5 ;
	}
	
	function createEntrys()
	{
		var jsonString = Assets.getText("lib/book1.json");
		var jsonObject:Book.Book1 = Json.parse( jsonString );
		var entryCount:Int = jsonObject.book1.length;

		for(  i in 0...entryCount )
		{
			//trace( jsonObject.quiz[i] );
			//trace( jsonObject.book1[i].text );
			
			var entry : Answer = new Answer ();
			entry.ID = jsonObject.book1[i].ID ;
			entry.text = jsonObject.book1[i].text ;
			entrys.push(entry);
			
			//trace (entrys[i].text);
		}
	}
	
	public function openBook ()
	{
		addChild (openBookObj);
		main.sound.playSound("boekopen");
	}
	
	public function closeBook ()
	{
		removeChild (openBookObj);
		main.sound.playSound("boekdicht");
	}
}