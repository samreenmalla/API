class Client < ApplicationRecord
	validates :name, presence: true
	has_many :api_keys
end
