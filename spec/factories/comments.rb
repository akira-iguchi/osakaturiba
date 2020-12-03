# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :comment do
    content { 'コメント' }
    association :user
    association :spot
  end
end
