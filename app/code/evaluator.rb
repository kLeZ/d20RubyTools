require 'logger'
require_relative 'chainable'

class Evaluator
	include Chainable

	@@log = Logger.new(STDOUT)
	@@log.level = Logger::WARN

	def initialize
	end

	def canManage(s)
		return false
	end

	def manage(message)
		return message
	end

	chain_method :manage

	def evaluate(s)
		@@log.debug("Evaluating \'#{s}\'")
		if canManage(s)
			@@log.debug('Calling manage(s)')
			return manage(s)
		else
			next_in_chain.manage(s)
		end
	end

	def Evaluator.logger
		return @@log
	end
end
