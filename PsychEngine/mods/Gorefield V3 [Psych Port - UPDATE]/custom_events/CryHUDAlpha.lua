function onEvent(n,v1,v2)
	if n == 'CryHUDAlpha' then 
     doTweenAlpha('fade', 'health', v1, v2, 'sineOut');
     doTweenAlpha('fade1', 'healthNO1', v1, v2, 'sineOut');
     doTweenAlpha('fade2', 'healthBack', v1, v2, 'sineOut');
     doTweenAlpha('fade3', 'Rating', v1, v2, 'sineOut');
     doTweenAlpha('fade4', 'Score', v1, v2, 'sineOut');
     doTweenAlpha('fade5', 'Accuracy', v1, v2, 'sineOut');
     doTweenAlpha('fade6', 'Miss', v1, v2, 'sineOut');
     doTweenAlpha('fade7', 'icons1', v1, v2, 'sineOut');
     doTweenAlpha('fade8', 'icons2', v1, v2, 'sineOut');

 end
end
			