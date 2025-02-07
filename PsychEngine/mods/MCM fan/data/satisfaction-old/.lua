function onCountdownStarted()
	for i = 0, 3 do
		setPropertyFromGroup('playerStrums', 0, 'x', 114);
  setPropertyFromGroup('playerStrums', 1, 'x', 227);
  setPropertyFromGroup('playerStrums', 2, 'x', 337);
  setPropertyFromGroup('playerStrums', 3, 'x', 450);
	end

	setPropertyFromGroup('opponentStrums', 0, 'x', 711);
	setPropertyFromGroup('opponentStrums', 1, 'x', 824);
	setPropertyFromGroup('opponentStrums', 2, 'x', 937);
	setPropertyFromGroup('opponentStrums', 3, 'x', 1050);
end