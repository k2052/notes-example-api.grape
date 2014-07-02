FactoryGirl.define do
  factory :note do
    title { Faker::Lorem.words(5).join(" ") }
  end
end
