FactoryBot.define do
  factory :user do
    email { "test@test.com" }
    password { "password"} 
  end
end

FactoryBot.define do
  factory :product do
    title {'Alpaka'}
    association :user
  end
end