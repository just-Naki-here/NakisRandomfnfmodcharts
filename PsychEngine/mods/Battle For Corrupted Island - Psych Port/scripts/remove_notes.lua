function onCreatePost()
    for i = 0,3 do
        setPropertyFromClass('ClientPrefs', 'middleScroll', true)
        noteTweenX('byeOppNotes'..i, i, -9990, 0.001, 'linear')
    end
end