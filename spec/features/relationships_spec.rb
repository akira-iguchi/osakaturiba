require 'rails_helper'

RSpec.feature 'Relationships', type: :feature do
  before do
    @user = create(:user,
                   name: 'test',
                   email: 'test@example.com',
                   password: 'password',
                   password_confirmation: 'password'
                  )

    @other = create(:user)
  end

  scenario 'ユーザーをフォロー、フォロー解除する' do
    # トップページを開く
    visit root_path

    # ログインページへ
    click_link 'ログイン'

    # ログインする
    fill_in 'メールアドレス', with: 'test@example.com'
    fill_in 'user[password]', with: 'password'
    click_button 'ログイン'
    expect(page).to have_text('ログインしました。')

    # otherのユーザーページへ
    visit user_path(@other)
    expect(page).to have_text @other.name

    # フォローする
    expect do
      click_button 'フォロー'
      expect(page).to have_text("#{@other.name}さんをフォローしました。")
    end.to change(Relationship.all, :count).by(1)

    # フォロー解除する
    expect do
      click_button 'フォロー中'
      expect(page).to have_text("#{@other.name}さんのフォローを解除しました。")
    end.to change(Relationship.all, :count).by(-1)
  end
end