--[[

�������ͼ

made by Niko_matthew

��Ҫʹ����������������������

������Ī������ĺ�����һСʱȥ��

�Ҳ�С�������ӻ�����Լ���������
]]

local imageName = {loading/'loadingscreen-1','loadingscreen-2','loadingscreen-3'} --ͼƬ�� �ж���д������ ����ֻ��������ֻд����ͼƬ�� ������д����

local disapperTime = 0.5 --����ͼƬ��ʧʱ��

local maxLoadingTime = 5 --������ʱ��

local minLoadingTime = 3 --��С����ʱ��

local maxImageNum = table.getn(imageName) --�Զ���ȡ���ͼƬ��

function getTrueRandomNum(minnum,maxnum) --�Զ���function Ϊ�˻�ȡ������� ����д��֮����ʵ��̫������������getrandomint
--[[local realTimeButStringSubAndReverseLOL = (tostring(os.time()):sub(1,5):reverse()) + Plus
--��ȡʱ���ַ���ȡǰ5λ������ת
math.randomseed(realTimeButStringSubAndReverseLOL) --��������

return math.random(minnum,maxnum)
]]
return getRandomInt(minnum,maxnum)
end
------------------����Ϊ�������Ķ���ʮ�ּ򵥵Ķ������ԾͲ�����ע����------------------
default = {} --��Ҳ��֪��Ϊʲô��������table bug������
function onCreate()
  setProperty('canPause', false)
  
	startedCountdown = false
	
 --getRanNum = getTrueRandomNum(1,maxImageNum,50000)
  getRanNum = getTrueRandomNum(1,maxImageNum)
for i = 1,maxImageNum do
table.insert(default,i)
--debugPrint(realTime,i,getRanNum)
if getRanNum == default[i] then

makeLuaSprite('LoadingImage'..getRanNum,imageName[getRanNum],0,0) --�����������ͼƬһ����Ҫ1280x720��

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

doTweenAlpha('loadingImageIsDying','LoadingImage'..getRanNum, 0,disapperTime,'linear')--linear���Ը�Ϊ������lol

runTimer('loadingImageGone',disapperTime)

end

if tag == 'loadingImageGone' then

removeLuaSprite('LoadingImage'..getRanNum)

setProperty('canPause', true)
end
end
