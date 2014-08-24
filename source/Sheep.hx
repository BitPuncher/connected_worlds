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

		loadGraphic(AssetPaths.sheep__png, true, 8, 8);
		animation.add("up-idle", [8, 9, 8, 10], 2);
		animation.add("up-move", [8,11], 2);
		animation.add("down-idle", [1,1,1,1,1,3], 6);
		animation.add("down-move", [1,2], 2);
		animation.add("side-idle", [4,4,4,4,4,7], 6);
		animation.add("side-move", [4,5,6,5], 4);

		state = [null, "move"];

		direction = 1;

		this.walkSpeed = 30;

		this.maxVelocity.x = walkSpeed;
		this.maxVelocity.y = walkSpeed;

		moveTimer = new FlxTimer();

		// this.loadGraphic('sheep-sprite');
		// this.loadRotatedGraphic('sheep-sprite', 4);
	}

	override public function update():Void {
		super.update();
		setState();

		if(stateChanged()) {
			updateSprite(this.facing, state[1]);
		}
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

		moveTimer.start(FlxRandom.floatRanged(1, 3), endMove, 1);

		direction = FlxRandom.intRanged(0, 3);

		if (direction == 0)
		{
			this.acceleration.y = -this.maxVelocity.y * 8;
			this.facing = FlxObject.UP;
			// animation.play("up-move");
		}
		if (direction == 1)
		{
			this.acceleration.x = this.maxVelocity.x * 8;
			this.facing = FlxObject.RIGHT;
			// animation.play("side-move");
			this.flipX = true;
		}
		if (direction == 2)
		{
			this.acceleration.y = this.maxVelocity.y * 8;
			this.facing = FlxObject.DOWN;
			// animation.play("down-move");
		}
		if (direction == 3)
		{
			this.acceleration.x = -this.maxVelocity.x * 8;
			this.facing = FlxObject.LEFT;
			// animation.play("side-move");
			this.flipX = false;
		}

	}

	public function endMove(timer:FlxTimer):Void
	{
		this.acceleration.x = 0;
		this.acceleration.y = 0;
		this.velocity.x = 0;
		this.velocity.y = 0;

		this.behaviorTimer.start(FlxRandom.floatRanged(2, 4), behavior, 1);
	}

	private function updateSprite(facing:Int, state:String):Void {
		if (state == "moving") {
			switch (facing) {
				case FlxObject.UP: animation.play("up-move");
				case FlxObject.DOWN: animation.play("down-move");
				case FlxObject.RIGHT: animation.play("side-move");
				case FlxObject.LEFT: animation.play("side-move");
			}
		}
		else {
			switch (facing) {
				case FlxObject.UP: animation.play("up-idle");
				case FlxObject.DOWN: animation.play("down-idle");
				case FlxObject.RIGHT: animation.play("side-idle");
				case FlxObject.LEFT: animation.play("side-idle");
			}
		}
	}

	private function setState():Void {
		state[0] = state[1];

		if (this.velocity.x != 0 || this.velocity.y != 0) {
			state[1] = "moving";
		}
		else {
			state[1] = "idle";
		}
	}

	private function stateChanged():Bool {
		return state[0] != state[1] || previousFacing != facing;
	}
}