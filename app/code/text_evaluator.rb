require 'logger'
require_relative 'evaluator'

class TextEvaluator < Evaluator
	def canManage(s)
		return true
	end

	def manage(message)
		@@log.info('TextEvaluator')
		return message
	end
end
