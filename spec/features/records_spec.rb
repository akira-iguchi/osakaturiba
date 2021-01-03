require 'rails_helper'

RSpec.feature 'Records', type: :feature do
  before do
    @user = create(:user,
                   name: 'test',
                   email: 'test@example.com',
                   password: 'test123',
                   password_confirmation: 'test123')
  end

  scenario 'フィッシング記録の作成、編集、削除をする' do
    # トップページを開く
    visit root_path

    # ログインページへ
    click_link 'ログイン'

    # ログインする
    fill_in 'メールアドレス', with: 'test@example.com'
    fill_in 'user[password]', with: 'test123'
    click_button 'ログイン'
    expect(page).to have_text('ログインしました。')

    # フィッシング記録一覧ページへ
    click_link 'フィッシング記録'

    # フィッシング記録作成
    find 'h4', text: '釣りを記録しよう'
    expect do
      fill_in 'record[start_time]', with: Time.now
      fill_in 'record[spot]', with: 'かもめ大橋'
      fill_in 'record[fishingtype]', with: 'サビキ釣り'
      fill_in 'record[fishing_start_time]', with: '2020-12-26 07:00:00'
      fill_in 'record[fishing_end_time]', with: '2020-12-26 09:00:00'
      fill_in 'record[bait]', with: 'アミエビ'
      fill_in 'record[weather]', with: '晴れ'
      fill_in 'record[detail]', with: 'アジがたくさん釣れた。'
      click_button '記録する'
      expect(page).to have_text('フィッシング記録を作成しました。')
    end.to change(Record.all, :count).by(1)

    # フィッシング記録が反映されたか検証
    record = Record.first
    aggregate_failures do
      expect(record.spot).to eq 'かもめ大橋'
    end
    expect(current_path).to eq user_record_path(user_id: @user, id: record)
    expect(page).to have_text('サビキ釣り')

    # ーーーーフィッシング記録の編集ーーーー

    # ユーザー編集ページへ
    click_link '編集する'
    expect(page).to have_text('フィッシング記録の編集')

    # プロフィールを編集する
    fill_in 'record[fishingtype]', with: 'ルアー釣り'
    click_button '変更する'

    # 編集が反映されているか検証する
    record.reload
    expect(current_path).to eq user_record_path(user_id: @user, id: record)
    expect(page).to have_text('フィッシング記録を変更しました。')
    aggregate_failures do
      expect(record.fishingtype).to eq 'ルアー釣り'
    end

    # ーーーーフィッシング記録の削除ーーーー

    # フィシング記録を削除する
    expect(page).to have_text('ルアー釣り')
    expect do
      click_link '削除'
      expect(page).to have_text('フィッシング記録を削除しました。')
    end.to change(Record.all, :count).by(-1)

    # フィッシング記録が削除されたか検証
    expect(current_path).to eq user_records_path(@user)
    expect(page).not_to have_text('ルアー釣り')
  end
end
