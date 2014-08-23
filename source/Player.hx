package; 

import flixel.*;
import flixel.util.*;

class Player extends FlxSprite
{
	//Player's Constructor
	override public function new():Void
	{  

		this.makeGraphic(20,20, FlxColor.WHITE);

		//x = X;
		//y = Y;

		this.maxVelocity.x = 120;
		this.maxVelocity.y = 120;
		this.facing = FlxObject.RIGHT;
		this.drag.x = 100;
		this.drag.y = 100;

		super();
	}

	override public function update():Void
	{
		this.acceleration.x = 0;

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
		if (FlxG.keys.justPressed.UP)
		{
			this.velocity.y = -this.maxVelocity.y * 8;
			this.facing = FlxObject.UP;
		}
		if (FlxG.keys.pressed.DOWN)
		{
			this.velocity.y = this.maxVelocity.y * 8;
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
