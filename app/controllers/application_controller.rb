class ApplicationController < ActionController::API
	include ActionController::HttpAuthentication::Token::ControllerMethods
	include Pundit

	before_action :authenticate

	def aunthenticate
		authenticate_token || unauthorized 
	end

	def autheticate_token
		authenticate_with_http_token do |token, options|
			@api_key = ApiKey.find_by(key: token)
		end
	end

	def pundit_user
		@api_key
	end
	
	def unauthorized
		render json: {error: 'Unauthorized Request'}, status: :unauthorized
	end
end