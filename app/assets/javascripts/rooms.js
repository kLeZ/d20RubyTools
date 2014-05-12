// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
var animateScroll = false;

function scrollLog() {
	if (animateScroll) {
		$("#chatbox").animate({
			scrollTop : $('#chatbox')[0].scrollHeight
		}, 'normal');
	} else {
		$('#chatbox').scrollTop($('#chatbox')[0].scrollHeight);
	}
}

function ReloadPage(page) {
	$('#chatbox').load(page);
	scrollLog();
};

$(document).ready(function() {
	ReloadPage("<%= room_messages_path(@room) %>");
	$('input[name="message"]').focus();
	setInterval("ReloadPage(\"<%= room_messages_path(@room) %>\")", 500);
	$.ajaxSetup({
		cache : true
	});
});

$('#send').click(function() {
	scrollLog();
});

$("#members").tablecloth({ theme : "dark" });

$('#tabs a[href="#members-pane"]').tab('show');
$('#tabs a[href="#profile-pane"]').click(function (e) {
	e.preventDefault()
	$(this).tab('show')
});

$(window).bind('beforeunload', function(){
	return 'Please exit from the room with the exit link.';
});
