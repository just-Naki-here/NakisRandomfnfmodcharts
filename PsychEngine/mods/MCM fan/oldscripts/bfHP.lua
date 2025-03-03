function goodNoteHit(id, noteData, direction, noteType, isSustainNote)
if not isSustainNote then
setProperty('health', getProperty('health')+ 0.035);
end
end 