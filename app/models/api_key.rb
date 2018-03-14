class ApiKey < ApplicationRecord
  belongs_to :client, required: false
  validates :key, :name, presence: true
  validates :key, uniqueness: true

  after_initialize do |api_key|
  	api_key.key = SecureRandom.hex(32) if api_key.key.blank?
  end

  def admin?
  	client_id.nil?
  end
end
