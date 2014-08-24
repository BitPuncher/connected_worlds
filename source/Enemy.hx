package;

import flixel.FlxSprite;
import flixel.util.FlxTimer;

class Enemy extends FlxSprite 
{
	private var behaviorTimer:FlxTimer;
	private var time:Int;

	override public function new():Void {
		super();

		time = 10;

		behaviorTimer = new FlxTimer(time, behavior, 0)
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