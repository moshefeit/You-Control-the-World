package;

import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author Moshe Feit
 */
class Ball extends FlxSprite
{
	private var direction:Int;
	private var speed:Float = 250;

	public function new(?X:Float=0, ?Y:Float=0, ?FirstPost:FlxPoint) 
	{
		super(X, Y);
		
		makeGraphic(16, 16, FlxColor.GREEN, true);
		setPosition(FirstPost.x - 8, FirstPost.y - 8);
	}
	
	public function changeDirection(?pioneer:Pioneer)
	{
		this.angle = pioneer.angle;
		this.direction = pioneer.direction - 90;
	}
	
	public function movement()
	{
		velocity.set(speed, 0);
		velocity.rotate(FlxPoint.weak(0, 0), direction);
	}
	
	override public function update(elapsed:Float)
	{
		if (PlayState.isPlaying == true)
		{
			movement();
		}
		
		super.update(elapsed);
	}
	
	
}