function onCreatePost()
  makeLuaText('creditMark', 'COOLDUDECRAFTER', 1275, 0, 5)
  setTextAlignment('creditMark', 'RIGHT')
  setTextBorder("creditMark", 2, '000000')
  setTextSize('creditMark', 13)
  addLuaText('creditMark')
  setTextFont('creditMark', 'minecraftory.ttf')
end
function onUpdate()
  setProperty('creditMark.alpha', getProperty('cornerMark.alpha'))
  if not getTextString('botplayTxt') == 'COOLDUDECRAFTER' then
    setProperty('creditMark.alpha', 1)
  else
    setProperty('creditMark.alpha', 0)
  end
end

-- please do not delete this :((( -cooldudecrafter