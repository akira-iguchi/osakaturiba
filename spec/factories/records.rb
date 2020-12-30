FactoryBot.define do
  factory :record do
    spot { "かもめ大橋" }
    fishingtype { "サビキ釣り" }
    bait { "アミエビ" }
    weather { "晴れ" }
    detail { "アジが釣れた。" }
    fishing_start_time { '2020-09-26 00:00:00' }
    fishing_end_time { '2020-09-26 00:00:00' }
    start_time { '2020-09-26 00:00:00' }

    association :user
  end
end
