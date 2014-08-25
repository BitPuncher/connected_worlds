package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxObject;
import flixel.FlxBasic;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxColor;
import flixel.group.FlxGroup;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	private var player:Player;
	private var level:Level;
	private var enemyGroup:FlxGroup;
	private var musicOn:Bool;
	private var rifts:FlxGroup;
	private var riftedObjects:FlxGroup;

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


		// enemies init
		enemyGroup = new FlxGroup();
		enemyGroup.add(new Sheep(100, 100));
		enemyGroup.add(new Sheep(200, 150));
		enemyGroup.add(new Sheep(130, 210));
		enemyGroup.add(new Sheep(50, 270));
		enemyGroup.add(new Sheep(300, 140));

		// rolling over enemies
		// if (oldGroup != null)
		// {
		// 	oldGroup.forEachOfType(Enemy, transfer);
		// }

		// rifts init
		rifts = new FlxGroup();
		riftedObjects = new FlxGroup();

		// adding things
		add(level);
		add(player);
		add(player.weapon.group);
		add(enemyGroup);
		add(rifts);

		FlxG.sound.playMusic(AssetPaths.forest_of_heads__mp3, 5, true);
		musicOn = true;

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
	  FlxG.collide(level, enemyGroup);
	  FlxG.collide(player, enemyGroup);
	  FlxG.collide(enemyGroup, enemyGroup);
	  FlxG.collide(player.weapon.group, level, killBullet);
	  FlxG.collide(player.weapon.group, enemyGroup, enemyHit);

	  FlxG.collide(player, rifts, transportPlayer);
	  FlxG.collide(enemyGroup, rifts, transportEnemy);

		if (FlxG.keys.justPressed.M && musicOn)
		{
			FlxG.sound.pause();
			musicOn = false;
		}
		else if (FlxG.keys.justPressed.M)
		{
			FlxG.sound.resume();
			musicOn = true;

		}

	  if (enemyGroup.countLiving() < 2) {
	  	levelTransition();
	  }

		super.update();
	}

	private function killBullet(bullet:FlxObject, object:FlxObject):Void
	{
		bullet.kill();
	}	

	private function enemyHit(bullet:FlxObject, object:Enemy):Void
	{
		bullet.kill();
		object.hurt(20);	
	}

	// method to roll over enemies
	// private function transfer(oldEnemy:Enemy)
	// {
	// 	oldEnemy.y = (level.height / 2) + level.y;
	// 	oldEnemy.x = (level.width / 2) + level.x;
	// 	enemyGroup.add(oldEnemy);
	// }

	private function levelTransition() {
		var blackHole:FlxSprite = new FlxSprite((level.width / 2) + level.x - 10, (level.height / 2) + level.y - 10);
		blackHole.makeGraphic(20, 20, FlxColor.PURPLE);
		blackHole.angularVelocity = 45;

		rifts.add(blackHole);
	}

	private function transportEnemy(enemy:FlxObject, rift:FlxObject):Void {
		riftedObjects.add(enemy);
		enemyGroup.remove(enemy);
	}

	private function transportPlayer(player:FlxObject, rift:FlxObject):Void {
		remove(player);
		riftedObjects.add(player);

		// FlxG.switchState(PlayState);
	}
}