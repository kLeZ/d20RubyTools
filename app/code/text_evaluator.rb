require 'logger'
require_relative 'evaluator'

class TextEvaluator < Evaluator
	def can_manage(s)
		return true
	end

	def manage(message)
		@@log.debug('TextEvaluator')
		return message
	end
end
