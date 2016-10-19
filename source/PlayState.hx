package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.math.FlxPoint;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

using flixel.util.FlxSpriteUtil;

class PlayState extends FlxState
{
	private var pioneer:Pioneer;
	private var pioneers:Array<Pioneer> = [];
	
	public static var ball:Ball;
	
	private var position:Array<FlxPoint>;
	private var startPoint:Pioneer;
	
	public static var isPlaying:Bool = false;
	
	private var midpoints:Array<FlxPoint> = [];
	
	override public function create():Void
	{
		super.create();
		
		var position = [new FlxPoint(0 + FlxG.width * 0.2 - 17.5, FlxG.height - FlxG.height * 0.2 - 17.5),
						new FlxPoint(FlxG.width - FlxG.width * 0.2 - 17.5, FlxG.height - FlxG.height * 0.2 - 17.5),
						new FlxPoint(FlxG.width - FlxG.width * 0.2 - 17.5, 0 + FlxG.height * 0.2 - 17.5)];
						
		
		
		startPoint = new Pioneer(0, 0, new FlxPoint(0 + FlxG.width * 0.2 - 17.5, 0 + FlxG.height * 0.2 - 17.5));
		startPoint.initFacing(Random.fromArray([180, 90]));
		add(startPoint);
		
		pioneers.insert(pioneers.length, startPoint);		
		
		ball = new Ball(0, 0, startPoint.getMidpoint());
		add(ball);
		
		for (coordinate in position)
		{
			pioneer = new Pioneer(0, 0, coordinate);
			add(pioneer);
			pioneers.insert(pioneers.length, pioneer);
		}	
	}

	override public function update(elapsed:Float):Void
	{
		if (FlxG.keys.justPressed.SPACE)
		{
			if (isPlaying == false)
			{
				isPlaying = true;
			}			
		}
		
		trace(ball.getMidpoint());
		
		for (pioneer in pioneers)
		{
			if (ball.overlapsPoint(pioneer.getMidpoint()))
			{
				ball.changeDirection(pioneer);
			}
		}
		
		super.update(elapsed);
	}
}
