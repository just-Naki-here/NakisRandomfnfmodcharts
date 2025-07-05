function onEvent(n,v1,v2)
	if n == 'GoreHUDAlpha' then 
     doTweenAlpha('fade', 'health', v1, v2, 'sineOut');
     doTweenAlpha('fade1', 'healthBar', v1, v2, 'sineOut');
     doTweenAlpha('fade2', 'filler', v1, v2, 'sineOut');
     doTweenAlpha('fade3', 'Rating', v1, v2, 'sineOut');
     doTweenAlpha('fade4', 'Score', v1, v2, 'sineOut');
     doTweenAlpha('fade5', 'Accuracy', v1, v2, 'sineOut');
     doTweenAlpha('fade6', 'Miss', v1, v2, 'sineOut');
     doTweenAlpha('fade7', 'icons1', v1, v2, 'sineOut');
     doTweenAlpha('fade8', 'icons2', v1, v2, 'sineOut');
     doTweenAlpha('fade9', 'iconP1', v1, v2, 'sineOut');
     doTweenAlpha('fade11', 'iconP2', v1, v2, 'sineOut');
     doTweenAlpha('fade12', 'PS', v1, v2, 'sineOut');
     doTweenAlpha('fade13', 'iconBFblack', v1, v2, 'sineOut');
 end
end
			