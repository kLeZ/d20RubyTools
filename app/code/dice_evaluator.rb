class DiceEvaluator < Evaluator
	def initialize
	end

	def manage(message)
		return Dice.parseManyShowResults(message)
	end
end