function onCreatePost()
    if not middleScroll then
        setPropertyFromGroup('playerStrums', 4, 'x', defaultPlayerStrumX0 - 320);
        setPropertyFromGroup('playerStrums', 5, 'x', defaultPlayerStrumX1 - 320);
        setPropertyFromGroup('playerStrums', 6, 'x', defaultPlayerStrumX2 - 320);
        setPropertyFromGroup('playerStrums', 7, 'x', defaultPlayerStrumX3 - 320);
    end
    if middleScroll then
        setPropertyFromGroup('playerStrums', 4, 'x', defaultPlayerStrumX0 - 320);
        setPropertyFromGroup('playerStrums', 5, 'x', defaultPlayerStrumX1 - 320);
        setPropertyFromGroup('playerStrums', 6, 'x', defaultPlayerStrumX2 - 320);
        setPropertyFromGroup('playerStrums', 7, 'x', defaultPlayerStrumX3 - 320);
    end
end