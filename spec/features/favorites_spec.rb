require 'rails_helper'

RSpec.feature "Favorites", type: :feature do
  before do
    @user = create(:user,
                    name: 'test',
                    email: 'test@example.com',
                    password: 'test123',
                    password_confirmation: 'test123'
                   )
                  
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
  
  scenario 'いいね、いいね解除ができる', js: true do
    # トップページを開く
    visit root_path

    # ログインページへ
    click_link 'ログイン'

    # ログインする
    fill_in 'メールアドレス', with: 'test@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
    expect(page).to have_text('ログインしました')

    # スポット詳細ページへ
    click_link "#{@spot.name}"

    # スポット詳細ページでいいねする
    find 'h1', text: @spot.name
    expect do
      find('お気に入り登録').click
      expect(page).to have_text('お気に入り登録しました')
    end.to change(Favorite.all, :count).by(1)
    
    # ユーザー詳細ページへ
    click_link "#{@user.name}"
    
    # いいねが反映されたか検証する
    like = Favorite.first
    expect(like.article_id).to eq @spot.id
    expect(page).to have_text("#{like.name}")
    
    # 詳細ページでいいねを解除する
    expect do
      find('お気に入り解除').click
      expect(page).to have_text('お気に入り解除しました')
    end.to change(Favorite.all, :count).by(-1)

    # いいねが解除できたか検証する
    expect(page).not_to have_text("#{like.name}")
  end
end
