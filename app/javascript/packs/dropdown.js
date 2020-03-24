function navDropdown() {
	document.getElementById("collections-submenu").classList.toggle("show");
}

window.onclick = function(event) {
	if (!event.target.matches(".dropdown")) {
		var dropdowns = document.getElementsByClassName("submenu");
		var i;
		for (i = 0; i < dropdowns.length; i++) {
			var openDropdown = dropdowns[i];
			if (openDropdown.classList.contains('show')) {
				openDropdown.classList.remove('show');
			}
		}
	}
}