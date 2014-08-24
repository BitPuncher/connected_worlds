package;

import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.util.FlxTimer;
import flixel.util.FlxRandom;

class Sheep extends Enemy {
	private var moveTimer:FlxTimer;
	private var direction:Int;

	override public function new(xPos:Int, yPos:Int):Void 
	{
		super(xPos, yPos);

		// this.x = xPos;
		// this.y = yPos;

		direction = 1;

		this.walkSpeed = 30;

		this.maxVelocity.x = walkSpeed;
		this.maxVelocity.y = walkSpeed;

		this.loadGraphic('sheep-sprite');
	}

	override public function update():Void {
		super.update();
		
	}

	override public function destroy():Void {
		super.destroy();
	}

	override public function behavior(timer:FlxTimer):Void
	{
		this.acceleration.x = 0;
		this.acceleration.y = 0;
		this.velocity.x = 0;
		this.velocity.y = 0;

		moveTimer = new FlxTimer(1, endMove, 1);

		direction = FlxRandom.intRanged(0, 3);

		if (direction == 0)
		{
			this.acceleration.y = -this.maxVelocity.y * 8;
			this.facing = FlxObject.UP;
		}
		if (direction == 1)
		{
			this.acceleration.x = this.maxVelocity.x * 8;
			this.facing = FlxObject.RIGHT;
		}
		if (direction == 2)
		{
			this.acceleration.y = this.maxVelocity.y * 8;
			this.facing = FlxObject.DOWN;
		}
		if (direction == 3)
		{
			this.acceleration.x = -this.maxVelocity.x * 8;
			this.facing = FlxObject.LEFT;
		}

	}

	public function endMove(timer:FlxTimer):Void
	{
		this.acceleration.x = 0;
		this.acceleration.y = 0;
		this.velocity.x = 0;
		this.velocity.y = 0;

		moveTimer.cancel();

	}
}