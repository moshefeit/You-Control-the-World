package;

/**
 * ...
 * @author Moshe Feit
 */
class Gameplay
{
	public var isPlaying:Bool = false;
	
	public function new() 
	{
		isPlaying = false;
	}
	
	public function playStatus():Bool
	{
		return isPlaying;
	}
	
}