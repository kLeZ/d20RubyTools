module Chainable
	def next_in_chain
		nil
	end

	# NOTE: Better have canManage and manage as passed by methods,
	# in this way it can be much configurable, even if it is not the primary ruby's behavior
	# (convention over configuration, where the convention is to use canManage and manage
	# and the configuration would be to write abstract methods)
	def evaluate(message)
		if self.can_manage(message)
			self.manage(message)
		else
			next_in_chain.evaluate(message) unless next_in_chain.nil?
		end
	end
end
