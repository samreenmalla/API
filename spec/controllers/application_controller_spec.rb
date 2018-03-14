require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
	let(:api_key) {create(:api_key)}

	controller do
		def index

			render json: { response: :success }
		end
	end

	it 'returns success with a valid http token' do
		request.env['HTTP_AUTHORIZATION'] = token(api_key.key)
		get :index, params: { format: :json }
		expect(response).to have_http_status(:success)
	end

	it 'returns unauthorized when the token is invalid' do
		request.env['HTTP_AUTHORIZATION'] = token('fake')
		get :index,params: { format: :json }
		expect(response).to have_http_status(:unauthorized)
	end
end
	