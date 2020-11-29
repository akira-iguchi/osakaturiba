# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { "test" }
    
    factory :invalid_user do
      id { nil }
    end
    
    factory :user_with_avatar do
      avatar { File.new("#{Rails.root}/spec/factories/avatar.png") }
    end
  end
end
