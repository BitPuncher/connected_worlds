package;

import flixel.FlxSprite;

class Sheep extends Enemy {
	override public function new(xPos:Int, yPos:Int):Void {
		super();

		this.x = xPos;
		this.y = yPos;

		this.loadGraphic('sheep-sprite');
	}

	override public function update():Void {
		super.update();
		
	}

	override public function destroy():Void {
		super.destroy();
	}
}