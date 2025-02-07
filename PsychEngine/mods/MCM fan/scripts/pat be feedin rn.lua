local settings = {



}
local healthImage = 'healthBar_mcm'
local w = {
w = 'reagan',
w = 'inky',
w = 'tortured_pat'
}
local maxw = table.getn(w)
function onCreatePost()	
if guitarHeroSustains then
setProperty('guitarHeroSustains',false)
end
if dadName == 'tortured_pat' then
    healthImage = 'pathealthborder'
end
if dadName == 'phase1bw' then
    healthImage = 'B_healthBar_mcm'
end
if dadName == 'inky' then
setProperty('healthBar.bg.alpha', 0)
end
setProperty('healthBar.bg.offset.x', 106)
setProperty('healthBar.bg.offset.y', 49)
runHaxeCode(
            [[
                game.healthBar.bg.loadGraphic(Paths.image(']]..healthImage..[['));
                game.healthBar.bg.antialiasing = ]]..tostring(barAntialiasing)..[[;
                --game.healthBar.bg.offset.set(45,5);
                return;
            ]]
        )
        
        if dadName == 'tortured_pat' then
        setProperty('healthBar.bg.offset.x', 80)
setProperty('healthBar.bg.offset.y', 37)
end

if dadName == w then
	


end

	end
	function onUpdatePost()
	if boyfriendName == 'ghostbf' then
    setProperty("healthBar.scale.x", 0.6)
    if downscroll then
setProperty("scoreTxt.y",15)
end
if not downscroll then
setProperty("scoreTxt.y",705)
end
	end
	if dadName == 'reagan' then
	setProperty("healthBar.scale.x", 0.6)
	setProperty('healthBar.bg.alpha', 0)
	--setProperty('iconP1.x', 900)
	if downscroll then
setProperty("scoreTxt.y",15)
end
if not downscroll then
setProperty("scoreTxt.y",705)
end
	if version >= '1' then
	--setProperty('iconP1.x', 1025)
	end
	end
	if boyfriendName == 'bf-spongebobcage1' then
	
	end
	end