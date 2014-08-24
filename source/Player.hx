package; 

import flixel.*;
import flixel.util.*;
import flixel.addons.weapon.FlxWeapon;

class Player extends FlxSprite
{
	private var weapon:FlxWeapon;

	//Player's Constructor
	override public function new():Void
	{  
		super();


		this.makeGraphic(10,10, FlxColor.WHITE);

		//x = X;
		//y = Y;

		this.maxVelocity.x = 120;
		this.maxVelocity.y = 120;
		this.facing = FlxObject.RIGHT;
		this.drag.x = 100;
		this.drag.y = 100;

		weapon = new FlxWeapon("Gun");

		
	}

	override public function update():Void
	{
		this.acceleration.x = 0;
		this.acceleration.y = 0;

		if (FlxG.keys.pressed.LEFT)
		{
			this.acceleration.x = -this.maxVelocity.x * 8;
			this.facing = FlxObject.LEFT;
		}
		if (FlxG.keys.pressed.RIGHT)
		{
			this.acceleration.x = this.maxVelocity.x * 8;
			this.facing = FlxObject.RIGHT;
		}
		if (FlxG.keys.pressed.UP)
		{
			this.acceleration.y = -this.maxVelocity.y * 8;
			this.facing = FlxObject.UP;
		}
		if (FlxG.keys.pressed.DOWN)
		{
			this.acceleration.y = this.maxVelocity.y * 8;
			this.facing = FlxObject.DOWN;
		}

		super.update();

	}

	override public function destroy() 
	{
		super.destroy();
	}

	override public function kill()
	{
		super.kill();
	}

}
