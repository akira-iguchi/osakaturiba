# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name { 'test' }
    email { Faker::Internet.email }
    password { 'testtest' }
    password_confirmation { 'testtest' }

    factory :invalid_user do
      id { nil }
    end
  end
end
