#require './evaluator'
#require './dice'

class DiceEvaluator < Evaluator
	def initialize
		self.next_in_chain = TextEvaluator.new
	end

	def canManage(s)
		return Dice.isManyDice(s)
	end

	def manage(message)
		return Dice.parseManyShowResults(message)
	end
end