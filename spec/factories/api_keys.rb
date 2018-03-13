FactoryGirl.define do
  factory :api_key do
  	association :client, strategy: build
  	sequence(:name) { |n| "User #{n}"}

  	trait :admin do
			client { nil }
		end
  end
end
