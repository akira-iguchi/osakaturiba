# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :session do
    email { "akira@akira.com" }
    password { "Akituri931!" }
  end
end
