function onCountdownStarted()
	for i = 0, 3 do
		setPropertyFromGroup('opponentStrums', 0, 'x', 11400);
  setPropertyFromGroup('opponentStrums', 1, 'x', 2270);
  setPropertyFromGroup('opponentStrums', 2, 'x', 3370);
  setPropertyFromGroup('opponentStrums', 3, 'x', 4500);
	end

	setPropertyFromGroup('playerStrums', 0, 'x', 114);
	setPropertyFromGroup('playerStrums', 1, 'x', 227);
	setPropertyFromGroup('playerStrums', 2, 'x', 337);
	setPropertyFromGroup('playerStrums', 3, 'x', 450);
end