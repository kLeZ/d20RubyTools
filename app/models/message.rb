class Message < ActiveRecord::Base
	has_one :user
	belongs_to :room, dependent: :destroy
end
