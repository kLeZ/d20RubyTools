require_relative 'evaluator'
require_relative 'dice_evaluator'

class MainEvaluator < Evaluator
	def initialize
		self.next_in_chain = DiceEvaluator.new
	end

	def canManage(message)
		return false
	end

	def manage(message)
		return message
	end
end

Evaluator.logger.level = Logger::DEBUG

messages = [
	'This is NOT a D&D message.',
	'This is a D&D message, in which I roll 1d20+3'
]

evaluator = MainEvaluator.new
messages.each do |message|
	body = evaluator.evaluate(message)
	puts body
end
