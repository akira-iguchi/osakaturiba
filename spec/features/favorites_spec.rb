require 'rails_helper'

RSpec.feature 'Favorites', type: :feature do
  before do
    @user = create(:user,
                   name: 'test',
                   email: 'test@example.com',
                   password: 'test123',
                   password_confirmation: 'test123')

    @district = create(:district,
                       name: '南港',
                       latitude: 34.6261,
                       longitude: 135.419)

    @spot = create(:spot,
                   id: 1,
                   name: 'かもめ大橋',
                   explanation: "かもめ大橋の下に位置する波止が釣り場である。内側はアジやクロダイ、外側はハマチなどの青物が狙える。
                                秋になると、外側から内側の順にタチウオが釣れ始める。",
                   address: '〒559-0032 大阪府大阪市住之江区南港南５丁目',
                   latitude: 34.6114,
                   longitude: 135.419,
                   district: @district)
  end

  scenario 'いいね、いいね解除ができる' do
    # トップページを開く
    visit root_path

    # ログインページへ
    click_link 'ログイン'

    # ログインする
    fill_in 'メールアドレス', with: 'test@example.com'
    fill_in 'user[password]', with: 'test123'
    click_button 'ログイン'
    expect(page).to have_text('ログインしました。')

    # スポット詳細ページへ
    click_link @spot.name.to_s

    # スポット詳細ページでいいねする
    find 'h1', text: @spot.name.to_s
    expect do
      click_button 'お気に入り登録'
      expect(page).to have_text('お気に入り登録しました。')
    end.to change(Favorite.all, :count).by(1)

    # いいねが反映されたか検証する
    like = Favorite.first
    expect(like.spot_id).to eq @spot.id
    expect(page).to have_text(@spot.name.to_s)

    # 詳細ページでいいねを解除する
    expect do
      click_button 'お気に入り解除'
      expect(page).to have_text('お気に入り登録を解除しました。')
    end.to change(Favorite.all, :count).by(-1)
    
    # スポット詳細ページへ
    click_link @user.name.to_s

    # スポット詳細ページへ
    click_link 'マイプロフィール'

    # いいねが解除できたか検証する
    expect(page).not_to have_text(@spot.name.to_s)
  end
end
