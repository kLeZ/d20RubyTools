class Member < ActiveRecord::Base
	has_one :user
	has_one :room
	belongs_to :room, dependent: :destroy
end
