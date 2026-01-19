characterPath = 'characters/jon' -- Picture File name of spreadsheet (must have .xml)
characterTag = 'jon_alter' -- Set this to what the sprite should be named.

noteNames = {
    'NONE', -- Change this to whatever your note is named in path "custom_notetypes".
    '3rd Player ALT', -- Change this to whatever your note is named in path "custom_notetypes". (ALT)
}

isDanceIdle = true -- If false, character sprite will use animation 'danceLeft' and 'danceRight'
flipX = false -- If true, flips character.
objectOrder = 9 -- Normally, values over 7 go over GF (7), Dad (8) and BF (9). (Default: 9)
haveMissAnimations = true -- If true, it will add the miss animations for the character sprite to use.
singAnimationLength = 4 -- How many steps until it goes back to idle.
danceEveryNumBeats = 2 -- Sets which per beat will the character dance on.
gfSpeed = 1 -- How many beats until danceLeft and danceRight dances. (If isDanceIdle is false.)
characterFPS = 24 -- Default is 24, how many frames should the animation play?
skipDance = false -- If true, it skips (stops) the dance on beat for the sprite.

extraSection = false -- If true, camera will point to what is put in characterCamera offset positions.
teamplaySettings = {
    enabled = false, -- If true, the extra character will sing along with the main character(s).

    sideDependent = false -- If true, extra character will sing depending on which side they are on. (If flipX is true, it will sing with opponent. Vice Versa.)
}
animSuffix = '' -- If this variable is set as '-alt', it will play alt animations. (Animation suffixes)

antialiasing = true -- If true, it will use antialiasing for the sprite which makes it more detailed.

idleSuffix = '' -- Change this to either have alternative idle animations if you have them added in the animations list.
heyTimer = 0 -- How long should an animation last for. (specialAnim must be true for it to work!)
specialAnim = false -- Is the animation different from the other animations? (Special)

local precacheImages = true -- Should you precache images from "Extr. Char Change" events to make character switching faster? (Could increase memory usage!)

--[[ Animation Data EXPLANATION

['idle'] = Animation name
{'BF idle dance'} = Animation Prefix
{0, 0} = Animation Offset X and Y
{''} = Animation Indices (0, 1, 2, 3)
{false/true} = Looping?

--]]
animationData = {
    ['danceLeft'] = {'JON IDLE 1', -89, -58, '', true},

    ['danceRight'] = {'JON IDLE 1', -89, -58, '', true},


}

singAnimations = {
    'singLEFT', -- Left
    'singDOWN', -- Down
    'singUP', -- Up
    'singRIGHT' -- Right
}

characterPos = {
    750, -- X of character
    352 -- Y of character
}

characterCamera = {
    0, -- X (Offset) for the camera to be targetting when it is extra character's turn.
    -550 -- Y (Offset) for the camera to be targetting when it is extra character's turn.
}

characterScales = {
    1, -- Scale X of character
    1 -- Scale Y of character
}

local noteFileCreation = false -- Creates note files incase note files for the character doesn't exist. Won't delete if exiting a song/state.
function createCharacter(tag)
    for notes = 1, #noteNames do
        if not checkFileExists(currentModDirectory .. '/custom_notetypes/' .. noteNames[notes] .. '.lua') and checkFileExists(currentModDirectory .. stringSplit(scriptName, 'mods/')[2]) and noteFileCreation then
            saveFile(currentModDirectory .. '/custom_notetypes/' .. noteNames[notes] .. '.lua', '')
        elseif not checkFileExists('custom_notetypes/' .. noteNames[notes] .. '.lua') and not checkFileExists(stringSplit(scriptName, 'mods/')[2]) and noteFileCreation then
            saveFile('/custom_notetypes/' .. noteNames[notes] .. '.lua', '')
        end
    end

    makeAnimatedLuaSprite(tag, characterPath, characterPos[1], characterPos[2]);

    for i, v in pairs(animationData) do
        if stringTrim(v[4]) == '' or not v[4] then
            addAnimationByPrefix(tag, i, v[1], characterFPS, v[5]);
        elseif v[4] and not v[5] then -- else'em
            addAnimationByIndices(tag, i, v[1], v[4], characterFPS);
        elseif v[4] and v[5] then -- else'em
            addAnimationByIndicesLoop(tag, i, v[1], v[4], characterFPS);
        end

        addOffset(tag, i, v[2], v[3]);
    end

    setProperty(tag .. '.flipX', flipX);
    setProperty(tag .. '.antialiasing', antialiasing)
    scaleObject(tag, characterScales[1], characterScales[2]);

    setObjectOrder(tag, objectOrder);

    addLuaSprite(tag, false); -- Set this to true if you want it to be in front of other sprites. (You can also use object order to set where the sprite should overlap.)

    dance() -- Fix character playing a random animation & offset on character creation.
