FactoryBot.define do
  factory :user do
    email { "test_#{SecureRandom.hex}@tamlh.com" }
    password { "123123" }
  end
end