class Evaluator
	include Chainable

	def initialize
		self.next_in_chain = DiceEvaluator.new
	end

	def manage(message)
		return message
	end

	chain_method :manage
end