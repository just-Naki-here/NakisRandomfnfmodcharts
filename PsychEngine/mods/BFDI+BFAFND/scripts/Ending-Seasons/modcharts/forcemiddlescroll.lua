
-- ==================================
-- Force Middle Scroll (For Chart Modding)
-- Moves the Player Strums to the Middle
-- ==================================


function onCreatePost()
    if not middleScroll then
        setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0 - 320);
        setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1 - 320);
        setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2 - 320);
        setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3 - 320);
	end
end