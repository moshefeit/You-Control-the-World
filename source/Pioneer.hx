package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.math.FlxRandom;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

import Random;

/**
 * ...
 * @author Moshe Feit
 */
using flixel.util.FlxSpriteUtil;
 
class Pioneer extends FlxSprite
{
	private var lineStyle:LineStyle = { color: FlxColor.WHITE, thickness: 5 };
	private var drawStyle:DrawStyle = { smoothing: true };
	private var speed:Int = 0;
	
	public var direction:Int;
	public var directions:Array<Int> = [0, 90, 180, 270];

	public function new(?X:Float=0, ?Y:Float=0, ?WorldPost:FlxPoint) 
	{
		super(X, Y);
		
		// Graphic
		makeGraphic(35, 35, FlxColor.TRANSPARENT, true);
		this.drawTriangle(this.x, this.y, this.height, FlxColor.TRANSPARENT, lineStyle, drawStyle);
		recenter(WorldPost);
		
		// Direction
		initFacing();
	}
	
	private function recenter(?post:FlxPoint)
	{
		centerOrigin();
		this.setPosition(post.x, post.y);
	}
	
	private function initFacing()
	{
		direction = Random.fromArray(directions);
		set_facing(direction);
	}
	
	private function handleInput()
	{
		if (FlxG.keys.justPressed.RIGHT)
		{
			FlxTween.angle(this, direction, direction + 90, 0.2);
			direction += 90;
		} else if (FlxG.keys.justPressed.LEFT)
		{
			FlxTween.angle(this, direction, direction - 90, 0.2);
			direction -= 90;			
		}
		
		//this.angle = direction;
	}
	
	private function movement()
	{
		this.angle = direction;
	}
	
	override public function update(elapsed:Float):Void
	{
		handleInput();
		super.update(elapsed);
	}
	
	
	
}