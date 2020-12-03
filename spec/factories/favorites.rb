# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :favorite do
    association :user
    association :spot
  end
end
