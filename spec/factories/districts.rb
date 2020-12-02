# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :district do
    name { '南港' }
    latitude { 34.6261 }
    longitude { 135.419 }
  end
end
