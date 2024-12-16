
-- settings
local fakeForever = false -- changes the watermark text between forever engine and psych engine, depending on what you wanna make
local miniTimeTxt = false -- adds a little time bar where the diff text is, which isnt forever accurate but is a neat touch

-- data i stole from forever engine
local foreverLetters = {'LOBOTOMIC', 'FIRE!', 'A', 'B', 'C', 'D', 'E', 'F'}
local foreverPercents = {100, 95, 90, 85, 80, 75, 70, 65}
local foreverRating = 'NA'

local foreverHealth = false -- whether to have the default colors for the health bar

function onCreate()
  if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
     setPropertyFromClass('ClientPrefs', 'middleScroll', false)
  end
end

function onCreatePost()
  -- color health bar whether you allowed it or not
  -- be aware that this does not work on Psych versions prior to 0.6
  if foreverHealth then
    setHealthBarColors('ff0000', '66ff33')
  end

  -- hide original psych ui
  setProperty('timeBarBG.visible',false)
  setProperty('timeBar.visible',false)
  setProperty('timeTxt.visible',false)
  setProperty('scoreTxt.visible',false)

  -- setup forever ui
  makeLuaText('scoreBar', 'Score: 0 - Accuracy: 0% - Combo Breaks: 0 - Rank: N/A', 1360, 0, (downscroll and 114 or 680));
  setTextBorder("scoreBar", 1.1, '000000')
  setTextAlignment('scoreBar', 'CENTER')
  setTextSize('scoreBar', 25)

  if not getPropertyFromClass('ClientPrefs', 'hideHud') then addLuaText('scoreBar') end

  makeLuaText('centerMark', ' - ' .. songName .. ' [' .. string.upper(difficultyName) .. '] -', 0, 0, (downscroll and screenHeight - 40 or 5))
  setTextAlignment('centerMark', 'CENTER')
  setTextBorder("centerMark", 2, '000000')
  screenCenter('centerMark', 'x')
  setTextSize('centerMark', 30)

  if not getPropertyFromClass('ClientPrefs', 'hideHud') then addLuaText('centerMark') end
  if miniTimeTxt then
    setProperty("centerMark.x", math.floor((screenWidth / 2) - (getProperty("centerMark.width") / 1.1)))
  else
  setProperty("centerMark.x", math.floor((screenWidth / 2) - (getProperty("centerMark.width") / 2)))
  end
  makeLuaText('cornerMark', (fakeForever and 'FOREVER ENGINE v0.3.1' or 'PSYCH ENGINE v' .. version), 1275, 0, -205)
  setTextAlignment('cornerMark', 'RIGHT')
  setTextBorder("cornerMark", 1.1, '000000')

  setTextSize('cornerMark', 20)
  if not getPropertyFromClass('ClientPrefs', 'hideHud') then addLuaText('cornerMark') end
end
function mathlerp(from,to,i)return from+(to-from)*i end

function onUpdate()
  setTextFont('botplayTxt', 'minecraftory.ttf')
  setProperty('centerMark.alpha',getProperty('scoreBar.alpha'))
  setProperty('cornerMark.alpha',getProperty('scoreBar.alpha'))

  screenCenter('centerMark', 'x')
  screenCenter('scoreBar', 'x')

  setProperty('iconP2.scale.x',mathlerp(getProperty('iconP2.scale.x'), 1, 0.5))
  setProperty('iconP1.scale.x',mathlerp(getProperty('iconP1.scale.x'), 1, 0.5))

  if miniTimeTxt and getPropertyFromClass('ClientPrefs', 'timeBarType') ~= 'Disabled' and curStep > 0 then
    setTextString('centerMark', ' - ' .. songName .. ' [' .. string.upper(difficultyName) .. ' - ' .. milliToHuman(math.floor(getPropertyFromClass('Conductor', 'songPosition') - noteOffset)) .. ' / ' .. milliToHuman(math.floor(songLength)) .. '] -')
  end
end

function onRecalculateRating()
  reloadRating(round((getProperty('ratingPercent') * 100), 2))
  setTextString('scoreBar',
  'Score: '..score.. -- setup score
  ' - Accuracy: '..round((getProperty('ratingPercent') * 100), 2) ..'%'.. --setup accuracy
  (((hits > 0) or (songMisses > 0)) and ' [' .. (not botPlay and ratingFC or 'NA') .. ']' or '').. -- figure out fc
  ' - Combo Breaks: '..misses.. -- misses (easy)
  ' - Rank: '..foreverRating) -- rating (dumb)
end

function reloadRating(percent)
  -- figures out your rating
  for i = 1,#foreverLetters do
    if foreverPercents[i] <= percent then
      foreverRating = foreverLetters[i]
      break
    end
  end
end

function milliToHuman(milliseconds) -- https://forums.mudlet.org/viewtopic.php?t=3258
	local totalseconds = math.floor(milliseconds / 1000)
	local seconds = totalseconds % 60
	local minutes = math.floor(totalseconds / 60)
	minutes = minutes % 60
	return string.format("%02d:%02d", minutes, seconds)  
end

function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
  n = math.pow(10, n or 0)
  x = x * n
  if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
  return x / n
end
function onDestroy()
  setPropertyFromClass('openfl.Lib', 'application.window.title', 'Friday Night Funkin -  FIRE IN THE HOLE')
end