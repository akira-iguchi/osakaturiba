require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  before do
    @user = create(:user,
                   name: 'test',
                   email: 'test@example.com',
                   password: 'test123',
                   password_confirmation: 'test123')
  end

  scenario 'ユーザー情報を編集する' do
    # トップページを開く
    visit root_path

    # ログインページへ
    click_link 'ログイン'

    # ログインする
    fill_in 'メールアドレス', with: 'test@example.com'
    fill_in 'user[password]', with: 'test123'
    click_button 'ログイン'
    expect(page).to have_text('ログインしました。')

    # ユーザー詳細ページへ
    click_link 'ユーザー'
    click_link 'マイプロフィール'

    # ユーザー編集ページへ
    click_link '編集'

    # プロフィールを編集する
    fill_in '名前', with: 'test2'
    fill_in 'メールアドレス', with: 'test2@example.com'
    click_button '変更'

    # 編集が反映されているか検証する
    @user.reload
    aggregate_failures do
      expect(@user.name).to eq 'test2'
      expect(@user.email).to eq 'test2@example.com'
    end
    expect(current_path).to eq user_path(@user)
    expect(page).to have_text('アカウント情報を変更しました。')
  end

  scenario 'ゲストユーザーでログインする' do
    # トップページを開く
    visit root_path

    # ログインページへ
    click_link 'ログイン'

    # ゲストログイン機能を使ってログイン
    click_link 'ゲストログイン'

    # ログインできたか検証
    expect(page).to have_text('ゲストユーザーとしてログインしました')
  end
end
