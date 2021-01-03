require 'rails_helper'

RSpec.feature 'Comments', type: :feature do
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

  scenario 'コメントの作成、削除をする' do
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

    # コメント作成
    find 'h1', text: @spot.name
    expect do
      fill_in 'comment[content]', with: 'コメント投稿のテスト'
      click_button 'コメントする'
      expect(page).to have_text('コメントしました。')
    end.to change(Comment.all, :count).by(1)

    # コメントが反映されたか検証
    expect(current_path).to eq spot_path(@spot)
    expect(page).to have_text('コメント投稿のテスト')

    # ーーーーコメントの削除ーーーー
    expect do
      click_link '削除'
      expect(page).to have_text('コメントを削除しました。')
    end.to change(Comment.all, :count).by(-1)

    # コメントが削除されたか検証
    expect(current_path).to eq spot_path(@spot)
    expect(page).not_to have_text('コメント投稿のテスト')
  end
end
