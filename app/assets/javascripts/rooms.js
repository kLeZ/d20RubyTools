// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
var animateScroll = false;
var intervalId = null;
var room_path = '';

function scrollLog() {
	if (animateScroll) {
		$("#chatbox").animate({
			scrollTop : $('#chatbox')[0].scrollHeight
		}, 'normal');
	} else {
		$('#chatbox').scrollTop($('#chatbox')[0].scrollHeight);
	}
}

function reloadChat(chat_url) {
	$('#chatbox').load(chat_url);
	scrollLog();
};

function togglePolling() {
	if (!intervalId) {
		intervalId = setInterval("reloadChat('" + room_path + "')", 1000);
	}
	else {
		clearInterval(intervalId);
		intervalId = null;
	}
}

function initRoom(room) {
	room_path = room;
	$(document).ready(function() {
		reloadChat(room_path);
		$('#message_body').focus();
		togglePolling();
		$.ajaxSetup({
			cache : true
		});
	});

	$('#message_send').click(function() {
		scrollLog();
	});

	$("#members").tablecloth({ theme : "dark" });

	$('#tabs a[href="#members-pane"]').tab('show');
	$('#tabs a[href="#profile-pane"]').click(function (e) {
		e.preventDefault()
		$(this).tab('show')
	});

//	$(window).bind('beforeunload', function() {
//		return 'Please exit from the room with the exit link.';
//	});
}
