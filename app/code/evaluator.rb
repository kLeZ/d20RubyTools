require 'logger'
require_relative 'chainable'

class Evaluator
	include Chainable

	@@log = Logger.new(STDOUT)
	@@log.level = Logger::WARN

	def initialize
	end

	def can_manage(s)
		return false
	end

	def manage(message)
		return message
	end

	def Evaluator.logger
		return @@log
	end
end