end

function onCreate()
    luaDeprecatedWarnings = false
    luaDebugMode = true

    createCharacter(characterTag);
end

function onCreatePost()
    if precacheImages then
        for i = 0, getProperty('eventNotes.length')-1 do
            if getPropertyFromGroup('eventNotes', i, 'event') == 'Extr. Char Change' then
                local charV2 = stringSplit(getPropertyFromGroup('eventNotes', i, 'value2'), ', ')
                local nextCharacter = jparse(getTextFromFile('characters/' .. charV2[1] .. '.json'), 1, '[') --surely this wont cause an issue!!! (performance wise, idk)
                precacheImage(nextCharacter.image) --massive amounts of precaching could lead to high memory usage.
            end
        end
    end
end

function onSpawnNote(membersIndex, noteData, noteType, isSustainNote)
    for names = 1, #noteNames do
        if noteType == noteNames[names] then
            setPropertyFromGroup('unspawnNotes', membersIndex, 'noAnimation', true); -- Make it so original character doesn't sing these notes
            setPropertyFromGroup('unspawnNotes', membersIndex, 'noMissAnimation', true); -- Make it so original character doesn't miss (0.7.1h - for some reason, it just ignores this)
        end
    end
end

holdTimer = 0 -- For onUpdate.

danced = false -- Has the character danced for GF?

function onBeatHit()
    if isDanceIdle then
        if curBeat % danceEveryNumBeats == 0 and not skipDance and not stringStartsWith(getProperty(characterTag .. '.animation.curAnim.name'), 'sing') then
            dance()
            --holdTimer = 0
        end

    elseif not isDanceIdle then -- I did this differently than in Psych Engine. However, this works!
        if danced and not skipDance and curBeat % gfSpeed == 0 and not stringStartsWith(getProperty(characterTag .. '.animation.curAnim.name'), 'sing') then -- no stepCrochet?
            dance()
            --holdTimer = 0

        elseif not danced and not skipDance and curBeat % gfSpeed == 0 and not stringStartsWith(getProperty(characterTag .. '.animation.curAnim.name'), 'sing') then -- no stepCrochet?
            dance()
            --holdTimer = 0
        end
    end
end

function onUpdate(elapsed)
    if stringStartsWith(getProperty(characterTag .. '.animation.curAnim.name'), 'sing') then
        holdTimer = holdTimer + elapsed
    end

    if flipX then 
        if holdTimer >= stepCrochet * (0.0011 / getPropertyFromClass('flixel.FlxG', 'sound.music.pitch')) * singAnimationLength then
            dance()
            holdTimer = 0
        end

    else
        if holdTimer > stepCrochet * (0.0011 / getPropertyFromClass('flixel.FlxG', 'sound.music.pitch')) * singAnimationLength and stringStartsWith(getProperty(characterTag .. '.animation.curAnim.name'), 'sing') and not stringEndsWith(getProperty(characterTag .. '.animation.curAnim.name'), 'miss') then
            dance()
        end
    end

    if stringEndsWith(getProperty(characterTag .. '.animation.curAnim.name'), 'miss') and getProperty(characterTag .. '.animation.curAnim.finished') then
        if stringStartsWith(version, '0.6') then playAnim(characterTag, 'idle' .. idleSuffix, true, false, 10) elseif stringStartsWith(version, '0.7') then dance() playAnim(characterTag, 'idle' .. idleSuffix, true, false, getProperty(characterTag .. '.animation.curAnim.numFrames') - 1) end
    end

    if getProperty(characterTag .. '.animation.curAnim.finished') and stringEndsWith(getProperty(characterTag .. '.animation.curAnim.name'), '-loop') then
        playAnim(characterTag, getProperty(characterTag .. '.animation.curAnim.name') .. '-loop')
    end

    if specialAnim and heyTimer <= 0 then -- Automatically set 'heyTimer' to 0.6 if it plays one of these animations with specialAnim on. (Do I do this?)
        heyTimer = 0.6
    end

    if heyTimer > 0 then
        heyTimer = heyTimer - elapsed * playbackRate
        if heyTimer <= 0 then
            if specialAnim then
                specialAnim = false
                dance()
            end
            heyTimer = 0
        end
    elseif specialAnim and getProperty(characterTag .. '.animation.curAnim.finished') then
        specialAnim = false
        dance()
    end
