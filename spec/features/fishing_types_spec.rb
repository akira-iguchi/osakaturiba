require 'rails_helper'

RSpec.feature 'FishingTypes', type: :feature do
  before do
    @fishing_type = create(:fishing_type,
                       id: 1,
                       name: 'サビキ釣り',
                       content: 'サビキを使う釣り方。',
                      )

    @district = create(:district,
                        id: 1,
                        name: '南港',
                        latitude: 34.6261,
                        longitude: 135.419
                       )

    @spot = create(:spot,
                   id: 1,
                   name: 'かもめ大橋',
                   explanation: 'かもめ大橋の下に位置する波止が釣り場である。内側はアジやクロダイ、外側はハマチなどの青物が狙える。
                                秋になると、外側から内側の順にタチウオが釣れ始める。',
                   address: '〒559-0032 大阪府大阪市住之江区南港南５丁目',
                   latitude: 34.6114,
                   longitude: 135.419,
                   district: @district
                  )
    
    @spot.fishing_types << @fishing_type
  end

  scenario 'トップページから釣り方ページへ行く' do
    # トップページを開く
    visit root_path

    # 釣り方ページへ
    click_link '釣り方'
  end

  scenario 'スポット詳細ページから釣り方ページへ行く' do
    # トップページを開く
    visit root_path

    # スポット詳細ページへ
    click_link @spot.name.to_s

    # 釣り方ページへ
    click_link 'サビキ釣り'
  end
end
