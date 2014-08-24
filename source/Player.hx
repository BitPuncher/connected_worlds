package; 

import flixel.*;
import flixel.animation.*;
import flixel.util.*;
import flixel.addons.weapon.*;

class Player extends FlxSprite
{
	public var weapon:FlxWeapon;
	private var facingConversion:Map<Int, Int>;
	private var previousFacing:Int;

	//Player's Constructor
	override public function new():Void
	{  
		super();

		this.loadGraphic(AssetPaths.player_side_animated__png, true, 10, 10);
		animation.add("glowing", [0,1,2,3,4], 3);
		animation.play("glowing");

		this.maxVelocity.x = 70;
		this.maxVelocity.y = 70;
		this.facing = FlxObject.RIGHT;
		this.drag.x = 100;
		this.drag.y = 100;

		weapon = new FlxWeapon("Gun", this);

		weapon.makePixelBullet(10);
		weapon.setBulletLifeSpan(0);
		weapon.setFireRate(250);
		weapon.setBulletSpeed(250);
		weapon.setBulletOffset(4.5,4.5);

		facingConversion = new Map();
		facingConversion.set(FlxObject.DOWN, FlxWeapon.BULLET_DOWN);
		facingConversion.set(FlxObject.RIGHT, FlxWeapon.BULLET_RIGHT);
		facingConversion.set(FlxObject.LEFT, FlxWeapon.BULLET_LEFT);
		facingConversion.set(FlxObject.UP, FlxWeapon.BULLET_UP);
		
	}

	override public function update():Void
	{
		this.acceleration.x = 0;
		this.acceleration.y = 0;

		inputControl();
		if (previousFacing != facing) {
			changeSprite(facing);
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

	private function inputControl():Void {
		if (FlxG.keys.pressed.LEFT)
		{
			this.acceleration.x = -this.maxVelocity.x * 8;
			previousFacing = this.facing;
			this.facing = FlxObject.LEFT;
		}
		if (FlxG.keys.pressed.RIGHT)
		{
			this.acceleration.x = this.maxVelocity.x * 8;
			previousFacing = this.facing;
			this.facing = FlxObject.RIGHT;
		}
		if (FlxG.keys.pressed.UP)
		{
			this.acceleration.y = -this.maxVelocity.y * 8;
			previousFacing = this.facing;
			this.facing = FlxObject.UP;
		}
		if (FlxG.keys.pressed.DOWN)
		{
			this.acceleration.y = this.maxVelocity.y * 8;
			previousFacing = this.facing;
			this.facing = FlxObject.DOWN;
		}
		if (FlxG.keys.pressed.C)
		{
			weapon.setBulletDirection(facingConversion[this.facing], weapon.bulletSpeed);
			weapon.fire();
		}
	}

	private function changeSprite(facing:Int):Void {
		switch(facing) {
			case FlxObject.DOWN: loadGraphic(AssetPaths.player_down_animated__png, true, 10, 10);
			case FlxObject.UP: loadGraphic(AssetPaths.player_up_animated__png, true, 10, 10);
			case FlxObject.LEFT: loadGraphic(AssetPaths.player_side_animated__png, true, 10, 10); flipX = true;
			case FlxObject.RIGHT: loadGraphic(AssetPaths.player_side_animated__png, true, 10, 10); flipX = false;
		}
		animation.play("glowing");
	}

}