end

function onMoveCamera(character)
    if extraSection then
        setProperty('camFollow.x', getMidpointX(characterTag) - 100 - characterCamera[1])
        setProperty('camFollow.y', getMidpointY(characterTag) - 100 + characterCamera[2])
    end
end

function onCountdownStarted()
    runTimer('startCharacterTimer', crochet / 1000 / playbackRate, 5) -- lol (will a loop of 5 be an issue?)
end

function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
    for notes = 1, #noteNames do
        if noteType == noteNames[notes] then
            animSuffix = ''
            playAnim(characterTag, singAnimations[noteData + 1] .. animSuffix, true);
            holdTimer = 0

        elseif noteType == noteNames[notes] and not isDanceIdle then
            --playAnim(characterTag, animNames[noteData + 2], true); -- uhhh is this needed?
            animSuffix = ''

            if getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[1] .. animSuffix then
                danced = true
            elseif getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[2] .. animSuffix then
                danced = false
            end

            if getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[3] .. animSuffix or getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[4] .. animSuffix then
                danced = not danced
            end
        end
    end

    if stringEndsWith(noteType:lower(), 'alt') then
        animSuffix = '-alt'
        playAnim(characterTag, singAnimations[noteData + 1] .. animSuffix, true);
        holdTimer = 0
    
    elseif stringEndsWith(noteType:lower(), 'alt') and not isDanceIdle then
        animSuffix = '-alt'
        if getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[1] .. animSuffix then
            danced = true
        elseif getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[2] .. animSuffix then
            danced = false
        end

        if getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[3] .. animSuffix or getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[4] .. animSuffix then
            danced = not danced
        end
    end

    for extraNotes = 3, #noteNames do -- 3? more like doing manual guessing!!! (hmmm, could this mess up with the normal 3rd player notes?)
        if noteType == noteNames[extraNotes] then
            animSuffix = ''
                        
            if noteNames[extraNotes]:find('-') then
                playAnim(characterTag, tostring(stringSplit(noteNames[extraNotes], '-')[2]), true);
                specialAnim = true
            else
                playAnim(characterTag, singAnimations[noteData + 1] .. animSuffix, true);
            end

            holdTimer = 0
        end
    end

    --Sort this better?
    if teamplaySettings.enabled then
        if teamplaySettings.sideDependent and (flipX or getProperty(characterTag .. '.flipX')) then
            if noteType == '' then -- Default Note (lol)
                animSuffix = ''
                playAnim(characterTag, singAnimations[noteData + 1] .. animSuffix, true);
                holdTimer = 0

                if not isDanceIdle then
                    animSuffix = ''
                    if getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[1] .. animSuffix then
                        danced = true
                    elseif getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[2] .. animSuffix then
                        danced = false
                    end
                end

                if getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[3] .. animSuffix or getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[4] .. animSuffix then
                    danced = not danced
                end
            elseif noteType == 'Alt Animation' then
                animSuffix = '-alt'
                playAnim(characterTag, singAnimations[noteData + 1] .. animSuffix, true);
                holdTimer = 0

                if not isDanceIdle then
                    animSuffix = '-alt'
                    if getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[1] .. animSuffix then
                        danced = true
                    elseif getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[2] .. animSuffix then
                        danced = false
                    end
                end

                if getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[3] .. animSuffix or getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[4] .. animSuffix then
                    danced = not danced
                end
            end
        elseif not teamplaySettings.sideDependent then --huh. (read todo at bottom of code)
            if noteType == '' then -- Default Note (lol)
                animSuffix = ''
                playAnim(characterTag, singAnimations[noteData + 1] .. animSuffix, true);
                holdTimer = 0

                if not isDanceIdle then
                    animSuffix = ''
                    if getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[1] .. animSuffix then
                        danced = true
                    elseif getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[2] .. animSuffix then
                        danced = false
                    end
                end

                if getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[3] .. animSuffix or getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[4] .. animSuffix then
                    danced = not danced
                end
            elseif noteType == 'Alt Animation' then
                animSuffix = '-alt'
                playAnim(characterTag, singAnimations[noteData + 1] .. animSuffix, true);
                holdTimer = 0

                if not isDanceIdle then
                    animSuffix = '-alt'
                    if getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[1] .. animSuffix then
                        danced = true
                    elseif getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[2] .. animSuffix then
                        danced = false
                    end
                end

                if getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[3] .. animSuffix or getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[4] .. animSuffix then
                    danced = not danced
                end
            end
        end
    end
