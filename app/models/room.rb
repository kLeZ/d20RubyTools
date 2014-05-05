class Room < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 5 }
	has_one :master, class_name: 'User'
	has_many :members, dependent: :destroy
	has_many :messages, dependent: :destroy
end
