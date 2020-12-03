# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :spot do
    name { 'かもめ大橋' }
    explanation do
      "かもめ大橋の下に位置する波止が釣り場である。内側はアジやクロダイ、外側はハマチなどの青物が狙える。
       秋になると、外側から内側の順にタチウオが釣れ始める。"
    end
    address { '〒559-0032 大阪府大阪市住之江区南港南５丁目' }
    latitude { 34.6114 }
    longitude { 135.419 }

    association :district
  end
end
