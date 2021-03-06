// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
// Loads all Bootstrap javascripts
//= require bootstrap
//= require websocket_rails/main

!function($) {
	$(function() {
		var $root = $('html, body');

		$('a[data-spy="smooth"]').click(function() {
			var href = $.attr(this, 'href');
			$root.animate({
				scrollTop : $(href).offset().top + 2
			}, 500);
			return false;
		});
	})
}(window.jQuery);
