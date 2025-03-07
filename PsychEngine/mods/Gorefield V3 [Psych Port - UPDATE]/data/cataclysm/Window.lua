local scaleX = 1
local scaleY = 1
local PosX = 0
local PosY = 0
local AdPosX = 0
local AdPosY = 0

function onCreatePost()

	makeLuaSprite('SpriteMovement', 'a',PosX ,PosY); --640, 360
	setScrollFactor('SpriteMovement', 1, 1);
    addLuaSprite('SpriteMovement', false);
    scaleObject('SpriteMovement', 1, 1, true);
    setObjectCamera("SpriteMovement", 'hud');
	setProperty("SpriteMovement.alpha", 0)


	luaDebugMode = true
	print(getPropertyFromClass("openfl.Lib", "application.window.display.bounds.width"), getPropertyFromClass("openfl.Lib", "application.window.display.bounds.height"))
	setPropertyFromClass("openfl.Lib", "application.window.borderless", true)
	setPropertyFromClass("Main", "fpsVar.visible", false)
	defaultBounds = {x = getPropertyFromClass("openfl.Lib", "application.window.x"), y = getPropertyFromClass("openfl.Lib", "application.window.y"), width = getPropertyFromClass("openfl.Lib", "application.window.width"), height = getPropertyFromClass("openfl.Lib", "application.window.height")}
	setPropertyFromClass("openfl.Lib", "application.window.x", 0)
	setPropertyFromClass("openfl.Lib", "application.window.y", 0)
	setPropertyFromClass("openfl.Lib", "application.window.width", getPropertyFromClass("openfl.Lib", "application.window.display.bounds.width") + 1)
	setPropertyFromClass("openfl.Lib", "application.window.height", getPropertyFromClass("openfl.Lib", "application.window.display.bounds.height") + 1)
	setPropertyFromClass("flixel.FlxG", "game.scaleX", scaleX)
	setPropertyFromClass("flixel.FlxG", "game.scaleY", scaleY)
	setPropertyFromClass("flixel.FlxG", "stage.color", 0x151515)
	setWindowColor(0x00151515)
end

function onUpdate(elapsed)
	setPropertyFromClass("openfl.Lib", "application.window.fullscreen", false)
	print(getProperty("camGame.width"))
	setPropertyFromClass("flixel.FlxG", "game.x", getPropertyFromClass("openfl.Lib", "application.window.display.bounds.width") * getPropertyFromClass("flixel.FlxG", "game.scaleX") / 2)
	setPropertyFromClass("flixel.FlxG", "game.y", getPropertyFromClass("openfl.Lib", "application.window.display.bounds.height") * getPropertyFromClass("flixel.FlxG", "game.scaleY") / 2)
	setPropertyFromClass("flixel.FlxG", "game.x", getProperty("SpriteMovement.x") / 2)
	setPropertyFromClass("flixel.FlxG", "game.y", getProperty("SpriteMovement.y") / 2)
	setProperty("camGame.angle", getProperty("SpriteMovement.angle"))
	setProperty("camHUD.angle", getProperty("SpriteMovement.angle"))
	setProperty("camOther.angle", getProperty("SpriteMovement.angle"))
	setPropertyFromClass("flixel.FlxG", "game.scaleX", scaleX)
	setPropertyFromClass("flixel.FlxG", "game.scaleY", scaleY)
	setProperty("camGame.angle", getProperty("camGame.angle") + 1)
	setProperty("camHUD.angle", getProperty("camHUD.angle") + 1)
	setProperty("camOther.angle", getProperty("camOther.angle") + 1)
	scaleX = getProperty("SpriteMovement.scale.x")
	scaleY = getProperty("SpriteMovement.scale.y")
	PosX = AdPosX + (getProperty("SpriteMovement.x") / scaleX)
	PosY = AdPosY + (getProperty("SpriteMovement.y") / scaleY)
end

local movementtype = 0

--beat timing
local x = 0
local y = 0
local count = 0
local posx2 = 0
local posy2 = 0

