function goodNoteHit(id, direction, noteType, isSustainNote)
    randomNumberX=math.random(100,250)
    randomNumberY=math.random(100,250)
    setPropertyFromClass("openfl.Lib", "application.window.x", randomNumberX) 
    setPropertyFromClass("openfl.Lib", "application.window.y", randomNumberY)
end