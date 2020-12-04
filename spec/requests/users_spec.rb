require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { create(:user) }

  describe 'GET #index' do
    before do
      get user_path(user)
    end

    it 'リクエストが成功すること' do
      expect(response.status).to eq 200
    end

    it 'user名が表示されること' do
      expect(response.body).to include 'test'
    end
  end

  describe 'GET #show' do
    describe 'ユーザーが存在する場合' do
      before do
        user = create(:user)
        get user_url user.id
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 200
      end

      it 'ユーザー名が表示されていること' do
        expect(response.body).to include 'test'
      end
    end
  end

  describe 'GET #new' do
    it 'リクエストが成功すること' do
      get new_user_registration_path
      expect(response.status).to eq 200
    end
  end

  describe 'GET #edit' do
    before do
      sign_in(user)
      get edit_user_registration_path(user)
    end

    it 'リクエストが成功すること' do
      expect(response.status).to eq 200
    end

    it 'ユーザー名が表示されていること' do
      expect(response.body).to include 'test'
    end

    it 'メールアドレスが表示されていること' do
      expect(response.body).to include 'test@example.com'
    end
  end

  describe 'POST #create' do
    describe 'パラメータが妥当な場合' do
      before do
        post user_registration_path
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 200
      end

      it 'ユーザーが登録されること' do
        expect(user.name).to eq 'test'
      end
    end
  end

  describe 'PUT #update' do
    describe 'パラメータが妥当な場合' do
      before do
        sign_in(user)
        patch user_registration_path, params: { user: attributes_for(:user).merge(password: 'testtest') }
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 302
      end

      it 'ユーザー名が更新されること' do
        expect(User.name).not_to eq 'test'
      end

      it 'リダイレクトすること' do
        expect(response).to redirect_to user
      end
    end
  end
end