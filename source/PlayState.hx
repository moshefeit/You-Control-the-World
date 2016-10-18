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
	private var position:Array<FlxPoint>;
	
	public var isPlaying:Bool = false;
	public var gameplay:Gameplay;
	
	override public function create():Void
	{
		super.create();
		
		var position = [new FlxPoint(0 + FlxG.width * 0.2 - 17.5, 0 + FlxG.height * 0.2 - 17.5),
						new FlxPoint(0 + FlxG.width * 0.2 - 17.5, FlxG.height - FlxG.height * 0.2 - 17.5),
						new FlxPoint(FlxG.width - FlxG.width * 0.2 - 17.5, FlxG.height - FlxG.height * 0.2 - 17.5),
						new FlxPoint(FlxG.width - FlxG.width * 0.2 - 17.5, 0 + FlxG.height * 0.2 - 17.5)];
						
		/* var canvas = new FlxSprite();
		 * canvas.makeGraphic(FlxG.width, FlxG.height, FlxColor.TRANSPARENT, true);
		 * canvas.drawPolygon(position, FlxColor.WHITE);
		 * add(canvas);* 
		 **/
		
		 gameplay = new Gameplay();
						
		for (coordinate in position)
		{
			pioneer = new Pioneer(0, 0, coordinate);
			add(pioneer);
		}
	
	}
	
	public function playStatus():Bool
	{
		return gameplay.isPlaying;
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
