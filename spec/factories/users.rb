# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { "test" }
    
    factory :invalid_user do
      id { nil }
    end
  end
end
