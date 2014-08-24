package;

import flixel.FlxSprite;

class Sheep extends Enemy {
	override public function new():Void {
		super();

		this.makeGraphic('sheep-sprite');
	}

	override public function update():Void {
		super.update();
		
	}

	override public function destroy():Void {
		super.destroy();
	}
}