end

function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
    for notes = 1, #noteNames do
        if noteType == noteNames[notes] then
            animSuffix = ''
            playAnim(characterTag, singAnimations[noteData + 1] .. animSuffix, true);
            holdTimer = 0

        elseif noteType == noteNames[notes] and not isDanceIdle then
            --playAnim(characterTag, animNames[noteData + 2], true); -- uhhh is this needed?
            animSuffix = ''

            if getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[1] .. animSuffix then
                danced = true
            elseif getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[2] .. animSuffix then
                danced = false
            end

            if getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[3] .. animSuffix or getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[4] .. animSuffix then
                danced = not danced
            end
        end
    end

    if stringEndsWith(noteType:lower(), 'alt') then
        animSuffix = '-alt'
        playAnim(characterTag, singAnimations[noteData + 1] .. animSuffix, true);
        holdTimer = 0
    
    elseif stringEndsWith(noteType:lower(), 'ALT') and not isDanceIdle then
        animSuffix = '-alt'
        if getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[1] .. animSuffix then
            danced = true
        elseif getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[2] .. animSuffix then
            danced = false
        end

        if getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[3] .. animSuffix or getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[4] .. animSuffix then
            danced = not danced
        end
    end

    for extraNotes = 3, #noteNames do -- 3? more like doing manual guessing!!! (hmmm, could this mess up with the normal 3rd player notes?)
        if noteType == noteNames[extraNotes] then
            animSuffix = ''

            if noteNames[extraNotes]:find('-') then
                playAnim(characterTag, tostring(stringSplit(noteNames[extraNotes], '-')[2]), true);
                specialAnim = true
            else
                playAnim(characterTag, singAnimations[noteData + 1] .. animSuffix, true);
            end

            holdTimer = 0
        end
    end

    --Sort this better?
    if teamplaySettings.enabled then
        if teamplaySettings.sideDependent and (not flipX or not getProperty(characterTag .. '.flipX')) then
            if noteType == '' then -- Default Note (lol)
                animSuffix = ''
                playAnim(characterTag, singAnimations[noteData + 1] .. animSuffix, true);
                holdTimer = 0

                if not isDanceIdle then
                    animSuffix = ''
                    if getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[1] .. animSuffix then
                        danced = true
                    elseif getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[2] .. animSuffix then
                        danced = false
                    end
                end

                if getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[3] .. animSuffix or getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[4] .. animSuffix then
                    danced = not danced
                end
            elseif noteType == 'Alt Animation' then
                animSuffix = '-alt'
                playAnim(characterTag, singAnimations[noteData + 1] .. animSuffix, true);
                holdTimer = 0

                if not isDanceIdle then
                    animSuffix = '-alt'
                    if getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[1] .. animSuffix then
                        danced = true
                    elseif getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[2] .. animSuffix then
                        danced = false
                    end
                end

                if getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[3] .. animSuffix or getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[4] .. animSuffix then
                    danced = not danced
                end
            end
        elseif not teamplaySettings.sideDependent then --huh. (read todo at bottom of code)
            if noteType == '' then -- Default Note (lol)
                animSuffix = ''
                playAnim(characterTag, singAnimations[noteData + 1] .. animSuffix, true);
                holdTimer = 0

                if not isDanceIdle then
                    animSuffix = ''
                    if getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[1] .. animSuffix then
                        danced = true
                    elseif getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[2] .. animSuffix then
                        danced = false
                    end
                end

                if getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[3] .. animSuffix or getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[4] .. animSuffix then
                    danced = not danced
                end
            elseif noteType == 'Alt Animation' then
                animSuffix = '-alt'
                playAnim(characterTag, singAnimations[noteData + 1] .. animSuffix, true);
                holdTimer = 0

                if not isDanceIdle then
                    animSuffix = '-alt'
                    if getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[1] .. animSuffix then
                        danced = true
                    elseif getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[2] .. animSuffix then
                        danced = false
                    end
                end

                if getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[3] .. animSuffix or getProperty(characterTag .. '.animation.curAnim.name') == singAnimations[4] .. animSuffix then
                    danced = not danced
                end
            end
        end
    end
