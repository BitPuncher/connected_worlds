package; 

import flixel.*;
import flixel.util.*;

class Player extends FlxSprite
{
	//Player's Constructor
	override public function new():Void
	{  

		makeGraphic(20,20, FlxColor.WHITE);

		//x = X;
		//y = Y;

		maxVelocity.x = 120;
		maxVelocity.y = 120;
		facing = FlxObject.RIGHT;
		drag.x = 100;
		drag.y = 100;

		super();
	}

	override public function update():Void
	{
		acceleration.x = 0;

		if (FlxG.keys.pressed.LEFT)
		{
			acceleration.x = -maxVelocity.x * 8;
			facing = FlxObject.LEFT;
		}
		if (FlxG.keys.pressed.RIGHT)
		{
			acceleration.x = maxVelocity.x * 8;
			facing = FlxObject.RIGHT;
		}
		if (FlxG.keys.justPressed.UP)
		{
			velocity.y = -maxVelocity.y * 8;
			facing = FlxObject.UP;
		}
		if (FlxG.keys.pressed.DOWN)
		{
			velocity.y = maxVelocity.y * 8;
			facing = FlxObject.DOWN;
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
