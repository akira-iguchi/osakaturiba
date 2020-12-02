# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :session do
    email { 'test@example.com' }
    password { 'test123' }
  end
end