end

function noteMiss(membersIndex, noteData, noteType, isSustainNote)
    if noteType == noteNames[1] and haveMissAnimations then
        playAnim(characterTag, singAnimations[noteData + 1] .. 'miss' .. animSuffix, true)
        --recalculateDanceIdle()
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'startCharacterTimer' then
        if isDanceIdle and luaSpriteExists(characterTag) and loopsLeft % danceEveryNumBeats == 0 and getProperty(characterTag .. '.animation.curAnim') and not stringStartsWith(getProperty(characterTag .. '.animation.curAnim.name'), 'sing') then
            dance()

        elseif not isDanceIdle and luaSpriteExists(characterTag) and loopsLeft % gfSpeed == 0 and getProperty(characterTag .. '.animation.curAnim') and not stringStartsWith(getProperty(characterTag .. '.animation.curAnim.name'), 'sing') then -- gfSpeed and not round(gfSpeed * danceEveryNumBeats)? lol
            dance()
        end
    end
end

function onEvent(eventName, value1, value2)
    if eventName == characterTag .. ' Idle ALT' or stringEndsWith(eventName, ' Idle ALT') then
        if value1 then
            idleSuffix = value1
        else
            idleSuffix = ''
        end
    end

    if eventName == characterTag .. ' Camera Section' or stringEndsWith(eventName, ' Camera Section') then
        if value1 == '1' then
            extraSection = true
        elseif value1 == '0' then
            extraSection = false
        end
    end

    if stringEndsWith(eventName, ' Teamplay') then --Rethink name check?
        if value1 == '1' then
            teamplaySettings.enabled = true
        elseif value1 == '0' then
            teamplaySettings.enabled = false
        end

        if value2 ~= '' then
            teamplaySettings.sideDependent = tonumber(value2)
        end
    end

    if eventName == 'Play Animation' then -- could be an issue if the default character if not specified is bf or whatever.
        if value2 == characterTag then
            playAnim(value2, value1, true) -- This won't check if the animation is a sing note. (because idk lol i could make it check)
            specialAnim = true
        end
    end

    if eventName == 'Extr. Char Change' then --this shit finna be real
        if value1 == characterTag then
            value2 = value2 or 'bf' --no flip x included
            local v2 = stringSplit(value2, ', ')
            animationData = jparse(getTextFromFile('characters/' .. v2[1] .. '.json'), 1, '[') -- Erase character data to replace with new character data (don't worry about not being in the same format)
            removeLuaSprite(characterTag, true)

            makeAnimatedLuaSprite(characterTag, animationData.image, characterPos[1] + animationData.position[1], characterPos[2] + (animationData.position[2] - 350));

            for i = 1, #animationData.animations do
                if not animationData.animations[i].indices[1] then
                    addAnimationByPrefix(characterTag, animationData.animations[i].anim, animationData.animations[i].name, animationData.animations[i].fps, animationData.animations[i].loop)
                elseif animationData.animations[i].indices[1] and not animationData.animations[i].loop then
                    addAnimationByIndices(characterTag, animationData.animations[i].anim, animationData.animations[i].name, table.concat(animationData.animations[i].indices, ','), animationData.animations[i].fps);
                elseif animationData.animations[i].indices[1] and animationData.animations[i].loop then
                    addAnimationByIndicesLoop(characterTag, animationData.animations[i].anim, animationData.animations[i].name, table.concat(animationData.animations[i].indices, ','), animationData.animations[i].fps);
                end

                if (animationData.animations[i].anim == 'danceLeft' .. idleSuffix and animationData.animations[i].anim == 'danceRight' .. idleSuffix) then
                    isDanceIdle = false
                elseif (animationData.animations[i].anim == 'idle' .. idleSuffix) then
                    isDanceIdle = true
                end

                addOffset(characterTag, animationData.animations[i].anim, animationData.animations[i].offsets[1], animationData.animations[i].offsets[2])
            end

            setProperty(characterTag .. '.flipX', not animationData.flip_x)
            setProperty(characterTag .. '.antialiasing', not animationData.no_antialiasing)
            singAnimationLength = animationData.sing_duration
            characterCamera = animationData.camera_position
            scaleObject(characterTag, animationData.scale, animationData.scale)
            addLuaSprite(characterTag, true)
            if v2[2] and (tonumber(v2[2]) > 0 or stringTrim(v2[2]) ~= '') then objectOrder = v2[2] setObjectOrder(characterTag, v2[2]) end
            debugPrint(value2)
            dance()
        end
    end
end

function eventEarlyTrigger(event)
    if stringEndsWith(event, ' Teamplay') then -- Should work properly? (seems to be needed since it doesn't work on the same step with notes.)
        return 10 -- In 0.7.1h, this is somehow not working? (could be the same in 0.6.3)
    end
end

local settingCharacterUp = true
function recalculateDanceIdle() -- Does settingCharacterUp & lastDance variable be needed for this? (Psych Engine does this but it seems to be fine without it? I don't know.)
    local lastDanceIdle = isDanceIdle
    isDanceIdle = (getProperty(characterTag .. '.animation.curAnim.name') == 'danceLeft' .. idleSuffix and getProperty(characterTag .. '.animation.curAnim.name') == 'danceRight' .. idleSuffix)

    if settingCharacterUp then
        danceEveryNumBeats = (isDanceIdle == 1 and 1 or 2) -- isDanceIdle == 1 or 2?
    elseif not lastDanceIdle == isDanceIdle then
        local danceEveryNumBeatsCalc = danceEveryNumBeats

        if not isDanceIdle then
            danceEveryNumBeatsCalc = danceEveryNumBeatsCalc / 2
        else
            danceEveryNumBeatsCalc = danceEveryNumBeatsCalc * 2
    
            danceEveryNumBeats = round(math.max(danceEveryNumBeatsCalc, 1)) 
            --debugPrint('Round handled: ' .. danceEveryNumBeats)
        end
        settingCharacterUp = false
    end
end

function dance()
    if not skipDance and not specialAnim then
        if not isDanceIdle then

            danced = not danced

            if danced then -- no stepCrochet?
                playAnim(characterTag, 'danceRight' .. idleSuffix, true);
                holdTimer = 0
    
            elseif not danced then -- no stepCrochet?
                playAnim(characterTag, 'danceLeft' .. idleSuffix, true);
                holdTimer = 0
            end

        elseif isDanceIdle then
            playAnim(characterTag, 'idle' .. idleSuffix, false);
        end
    end
end

-- http://lua-users.org/wiki/SimpleRound -- Second code.
function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

function setCharacterVar(variable, input)
    _G[variable] = input
end

function getCharacterVar(variable)
    return _G[variable]
end

--// JSON parser
local json = {}

local function kind_of(obj)
  if type(obj) ~= 'table' then return type(obj) end
  local i = 1
  for _ in pairs(obj) do
    if obj[i] ~= nil then i = i + 1 else return 'table' end
  end
  if i == 1 then return 'table' else return 'array' end
end

local function escape_str(s)
  local in_char  = {'\\', '"', '/', '\b', '\f', '\n', '\r', '\t'}
  local out_char = {'\\', '"', '/',  'b',  'f',  'n',  'r',  't'}
  for i, c in ipairs(in_char) do
    s = s:gsub(c, '\\' .. out_char[i])
  end
  return s
end

local function skip_delim(str, pos, delim, err_if_missing)
  pos = pos + #str:match('^%s*', pos)
  if str:sub(pos, pos) ~= delim then
    return pos, false
  end
  return pos + 1, true
end

local function parse_str_val(str, pos, val)
  val = val or ''
  local early_end_error = 'End of input found while parsing string.'
  local c = str:sub(pos, pos)
  if c == '"'  then return val, pos + 1 end
  if c ~= '\\' then return parse_str_val(str, pos + 1, val .. c) end
  -- We must have a \ character.
  local esc_map = {b = '\b', f = '\f', n = '\n', r = '\r', t = '\t'}
  local nextc = str:sub(pos + 1, pos + 1)
  return parse_str_val(str, pos + 2, val .. (esc_map[nextc] or nextc))
end

local function parse_num_val(str, pos)
  local num_str = str:match('^-?%d+%.?%d*[eE]?[+-]?%d*', pos)
  local val = tonumber(num_str)
  return val, pos + #num_str
end

function jstringify(obj, as_key)
  local s = {}
  local kind = kind_of(obj)
  if kind == 'array' then
    s[#s + 1] = '['
    for i, val in ipairs(obj) do
      if i > 1 then s[#s + 1] = ', ' end
      s[#s + 1] = jstringify(val)
    end
    s[#s + 1] = ']'
  elseif kind == 'table' then
    s[#s + 1] = '{'
    for k, v in pairs(obj) do
      if #s > 1 then s[#s + 1] = ', ' end
      s[#s + 1] = jstringify(k, true)
      s[#s + 1] = ':'
      s[#s + 1] = jstringify(v)
    end
    s[#s + 1] = '}'
  elseif kind == 'string' then
    return '"' .. escape_str(obj) .. '"'
  elseif kind == 'number' then
    if as_key then return '"' .. tostring(obj) .. '"' end
    return tostring(obj)
  elseif kind == 'boolean' then
    return tostring(obj)
  elseif kind == 'nil' then
    return 'null'
  end
  return table.concat(s)
end

json.null = {}

function jparse(str, pos, end_delim)
  pos = pos or 1
  if not str then error('Array was not found.') end
  local pos = pos + #str:match('^%s*', pos)
  local first = str:sub(pos, pos)
  if first == '{' then  -- Parse an object.
    local obj, key, delim_found = {}, true, true
    pos = pos + 1
    while true do
      key, pos = jparse(str, pos, '}')
      if key == nil then return obj, pos end
      pos = skip_delim(str, pos, ':', true)
      obj[key], pos = jparse(str, pos)
      pos, delim_found = skip_delim(str, pos, ',')
    end
  elseif first == '[' then  -- Parse an array.
    local arr, val, delim_found = {}, true, true
    pos = pos + 1
    while true do
      val, pos = jparse(str, pos, ']')
      if val == nil then return arr, pos end
      arr[#arr + 1] = val
      pos, delim_found = skip_delim(str, pos, ',')
    end
  elseif first == '"' then  -- Parse a string.
    return parse_str_val(str, pos + 1)
  elseif first == '-' or first:match('%d') then
    return parse_num_val(str, pos)
  elseif first == end_delim then
    return nil, pos + 1
  else  -- Parse true, false, or null.
    local literals = {['true'] = true, ['false'] = false, ['null'] = json.null}
    for lit_str, lit_val in pairs(literals) do
      local lit_end = pos + #lit_str - 1
      if str:sub(pos, lit_end) == lit_str then return lit_val, lit_end + 1 end
    end
    local pos_info_str = 'position ' .. pos .. ': ' .. str:sub(pos, pos + 10)
  end
end

--[[
    Todo:

    Add Automatic File Creation for Character Change Event? (could possibly remove the feature, idk tho)
    Make singing code into an function to save space and to prevent duplicate code.
]]