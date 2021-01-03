FactoryBot.define do
  factory :record do
    spot { 'かもめ大橋' }
    fishingtype { 'サビキ釣り' }
    bait { 'アミエビ' }
    weather { '晴れ' }
    detail { 'アジが釣れた。' }
    fishing_start_time { '2020-12-26 07:00:00' }
    fishing_end_time { '2020-12-26 08:01:00' }
    start_time { Time.now }

    association :user
  end
end
