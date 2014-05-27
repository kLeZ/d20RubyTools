// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
var animateScroll = false;
var chatIntervalId = null;
var membersIntervalId = null;
var room_messages_path = '';
var list_members_room_path = '';
var exit_room_path = '';

var a, b = false, c = "";

function triggerEvent(el, type) {
	if ((el[type] || false) && typeof el[type] == 'function') {
		el[type](el);
	}
}

function appendNote() {
	$('#message_body').val($('#notes').val());
}

function scrollLog() {
	if (animateScroll) {
		$("#chatbox").animate({
			scrollTop : $('#chatbox')[0].scrollHeight
		}, 'normal');
	} else {
		$('#chatbox').scrollTop($('#chatbox')[0].scrollHeight);
	}
}

function reload(obj, url) {
	$(obj).load(url);
}

function reloadChat() {
	reload('#chatbox', room_messages_path);
	scrollLog();
}

function reloadMembers() {
	reload('#members-pane', list_members_room_path);
}

function togglePolling() {
	if (!chatIntervalId && !membersIntervalId) {
		chatIntervalId = setInterval("reloadChat()", 1000);
		membersIntervalId = setInterval("reloadMembers()", 1000);
		$('#polling-switch')
				.html('<i class="fa fa-refresh"></i> Switch autorefresh (<i class="fa fa-circle-o"></i>)')
	} else {
		clearInterval(chatIntervalId);
		clearInterval(membersIntervalId);
		chatIntervalId = null;
		membersIntervalId = null;
		$('#polling-switch')
				.html('<i class="fa fa-refresh"></i> Switch autorefresh (<i class="fa fa-circle"></i>)')
	}
}

function initRoom(room_messages, list_members_room, exit_room) {
	room_messages_path = room_messages;
	list_members_room_path = list_members_room;
	exit_room_path = exit_room;
	$(document).ready(function() {
		reloadChat();
		reloadMembers();
		$('#message_body').focus();
		togglePolling();
		$.ajaxSetup({
			cache : true
		});
	});

	$('#message_send').click(function() {
		scrollLog();
	});

	$("#members").tablecloth({
		theme : "dark"
	});

	$('#tabs a[href="#members-pane"]').tab('show');
	$('#tabs a[href="#notes-pane"]').click(function(e) {
		e.preventDefault()
		$(this).tab('show')
	});

	$(function() {
		$('a:not([href^=#])').on('click', function(e) {
			e.preventDefault();
			c = this.href;
			triggerEvent(window, 'onbeforeunload');
		});
	});

	window.onbeforeunload = function(e) {
		if (b) return;
		a = setTimeout(function() {
			$.ajax({
				url : exit_room_path,
				type : 'PUT',
				success : function(result) {
				}
			});
			b = true;
			window.location.href = c;
			c = "";
		}, 500);
	}

	window.onunload = function() {
		clearTimeout(a);
	}

	$('#new_message').submit(function() {
		window.onbeforeunload = null;
	});
}
