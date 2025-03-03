--[[

随机加载图

made by Niko_matthew

如要使用请在制作组名单加上我

这玩意莫名其妙的耗了我一小时去做

我不小心整复杂化结果自己看不懂了
]]

local imageName = {loading/'loadingscreen-1','loadingscreen-2','loadingscreen-3'} --图片名 有多少写多少名 比如只有两个就只写两个图片名 三个就写三个

local disapperTime = 0.5 --加载图片消失时间

local maxLoadingTime = 5 --最大加载时间

local minLoadingTime = 3 --最小加载时间

local maxImageNum = table.getn(imageName) --自动获取最大图片数

function getTrueRandomNum(minnum,maxnum) --自定义function 为了获取真随机数 但是写完之后发现实在太废了于是用了getrandomint
--[[local realTimeButStringSubAndReverseLOL = (tostring(os.time()):sub(1,5):reverse()) + Plus
--获取时间字符串取前5位数并反转
math.randomseed(realTimeButStringSubAndReverseLOL) --设置种子

return math.random(minnum,maxnum)
]]
return getRandomInt(minnum,maxnum)
end
------------------我认为接下来的都是十分简单的东西所以就不多做注释了------------------
default = {} --我也不知道为什么但是用了table bug就无了
function onCreate()
  setProperty('canPause', false)
  
	startedCountdown = false
	
 --getRanNum = getTrueRandomNum(1,maxImageNum,50000)
  getRanNum = getTrueRandomNum(1,maxImageNum)
for i = 1,maxImageNum do
table.insert(default,i)
--debugPrint(realTime,i,getRanNum)
if getRanNum == default[i] then

makeLuaSprite('LoadingImage'..getRanNum,imageName[getRanNum],0,0) --首先这个加载图片一定是要1280x720的

setObjectCamera('LoadingImage'..getRanNum, 'other')

addLuaSprite('LoadingImage'..getRanNum, true)

end
end
end

function onStartCountdown()
	if not startedCountdown then
	
  --getRanNum2 = getTrueRandomNum(minLoadingTime,maxLoadingTime,35000)
  
  getRanNum2 = getTrueRandomNum(minLoadingTime,maxLoadingTime)
  
   startedCountdown = not startedCountdown
  
		runTimer('loadingImageGoDie', getRanNum2)
		
debugPrint(maxImageNum)

			return Function_Stop
		end
		return Function_Continue
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'loadingImageGoDie' then
startCountdown()

doTweenAlpha('loadingImageIsDying','LoadingImage'..getRanNum, 0,disapperTime,'linear')--linear可以改为其他的lol

runTimer('loadingImageGone',disapperTime)

end

if tag == 'loadingImageGone' then

removeLuaSprite('LoadingImage'..getRanNum)

setProperty('canPause', true)
end
end
