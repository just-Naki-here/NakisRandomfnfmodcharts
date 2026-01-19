local strumXUtil = {
    [0] = {-1, 2},
    [1] = {-1, 1},
    [2] = {1, 0},
    [3] = {1, 1}

}
local babyArrows = {
    [0] = 'LEFT',
    [1] = 'DOWN',
    [2] = 'UP',
    [3] = 'RIGHT'
};
function onUpdatePost(elapsed)
    for i = 0, getProperty('notes.length') - 1 do
        if getPropertyFromGroup('notes', i, 'gfNote') then
            if getPropertyFromGroup('notes', i, 'isSustainNote') then
                setPropertyFromGroup('notes', i, 'x', 
                getProperty('babyArrow'..(4 + getPropertyFromGroup('notes', i, 'noteData'))..'.x') + (getProperty('babyArrow'..(4 + getPropertyFromGroup('notes', i, 'noteData'))..'.width') / 2 - 16)
            );
            else
                setPropertyFromGroup('notes', i, 'x', getProperty('babyArrow'..(4 + getPropertyFromGroup('notes', i, 'noteData'))..'.x'));
            end
        end
    end

    for i = 0, 3 do
        setProperty('babyArrow'..i..'.x', getPropertyFromGroup('strumLineNotes', i, 'x'));
        setProperty('babyArrow'..i..'.y', getPropertyFromGroup('strumLineNotes', i, 'y'));
        setProperty('babyArrow'..i..'.alpha', getPropertyFromGroup('strumLineNotes', i, 'alpha'));
        setProperty('babyArrow'..i..'.width', getPropertyFromGroup('strumLineNotes', i, 'width'));
        setProperty('babyArrow'..i..'.height', getPropertyFromGroup('strumLineNotes', i, 'height'));
        setProperty('babyArrow'..i..'.angle', getPropertyFromGroup('strumLineNotes', i, 'angle'));
    end
end
function onCreatePost()
    generateStaticArrows('player2');
    generateStaticArrows('player3');
end

function onEvent(name, v1, v2)
    if name == "ToggleGFStrums" then
        toggleGFStrums();
    end
end

function toggleGFStrums()
    for i = 0, getProperty('strumLineNotes.length') - 1 do
        if i < 4 then
            doTweenX('babyArrow'..(i + 4), 'babyArrow'..(i + 4), 15 + ((155 * 0.65) * i), 1, 'quadInOut');
            noteTweenX('note'..i, i, (screenWidth / 2) + (strumXUtil[i][1] * ((155 * 0.65) * strumXUtil[i][2])), 1, 'quadInOut');
        elseif i > 3 then
            noteTweenX('note'..i, i, (screenWidth - 15) - ((155 * 0.65) * (8 - i)), 1, 'quadInOut');
        end 
    end
end

function generateStaticArrows(player)
    for i= 0, 7 do
        if isPixelStage then
            makeAnimatedLuaSprite('babyArrow'..i, 'pixelUI/NOTE_assets', 0, defaultPlayerStrumY0);
        else
            makeAnimatedLuaSprite('babyArrow'..i, 'NOTE_assets', 0, defaultPlayerStrumY0);
        end
        setProperty('babyArrow'..i..'.x', ((i % 4) * 155 * 0.65));
        addAnimationByPrefix('babyArrow'..i, 'static', 'arrow'..babyArrows[i % 4], 24, false);
        addAnimationByPrefix('babyArrow'..i, 'pressed', string.lower(babyArrows[i % 4])..' press', 24, false);
        addAnimationByPrefix('babyArrow'..i, 'confirm', string.lower(babyArrows[i % 4])..' confirm', 24, false);
    
        setObjectCamera('babyArrow'..i, 'hud');
        addLuaSprite('babyArrow'..i, false);
        setGraphicSize('babyArrow'..i, getPropertyFromGroup('strumLineNotes', i, 'width'), getPropertyFromGroup('strumLineNotes', i, 'height'));
    
        updateHitbox('babyArrow'..i);
        objectPlayAnimation('babyArrow'..i, 'static');
        setProperty('babyArrow'..i..'.x', getProperty('babyArrow'..i..'.x') + (((screenWidth / 4) * -1) - ( getProperty('babyArrow'..i..'.width') * 2)));
        if i < 4 then
            setPropertyFromGroup('strumLineNotes', i, 'visible', false);
        end
    end
end