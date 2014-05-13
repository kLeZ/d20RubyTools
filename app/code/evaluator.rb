#require './chainable'

class Evaluator
	include Chainable

	def initialize
	end

	def canManage(s)
		return true
	end

	def manage(message)
		return message
	end

	chain_method :manage

	def evaluate(s)
		if canManage(s)
			return manage(s)
		else
			abort_chain
		end
	end
end

class TextEvaluator < Evaluator
end
