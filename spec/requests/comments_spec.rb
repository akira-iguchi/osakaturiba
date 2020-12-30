require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  let(:user) { create(:user) }

  before do
    @spot = create(:spot)

    @user2 = create(:user,
      name: 'test2',
      email: 'tes2t@example.com',
      password: 'test123',
      password_confirmation: 'test123'
     )
  end

  describe '#create' do
    context 'スポットが存在しないとき' do
      it 'コメントを作成できないこと' do
        comment_params = attributes_for(:comment, user_id: user.id)
        expect do
          post spot_comments_path(@spot), params: { comment: comment_params }, xhr: true
        end.to change(Comment.all, :count).by(0)
      end
    end

    context '未ログイン状態のとき' do
      it 'コメントを作成できないこと' do
        comment_params = attributes_for(:comment, spot_id: @spot.id)
        expect do
          post spot_comments_path(@spot), params: { comment: comment_params }, xhr: true
        end.to change(Comment.all, :count).by(0)
      end
    end

    context 'ログイン状態のとき' do
      before do
        sign_in(user)
      end

      it 'コメントを作成できること' do
        comment_params = attributes_for(:comment, spot_id: @spot.id)
        expect do
          post spot_comments_path(@spot), params: { comment: comment_params }, xhr: true
        end.to change(Comment.all, :count).by(1)
      end
      
      it '失敗時はコメントを作成できないこと' do
        comment_params = attributes_for(:comment, content: nil, spot_id: @spot.id)
        post spot_comments_path(@spot), params: { comment: comment_params }, xhr: true
        expect(response.status).to eq 200
      end

    end
  end

  describe '#destroy' do
    context '未ログイン状態のとき' do
      it 'コメントを削除できないこと' do
        comment = create(:comment, spot_id: @spot.id)
        expect do
          delete spot_comment_path(spot_id: @spot.id, id: comment.id), xhr: true
        end.to change(Comment.all, :count).by(0)
      end
    end

    context 'ログイン状態のとき' do
      before do
        sign_in(user)
      end

      it 'コメントを削除できること' do
        comment = create(:comment, user: user, spot_id: @spot.id)
        expect do
          delete spot_comment_path(spot_id: @spot.id, id: comment.id), xhr: true
        end.to change(Comment.all, :count).by(-1)
      end

      it 'コメントを作成したユーザーしか削除できないこと' do
        comment = create(:comment, user: @user2, spot_id: @spot.id)
        expect do
          delete spot_comment_path(spot_id: @spot.id, id: comment.id), xhr: true
        end.to change(Comment.all, :count).by(0)
      end
    end
  end
end