require 'rails_helper'

RSpec.feature "Spots", type: :feature do
  before do
    @district = create(:district,
                        name: "南港",
                        latitude: 34.6261,
                        longitude: 135.419
                      )
                  
    @spot = create(:spot,
                  name: "かもめ大橋",
                  explanation: "かもめ大橋の下に位置する波止が釣り場である。内側はアジやクロダイ、外側はハマチなどの青物が狙える。
                                秋になると、外側から内側の順にタチウオが釣れ始める。",
                  address: "〒559-0032 大阪府大阪市住之江区南港南５丁目",
                  latitude: 34.6114,
                  longitude: 135.419,
                  district: @district
                  )
  end
  
  scenario 'スポット詳細ページへ行く' do
    # ーーーートップページから直接スポット詳細ページへーーーー
    
    # トップページを開く
    visit root_path

    # 地区詳細ページへ
    click_link "#{@district.name}"
  
    # ーーーートップページから地区詳細ページ→スポット詳細ページへーーーー
    
    # トップページを開く
    visit root_path

    # 地区詳細ページへ
    click_link "#{@district.name}"
    
    # スポット詳細ページへ
    click_link "#{@spot.name}"
  end
end
