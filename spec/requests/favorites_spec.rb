require 'rails_helper'

RSpec.describe 'Favorites', type: :request do
  let(:user) { create(:user) }

  before do
    @spot = create(:spot)
  end

  describe '#create' do
    context 'スポットが存在しないとき' do
      it 'いいねできないこと' do
        expect do
          post favorites_path, xhr: true
        end.to change(Favorite.all, :count).by(0)
      end
    end

    context '未ログイン状態のとき' do
      it 'いいねできないこと' do
        expect do
          post favorites_path(@spot.id), xhr: true
        end.to change(Favorite.all, :count).by(0)
      end

      it 'ログインページにリダイレクトされること' do
        post favorites_path(@spot.id), xhr: true
        expect(response.status).to eq 302
        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'ログイン状態のとき' do
      it 'いいねできること' do
        expect do
          post favorites_path(@spot.id), xhr: true
        end.to change(Favorite.all, :count).by(0)
      end
    end
  end

  describe '#destroy' do
    before do
      @favorite = create(:favorite, user: user, spot: @spot)
    end

    context '未ログイン状態のとき' do
      it 'いいね解除できないこと' do
        expect do
          delete favorite_path(spot_id: @spot.id, id: @spot.favorites[0].id), xhr: true
        end.to change(Favorite.all, :count).by(0)
      end

      it 'ログインページにリダイレクトされること' do
        delete favorite_path(spot_id: @spot.id, id: @spot.favorites[0].id), xhr: true
        expect(response.status).to eq 302
        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'ログイン状態のとき' do
      it 'いいねを解除できること' do
        sign_in(user)
        expect do
          delete favorite_path(spot_id: @spot.id, id: @spot.favorites[0].id), xhr: true
        end.to change(Favorite.all, :count).by(-1)
      end
    end
  end
end