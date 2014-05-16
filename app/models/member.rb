class Member < ActiveRecord::Base
	attr_accessor :is_online

	belongs_to :room
	belongs_to :user
end
