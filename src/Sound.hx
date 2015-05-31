package;

import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;
import flash.media.SoundChannel;
import flash.media.SoundTransform;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.Assets.loadSound;

/**
 * ...
 * @author Andor
 */
class Sound extends Sprite 
{

	var click = Assets.getSound("sound/Click.wav");
	var beep = Assets.getSound("sound/Beep1.wav");
	var start = Assets.getSound("sound/start.wav");
	
	var soundVolume: Float;
	var channel:SoundChannel;
	
	public function new() 
	{
		super();
		this.soundVolume = 1 ; // default sound volume
	}
	
	public function playSound (input:String)
	{
		switch (input)
		{
			case "click" :
			channel = click.play( 0, 0, new SoundTransform(soundVolume ) );
			case "start" :
			channel = start.play( 0, 0, new SoundTransform(soundVolume ) );
			default :
			channel = beep.play( 0, 0, new SoundTransform(soundVolume ) );
		}
	}
	
	public function updateSoundVolume (input:Float)
	{
		this.soundVolume = input ;
	}
	
}