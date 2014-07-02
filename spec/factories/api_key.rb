FactoryGirl.define do
  factory :api_key do
  end

  factory :api_key_expired, parent: :api_key do
  	expires_at { DateTime.now() }
  end
end