function onUpdatePost(elapsed)
	if movementtype == 3 then
		count = (count + 1)
        posx2 = (450*math.sin(count/72))
        posy2 = (250*math.sin(count/60))
 
		setProperty("SpriteMovement.x", posx2 +640)
		setProperty("SpriteMovement.y", posy2 +360)
	end
	if movementtype == 4 then
		count = (count + 1)
        posx2 = (450*math.sin(count/84))
        posy2 = (250*math.sin(count/72))
 
		setProperty("SpriteMovement.x", posx2 +640)
		setProperty("SpriteMovement.y", posy2 +360)
	end
	if movementtype == 5 then
		count = (count + 1)
        posx2 = (450*math.sin(count/84))
        posy2 = (250*math.sin(count/72))
 
		setProperty("SpriteMovement.x", posx2 +512)
		setProperty("SpriteMovement.y", posy2 +288)
	end
end


function onDestroy()
	setPropertyFromClass("openfl.Lib", "application.window.fullscreen", false)
	setPropertyFromClass("openfl.Lib", "application.window.borderless", false)
	setPropertyFromClass("Main", "fpsVar.visible", getPropertyFromClass("ClientPrefs", "showFPS"))
	setPropertyFromClass("openfl.Lib", "application.window.x", defaultBounds.x)
	setPropertyFromClass("openfl.Lib", "application.window.y", defaultBounds.y)
	setPropertyFromClass("openfl.Lib", "application.window.width", defaultBounds.width)
	setPropertyFromClass("openfl.Lib", "application.window.height", defaultBounds.height)
	setPropertyFromClass("flixel.FlxG", "game.scaleX", 1)
	setPropertyFromClass("flixel.FlxG", "game.scaleY", 1)
	setPropertyFromClass("flixel.FlxG", "game.x", 0)
	setPropertyFromClass("flixel.FlxG", "game.y", 0)
	setPropertyFromClass("flixel.FlxG", "stage.color", 0x000000)

	setWindowAlpha(255)
end

function onGameOver()
	setPropertyFromClass("openfl.Lib", "application.window.fullscreen", false)
	setPropertyFromClass("openfl.Lib", "application.window.borderless", false)
	setPropertyFromClass("Main", "fpsVar.visible", getPropertyFromClass("ClientPrefs", "showFPS"))
	setPropertyFromClass("openfl.Lib", "application.window.x", defaultBounds.x)
	setPropertyFromClass("openfl.Lib", "application.window.y", defaultBounds.y)
	setPropertyFromClass("openfl.Lib", "application.window.width", defaultBounds.width)
	setPropertyFromClass("openfl.Lib", "application.window.height", defaultBounds.height)
	setPropertyFromClass("flixel.FlxG", "game.scaleX", 1)
	setPropertyFromClass("flixel.FlxG", "game.scaleY", 1)
	setPropertyFromClass("flixel.FlxG", "game.x", 0)
	setPropertyFromClass("flixel.FlxG", "game.y", 0)
	setPropertyFromClass("flixel.FlxG", "stage.color", 0x000000)

	setWindowAlpha(255)
end

ffi = require "ffi"

ffi.cdef [[
    typedef int BOOL;
    typedef int BYTE;
    typedef int LONG;
    typedef LONG DWORD;
    typedef DWORD COLORREF;
    typedef unsigned long HANDLE;
    typedef HANDLE HWND;
    typedef int bInvert;
        
        HWND GetActiveWindow(void);
        
        LONG SetWindowLongA(HWND hWnd, int nIndex, LONG dwNewLong);
        
    HWND SetLayeredWindowAttributes(HWND hwnd, COLORREF crKey, BYTE bAlpha, DWORD dwFlags);
        
        DWORD GetLastError();
]]
function onCreate()
    setTransparency(110010000000000011111111) --info about colors in C https://learn.microsoft.com/en-us/windows/win32/gdi/colorref
end
function setWindowColor(color)
	color = color or 0
    local hwnd = ffi.C.GetActiveWindow()
    
    if ffi.C.SetWindowLongA(hwnd, -20, 0x00080000) ~= 0 then
		ffi.C.SetLayeredWindowAttributes(hwnd, color, 0, 0x00000001)
    end
end
function setWindowAlpha(alpha)
    local hwnd = ffi.C.GetActiveWindow()
    
    if ffi.C.SetWindowLongA(hwnd, -20, 0x00080000) ~= 0 then
		ffi.C.SetLayeredWindowAttributes(hwnd, 0, alpha, 0x00000002)
    end
end