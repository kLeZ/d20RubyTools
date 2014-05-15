d20RubyTools
============

This is a Ruby (On Rails) port of the former project d20WebTools primarily written in Java.

Installation
============
To install this app in production you need to follow some simple steps:
	- Configure database variables, there is a predefined setting for OpenShift,
		in case your production is different simply change the system environment variables
		to your needs.
	- Configure devise (authentication provider) secret key. You can generate a secret key with rake secret,
		and you need to put the resulting string into the SECRET_KEY_BASE variable, which is not related to devise
		but it can be used by that lib.
