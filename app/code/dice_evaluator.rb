require_relative 'evaluator'
require_relative 'text_evaluator'
require_relative 'dice'

class DiceEvaluator < Evaluator
	def initialize
		@next = TextEvaluator.new
	end

	def next_in_chain
		@next
	end

	def can_manage(s)
		return Dice.isManyDice(s)
	end

	def manage(message)
		@@log.debug('DiceEvaluator')
		return Dice.parseManyShowResults(message)
	end
end