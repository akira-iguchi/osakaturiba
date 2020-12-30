require 'rails_helper'

RSpec.describe "Records", type: :request do
  let(:user) { create(:user) }
  let(:record) { create(:record) }

  describe "GET #index" do
    describe 'フィシング記録が存在する場合' do
      before do
        sign_in(user)
        get user_records_path(user)
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 200
      end

      it '釣り方名が表示されていること' do
        expect(response.body).to include record.fishingtype.to_s
      end
    end
  end

  # describe 'GET #show' do
  #   describe 'フィシング記録が存在する場合' do
  #     before do
  #       sign_in(user)
  #       get user_record_path(@record, user)
  #     end

  #     it 'リクエストが成功すること' do
  #       expect(response.status).to eq 200
  #     end

  #     it '釣り場が表示されていること' do
  #       expect(response.body).to include 'かもめ大橋'
  #     end
  #     it '釣り方が表示されていること' do
  #       expect(response.body).to include 'サビキ釣り'
  #     end
  #     it 'エサが表示されていること' do
  #       expect(response.body).to include 'アミエビ'
  #     end
  #     it '天気が表示されていること' do
  #       expect(response.body).to include '晴れ'
  #     end
  #     it '詳細が表示されていること' do
  #       expect(response.body).to include 'アジがたくさん釣れた。'
  #     end
  #     it '開始時刻が表示されていること' do
  #       expect(response.body).to include '07:00'
  #     end
  #     it '終了時刻が表示されていること' do
  #       expect(response.body).to include '08:01'
  #     end
  #   end
  # end

  # describe '#create' do
  #   context 'ユーザーが存在しないとき' do
  #     it 'フィッシング記録を作成できないこと' do
  #       record_params = attributes_for(:record)
  #       expect do
  #         post user_records_path(@record), params: { record: record_params }, xhr: true
  #       end.to change(Record.all, :count).by(0)
  #     end
  #   end

  #   context '未ログイン状態のとき' do
  #     it 'フィッシング記録を作成できないこと' do
  #       record_params = attributes_for(:record, user_id: @user.id)
  #       expect do
  #         post user_records_path(@record, @user), params: { record: record_params }, xhr: true
  #       end.to change(Record.all, :count).by(0)
  #     end
  #   end

  #   context 'ログイン状態のとき' do
  #     before do
  #       sign_in(user)
  #     end

  #     it 'フィッシング記録を作成できること' do
  #       record_params = attributes_for(:record, user_id: @user.id)
  #       expect do
  #         post user_records_path(@record, @user), params: { record: record_params }, xhr: true
  #       end.to change(Record.all, :count).by(1)
  #     end

  #     it '失敗時はフィッシング記録を作成できないこと' do
  #       record_params = attributes_for(:record, spot: nil, user_id: @user.id)
  #       post user_records_path(@record, @user), params: { record: record_params }, xhr: true
  #       expect(response.status).to eq 200
  #     end
  #   end
  # end

  # describe 'GET #edit' do
  #   before do
  #     sign_in(user)
  #     get edit_user_record_path(@user, @record)
  #   end

  #   it 'リクエストが成功すること' do
  #     expect(response.status).to eq 200
  #   end

  #   it '釣り場が表示されていること' do
  #     expect(response.body).to include 'かもめ大橋'
  #   end
  # end

  # describe 'PUT #update' do
  #   describe 'パラメータが妥当な場合' do
  #     before do
  #       sign_in(user)
  #       record_params = attributes_for(:record, spot: '貝塚人工島')
  #       patch user_record_path(user_id: user, id: @record), params: { record: record_params }
  #       @record.reload
  #       expect(@record.spot).to eq('貝塚人工島')
  #     end

  #     it 'リクエストが成功すること' do
  #       expect(response.status).to eq 302
  #     end

  #     it 'ユーザー名が更新されること' do
  #       expect(@record.spot).not_to eq 'かもめ大橋'
  #     end

  #     it 'リダイレクトすること' do
  #       expect(response).to user
  #     end
  #   end
  # end

  # describe '#destroy' do
  #   context '未ログイン状態のとき' do
  #     it 'フィシング記録を削除できないこと' do
  #       record = create(:record, spot_id: @spot.id)
  #       expect do
  #         delete spot_record_path(spot_id: @spot.id, id: record.id), xhr: true
  #       end.to change(record.all, :count).by(0)
  #     end
  #   end

  #   context 'ログイン状態のとき' do
  #     before do
  #       sign_in(user)
  #     end

  #     it 'フィシング記録を削除できること' do
  #       record = create(:record, user: user, spot_id: @spot.id)
  #       expect do
  #         delete spot_record_path(spot_id: @spot.id, id: record.id), xhr: true
  #       end.to change(Record.all, :count).by(-1)
  #     end

  #     it 'フィシング記録を作成したユーザーしか削除できないこと' do
  #       record = create(:record, user: @user, spot_id: @spot.id)
  #       expect do
  #         delete spot_record_path(spot_id: @spot.id, id: record.id), xhr: true
  #       end.to change(Record.all, :count).by(0)
  #     end
  #   end
  # end
end
