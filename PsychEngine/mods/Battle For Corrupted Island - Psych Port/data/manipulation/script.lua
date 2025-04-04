function onEndSong()
	if not allowEnd then
		startVideo('ManipulationENDCUTSCENE');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end