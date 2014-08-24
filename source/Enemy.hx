package;

import flixel.FlxSprite;
import flixel.util.FlxTimer;

class Enemy extends FlxSprite 
{
	private var behaviorTimer:FlxTimer;
	private var time:Int;
	private var walkSpeed:Int;

	override public function new(xPos:Int, yPos:Int):Void {
		super();

		this.x = xPos;
		this.y = yPos;

		time = 1;
		walkSpeed = 60;

		this.maxVelocity.x = walkSpeed;
		this.maxVelocity.y = walkSpeed;

		behaviorTimer = new FlxTimer(time, behavior, 0);
	}

	override public function update():Void {
		super.update();
	}

	override public function destroy():Void {
		super.destroy();
	}

	public function behavior(timer:FlxTimer):Void
	{

	}
}