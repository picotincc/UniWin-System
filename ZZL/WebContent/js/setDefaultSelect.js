function setSelectDefault(select, value) {
	for (i = 0; i < select.options.length; i++) {
		if (select.options[i].value == value) {
			select.options[i].selected = "selected";
			break;
		}
	}
}