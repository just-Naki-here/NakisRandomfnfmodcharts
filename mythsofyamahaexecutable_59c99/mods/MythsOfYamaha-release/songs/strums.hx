public var opponentStrum = [];
public var playerStrum = [];
public var bothStrums = [];

function postCreate() {
	opponentStrum = [for (s in cpuStrums.members) [s.x, s.y]];
	playerStrum = [for (s in playerStrums.members) [s.x, s.y]];
	bothStrums = opponentStrum.concat(playerStrum);
}

public function resetStrum(strum) {
	if (strum == "player") {
		playerStrum.resize(0); 
		playerStrum = [for (s in playerStrums.members) [s.x, s.y]];
	}
	else if (strum == "opponent") {
		opponentStrum.resize(0); 
		opponentStrum = [for (s in cpuStrums.members) [s.x, s.y]];
	}
}
