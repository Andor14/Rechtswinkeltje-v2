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
class Music extends Sprite 
{
	var Maintheme = Assets.getSound("music/GGJ_Maintheme.mp3");

	var musicVolume: Float;
	var soundChannel:SoundChannel;	

	public function new() 
	{
		super();
		this.musicVolume = 1 ; // default volume
	}
	
	public function updateMusicVolume (input:Float)
	{
		this.musicVolume = input ;
	}
	
		public function stopMusic ()
	{
		soundChannel.stop();
	}
	
	public function mainMenuMusic ()
	
	{
		soundChannel = Maintheme.play();
		soundChannel.soundTransform = new SoundTransform(musicVolume);
		soundChannel.addEventListener(Event.SOUND_COMPLETE, mainMenuMusicRepeat );
	}
	
	// repeats the menu music
	
	function mainMenuMusicRepeat (event:Event)
	{
		soundChannel = Maintheme.play();
		soundChannel.soundTransform = new SoundTransform(musicVolume);
		soundChannel.addEventListener(Event.SOUND_COMPLETE, mainMenuMusicRepeat );
	}
	
}