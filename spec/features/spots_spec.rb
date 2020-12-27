require 'rails_helper'

RSpec.feature 'Spots', type: :feature do
  before do
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
  end

  scenario 'トップページから直接スポット詳細ページへ行く' do
    # トップページを開く
    visit root_path

    # スポット詳細ページへ
    click_link @spot.name.to_s
  end

  scenario 'トップページから地区詳細ページ→スポット詳細ページへ行く' do
    # トップページを開く
    visit root_path

    # 地区詳細ページへ
    click_link @district.name.to_s

    # スポット詳細ページへ
    click_link @spot.name.to_s
  end

  scenario '釣り場を検索する' do
    # トップページを開く
    visit root_path

    # 検索ボックスから釣り場を検索する
    fill_in 'name', with: 'かもめ大橋'
    click_button '検索'

    # 釣り場が検索されているか検証する
    expect(current_path).to eq '/spot_search'
    expect(page).to have_text('かもめ大橋')
  end

  scenario '地区を検索する' do
    # トップページを開く
    visit root_path

    # 検索ボックスから釣り場を検索する
    fill_in 'name', with: '南港'
    click_button '検索'

    # 釣り場が検索されているか検証する
    expect(current_path).to eq '/spot_search'
    expect(page).to have_text('南港')
  end
end
