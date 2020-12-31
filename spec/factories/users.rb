FactoryBot.define do
  factory :user do
    name { 'test' }
    email { Faker::Internet.email }
    password { 'testtest' }
    password_confirmation { 'testtest' }
    image { 'default.jpg' }
  end

  factory :invalid_user do
    id { nil }
  end
end
