function switchBeforeAfter(sender) {
	if (sender.id == "rad-before") {
		$(".after-list").hide();
		$(".before-list").show();
	} else {
		$(".before-list").hide();
		$(".after-list").show();
	};
}