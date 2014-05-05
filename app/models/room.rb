class Room < ActiveRecord::Base
	has_one :master, class_name: 'User'
	has_many :members
	has_many :messages
end
