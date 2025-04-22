
import flixel.addons.display.FlxBackdrop;

var tranDur:Float = .35;
public var altTrans:Bool;
function create() {
	if(!nextFrameSkip)
	{

		transitionTween.cancel();
		var out = newState != null;
		
		remove(blackSpr);
		remove(transitionSprite);


		altTrans = FlxG.save.data.moyTransitionType;

		if (altTrans){
			add(up = new FlxBackdrop(Paths.image("menus/extras/Spikey"),FlxAxes.X, 0, 0));
			add(down = new FlxBackdrop(Paths.image("menus/extras/Spikey"),FlxAxes.X, 0, 0));

			up.flipY = true;
			up.velocity.x = -200;
			up.y = -600;

			down.velocity.x = 200;
			down.y = 1400;


			if(out){
				// for (thin in [up,down]) thin.alpha = 0;

				FlxTween.tween(up,{y: -280},tranDur,{ease: FlxEase.circInOut});
				FlxTween.tween(down,{y: 1060},tranDur,{ease: FlxEase.circInOut,onComplete:
					function(t:FlxTween) {
						done();
					}
				});
			} else {
				// for (thin in [up,down]) thin.alpha = 1;
				up.y = -280;
				down.y = 1060;

				FlxTween.tween(up,{y: -680},tranDur,{ease: FlxEase.circInOut});

				FlxTween.tween(down,{y: 1400},tranDur,{ease: FlxEase.circInOut, onComplete:
					function(t:FlxTween) {
						done();
					}
				});
			}

		} else {
			add(left = new FlxSprite(-779).loadGraphic(Paths.image("trans/left")));
			add(right = new FlxSprite(1280).loadGraphic(Paths.image("trans/right")));
	
			add(middle = new FlxSprite().loadGraphic(Paths.image("trans/middle")));
			middle.screenCenter();
	
			if(out){
				left.x = -779;
				right.x = 1280;
				middle.alpha = 0;
				middle.y -= 100;
	
				FlxTween.tween(middle,{alpha: 1,y: middle.y + 100},tranDur);
				FlxTween.tween(left,{x: 0},tranDur);
	
				FlxTween.tween(right,{x: 500},tranDur,{onComplete:
					function(t:FlxTween) {
						done();
					}
				});
	
			} else {
				left.x = 0;
				right.x = 500;
				middle.alpha = 1;
				middle.screenCenter();
	
				for (each in [left,right,middle]){
					each.flipY = true;
				}
	
				FlxTween.tween(middle,{alpha: 0,y: middle.y + 100},tranDur);
	
				FlxTween.tween(left,{x: -779},tranDur,{ease: FlxEase.circIn});
				
				FlxTween.tween(right,{x: 1280},tranDur,{ease: FlxEase.circIn,onComplete:
					function(t:FlxTween) {
						done();
					}
				});
			}
			transitionCamera.scroll.y = 0;
		}

		FlxG.sound.play(Paths.sound("menu/Transition" + (out ? 'Out' : 'In')));
	}
	else
	{
		done();
	}
}

function done()
{
	if (newState != null)
		FlxG.switchState(newState);

	new FlxTimer().start(1.2, ()-> {
		if (altTrans)
			for (item in [up,down]){
				FlxTween.tween(item,{alpha: 0},1.2,{onComplete: function (twn:FlxTween) {
					close();
				}});
			}
		else
			close();
		
	});
}