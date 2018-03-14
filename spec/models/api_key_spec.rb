require 'rails_helper'

RSpec.describe ApiKey, type: :model do
 let(:api_key) { build(:api_key) }

 it 'has valid factories' do
 	expect(build_stubbed(:api_key)).to be_valid
 	expect(build_stubbed(:api_key, :admin)).to be_valid
 end

 it 'has a relationship with Client' do
 	subject = ApiKey.reflect_on_association(:client)
 	expect(subject).to_not be_nil
 	expect(subject.class_name).to eq('Client')
 	expect(subject.macro).to eq(:belongs_to)
 end

 describe 'validations' do
 	it 'does not require a client' do
 		api_key.client_id = nil
 		expect(api_key).to be_valid
 	end

 	it 'requires a name to be present' do
 		api_key.name = nil
 		expect(api_key).to_not be_valid
 	end

 	it 'requires a key to be present' do
 		api_key.key = nil
 		expect(api_key).to_not be_valid
 	end

 	it 'requires a unique key' do
 		api_key2 = create(:api_key, key: api_key.key)
 		expect(api_key).to_not be_valid
 	end
	end

	it 'generates an API key with a size of 64 characters' do
		expect(api_key.key.length).to eq(64)

	end

	describe '#admin?' do

		it 'returns true when the user has not been assigned a client' do
			api_key.client = nil
			expect(api_key.admin?).to be_truthy
		end

		it 'returns false when a user has been assigned a client' do
			api_key.client_id = 1
			expect(api_key.admin?).to be_falsey
		end
	end

end
