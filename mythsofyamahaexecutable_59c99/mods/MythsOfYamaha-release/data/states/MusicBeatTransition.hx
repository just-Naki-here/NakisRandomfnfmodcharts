function create() {
	transitionTween.cancel();

	remove(blackSpr);
	remove(transitionSprite);

	transitionCamera.fade(0xFF000000, 0.4, newState == null, () -> {finish();}, true);
}