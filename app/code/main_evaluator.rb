#require './evaluator'
#require './dice_evaluator'

class MainEvaluator < Evaluator
	def initialize
		self.next_in_chain = DiceEvaluator.new
	end
end

#messages = [
#	'This is NOT a D&D message.',
#	'This is a D&D message, in which I roll 1d20+3'
#]

#messages.each do |message|
#	evaluator = MainEvaluator.new
#	body = evaluator.evaluate(message)
#	puts body
#end
