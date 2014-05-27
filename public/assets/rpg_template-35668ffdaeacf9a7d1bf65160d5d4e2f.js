var items = [];
function addNavigationItem(item) {
	items.push(item);
}
$.addTemplateFormatter({
	anchor : function (value, template) {
		return '#' + value;
	}
});
