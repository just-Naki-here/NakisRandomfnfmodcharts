
centerXO = getPropertyFromClass("openfl.Lib", "application.window.x")
centerYO = getPropertyFromClass("openfl.Lib", "application.window.y")
randomNumberX = math.random(getPropertyFromClass("openfl.Lib", "application.window.x") - 5, getPropertyFromClass("openfl.Lib", "application.window.x") + 5)
randomNumberY = math.random(getPropertyFromClass("openfl.Lib", "application.window.y") - 5, getPropertyFromClass("openfl.Lib", "application.window.y") + 5)

randomNumberXCHAOS = math.random(getPropertyFromClass("openfl.Lib", "application.window.x") - 50, getPropertyFromClass("openfl.Lib", "application.window.x") + 50)
randomNumberYCHAOS = math.random(getPropertyFromClass("openfl.Lib", "application.window.y") - 50, getPropertyFromClass("openfl.Lib", "application.window.y") + 50)

randomNumberXHELL = math.random(getPropertyFromClass("openfl.Lib", "application.window.x") - 100, getPropertyFromClass("openfl.Lib", "application.window.x") + 100)
randomNumberYHELL = math.random(getPropertyFromClass("openfl.Lib", "application.window.y") - 100, getPropertyFromClass("openfl.Lib", "application.window.y") + 100)
function noteMiss(id, direction, noteType, isSustainNote)
 setPropertyFromClass("openfl.Lib", "application.window.x", centerXO)
 setPropertyFromClass("openfl.Lib", "application.window.y", centerYO)
 randomNumberXHELL = math.random(getPropertyFromClass("openfl.Lib", "application.window.x") - 100, getPropertyFromClass("openfl.Lib", "application.window.x") + 100)
 randomNumberYHELL = math.random(getPropertyFromClass("openfl.Lib", "application.window.y") - 100, getPropertyFromClass("openfl.Lib", "application.window.y") + 100)
 setPropertyFromClass("openfl.Lib", "application.window.x", randomNumberXHELL) 
 setPropertyFromClass("openfl.Lib", "application.window.y", randomNumberYHELL)
 setPropertyFromClass("openfl.Lib", "application.window.x", centerXO)
 setPropertyFromClass("openfl.Lib", "application.window.y", centerYO)
end

function goodNoteHit(id, direction, noteType, isSustainNote)
 randomNumberX = math.random(getPropertyFromClass("openfl.Lib", "application.window.x") - 5, getPropertyFromClass("openfl.Lib", "application.window.x") + 5)
 randomNumberY = math.random(getPropertyFromClass("openfl.Lib", "application.window.y") -5, getPropertyFromClass("openfl.Lib", "application.window.y") + 5)
 setPropertyFromClass("openfl.Lib", "application.window.x", randomNumberX) 
 setPropertyFromClass("openfl.Lib", "application.window.y", randomNumberY)
 setPropertyFromClass("openfl.Lib", "application.window.x", centerXO)
 setPropertyFromClass("openfl.Lib", "application.window.y", centerYO)
end
