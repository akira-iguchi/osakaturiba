require 'rails_helper'

RSpec.describe Session, type: :model do
  let(:user) { create(:user) }
  let(:session) { create(:session) }

  describe 'メソッドの検証' do
    it '登録されていないメールアドレスは無効なこと' do
      session.email = 'test1@example.com'
      session.valid?
      expect(session.errors[:email]).to include('は使われていません')
    end
  end
end
