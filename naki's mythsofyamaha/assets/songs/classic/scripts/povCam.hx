// import flixel.addons.display.FlxBackdrop;

// public var camPov:HudCamera;

// public var camPlus:HudCamera;

// final fishLens = new CustomShader('fisheye');

// function postCreate() {

//     FlxG.cameras.remove(camHUD,false);
//     FlxG.cameras.add(camPov = new HudCamera(), false).bgColor = 0;
//     FlxG.cameras.add(camPlus = new HudCamera(), false).bgColor = 0;
//     FlxG.cameras.add(camHUD, false).bgColor = 0;
    

//     add(scrollers = new FlxBackdrop(null, FlxAxes.XY, 10, 10));
//     scrollers.makeGraphic(640,360);
// 	scrollers.velocity.set(90,90);
//     // scrollers.camera = camPov;
//     scrollers.shader = new CustomShader("camSprite");
//     fishLens.MAX_POWER = 0.2;
// 	camPov.addShader(fishLens);
// }

// function update(e) {

//     for (cam in [camPlus]){
//         cam.scroll.x = camGame.scroll.x;
//         cam.scroll.y = camGame.scroll.y;
//         cam.zoom = camGame.zoom;
//     }

//     camGame.canvas.__cacheAsBitmap = true;
//     if (camGame.canvas.__cacheBitmapRenderer != null){		
//         scrollers.shader.screenBitmap = camGame.canvas.__cacheBitmap.bitmapData;
//         scrollers.shader.zoom = camGame.zoom;
//         scrollers.shader.width = camGame.canvas.__cacheBitmap.bitmapData.width;
//         scrollers.shader.height = camGame.canvas.__cacheBitmap.bitmapData.height;
//         scrollers.shader.scrollx = camGame.scroll.x;
//         scrollers.shader.scrolly = camGame.scroll.y;
//         scrollers.shader.scale = FlxG.scaleMode.scale.x > FlxG.scaleMode.scale.y ? FlxG.scaleMode.scale.x : FlxG.scaleMode.scale.y;
//     }
// }
