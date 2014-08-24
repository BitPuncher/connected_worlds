package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	private var player:Player;
	private var level:Level;

	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{

		// level init
		level = new Level();
		level.x = 10;
		level.y = 10;


		// player init
		player = new Player();

		player.x = 40;
		player.y = 40;

		// adding things
		add(level);
		add(player);

		super.create();
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
	  player.update();

	  // Collisions
	  FlxG.collide(level, player);

		super.update();
	}	
}