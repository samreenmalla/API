require 'rails_helper'

RSpec.describe Client, type: :model do
	let(:client) { build_stubbed(:client)}

	it 'has valid factories' do
		expect(build_stubbed(:client)).to be_valid
	end

	it 'has many api keys' do
		subject = Client.reflect_on_association(:api
			_keys)
		expect(subject).to_not be_nil
		expect(subject.class_name).to eq('ApiKey')
		expect(subject.macro).to eq(:has_many)
	end

	describe 'validations' do
		it 'requires that a name is present' do
			client.name = be_nil
			expect(client).to_not be_valid
		end
	end
end