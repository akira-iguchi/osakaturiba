FactoryBot.define do
  factory :type do
    association :spot
    association :fishing_type
  end
end