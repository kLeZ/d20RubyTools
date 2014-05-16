class AddIsOnlineToMembers < ActiveRecord::Migration
	def change
		add_column :members, :is_online, :boolean, :null => false, default: false
	end
end
