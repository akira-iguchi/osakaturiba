# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :user do
    name { 'test' }
    email { Faker::Internet.email }
    password { 'testtest' }
    password_confirmation { 'testtest' }
    image { 'default.jpg' }

    factory :invalid_user do
      id { nil }
    end
  end
end
