require 'rails_helper'

RSpec.describe 'Records', type: :request do
  let(:user) { create(:user) }

  before do
    @record = create(:record,
                     spot: 'かもめ大橋',
                     fishingtype: 'サビキ釣り',
                     bait: 'アミエビ',
                     weather: '晴れ',
                     detail: 'アジが釣れた。',
                     fishing_start_time: '2020-12-26 07:00:00',
                     fishing_end_time: '2020-12-26 08:01:00',
                     start_time: Time.now,
                     user: user)

    @user2 = create(:user,
                    name: 'test2',
                    email: 'tes2t@example.com',
                    password: 'test123',
                    password_confirmation: 'test123')

    @record2 = create(:record, spot: 'シーサイドコスモ',
                               fishingtype: 'ルアー釣り',
                               start_time: Time.now,
                               user: @user2)
  end

  describe 'GET #index' do
    context 'ログイン状態でフィシング記録が存在する場合' do
      before do
        sign_in(user)
        get user_records_path(user)
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 200
      end

      it '釣り方が表示されていること' do
        expect(response.body).to include @record.fishingtype.to_s
      end

      it '自分が作成したフィシング記録しか表示されないこと' do
        get user_records_path(@user2)
        expect(response).to redirect_to user_records_path(user)
      end
    end

    context '未ログイン状態のとき' do
      it 'ログインページにリダイレクトされること' do
        get user_records_path(user)
        expect(response.status).to eq 302
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'GET #show' do
    context 'ログイン状態でフィシング記録が存在する場合' do
      before do
        sign_in(user)
        get user_record_path(user, @record)
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 200
      end

      it '釣り場が表示されていること' do
        expect(response.body).to include 'かもめ大橋'
      end

      it '釣り方が表示されていること' do
        expect(response.body).to include 'サビキ釣り'
      end

      it 'エサが表示されていること' do
        expect(response.body).to include 'アミエビ'
      end

      it '天気が表示されていること' do
        expect(response.body).to include '晴れ'
      end

      it '詳細が表示されていること' do
        expect(response.body).to include 'アジが釣れた。'
      end

      it '開始時刻が表示されていること' do
        expect(response.body).to include '07:00'
      end

      it '終了時刻が表示されていること' do
        expect(response.body).to include '08:01'
      end

      it '自分が作成したフィシング記録しか表示されないこと' do
        get user_records_path(@user2, @record)
        expect(response).to redirect_to user_records_path(user)
      end
    end

    context '未ログイン状態のとき' do
      it 'ログインページにリダイレクトされること' do
        get user_record_path(@record, user)
        expect(response.status).to eq 302
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe '#create' do
    context 'ユーザーが存在しないとき' do
      it 'フィッシング記録を作成できないこと' do
        record_params = attributes_for(:record)
        expect do
          post user_records_path(@record), params: { record: record_params }, xhr: true
        end.to change(Record.all, :count).by(0)
      end
    end

    context '未ログイン状態のとき' do
      it 'フィッシング記録を作成できないこと' do
        record_params = attributes_for(:record, user_id: user.id)
        expect do
          post user_records_path(@record, user), params: { record: record_params }, xhr: true
        end.to change(Record.all, :count).by(0)
      end

      it 'ログインページにリダイレクトされること' do
        record_params = attributes_for(:record, user_id: user.id)
        post user_records_path(@record, user), params: { record: record_params }, xhr: true
        expect(response.status).to eq 302
        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'ログイン状態のとき' do
      before do
        sign_in(user)
      end

      it 'フィッシング記録を作成できること' do
        record_params = attributes_for(:record, user_id: user.id)
        expect do
          post user_records_path(@record, user), params: { record: record_params }, xhr: true
        end.to change(Record.all, :count).by(1)
      end

      it '失敗時はフィッシング記録を作成できないこと' do
        record_params = attributes_for(:record, spot: nil)
        post user_records_path(@record), params: { record: record_params }, xhr: true
        expect(response.status).to eq 200
        expect(response.body).to include 'フィッシング記録が作成できませんでした。'
      end
    end
  end

  describe 'GET #edit' do
    context '未ログイン状態のとき' do
      it 'ログインページにリダイレクトされること' do
        get edit_user_record_path(user, @record)
        expect(response.status).to eq 302
        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'ログイン状態のとき' do
      before do
        sign_in(user)
        get edit_user_record_path(user, @record)
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 200
      end

      it '釣り場が表示されていること' do
        expect(response.body).to include 'かもめ大橋'
      end

      it '自分のフィッシング記録以外はトップページにリダイレクトされること' do
        get edit_user_record_path(user, @record2)
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'PUT #update' do
    describe 'パラメータが妥当な場合' do
      before do
        sign_in(user)
        record_params = attributes_for(:record, spot: '貝塚人工島')
        patch user_record_path(user_id: user, id: @record), params: { record: record_params }
        @record.reload
        expect(@record.spot).to eq('貝塚人工島')
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 302
      end

      it '釣り場が更新されること' do
        expect(@record.spot).to eq '貝塚人工島'
      end

      it 'リダイレクトすること' do
        expect(response).to redirect_to user_record_path(user, @record)
      end
    end
  end

  describe '#destroy' do
    context '未ログイン状態のとき' do
      it 'フィシング記録を削除できないこと' do
        expect do
          delete user_record_path(user_id: user, id: @record.id), xhr: true
        end.to change(Record.all, :count).by(0)
      end

      it 'ログインページにリダイレクトされること' do
        delete user_record_path(user_id: user, id: @record.id), xhr: true
        expect(response.status).to eq 302
        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'ログイン状態のとき' do
      before do
        sign_in(user)
      end

      it 'フィシング記録を削除できること' do
        expect do
          delete user_record_path(user_id: user, id: @record.id), xhr: true
        end.to change(Record.all, :count).by(-1)
      end

      it 'フィシング記録を作成したユーザーしか削除できないこと' do
        expect do
          delete user_record_path(user_id: user, id: @record2.id), xhr: true
        end.to change(Record.all, :count).by(0)
      end

      it '自分のフィッシング記録以外はトップページにリダイレクトされること' do
        delete user_record_path(user_id: user, id: @record2.id), xhr: true
        expect(response.status).to eq 302
        expect(response).to redirect_to root_path
      end
    end
  end
end
