function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bubblezda'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'intro3'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
end