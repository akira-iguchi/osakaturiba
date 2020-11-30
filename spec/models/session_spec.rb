require 'rails_helper'

RSpec.describe Session, type: :model do
  let(:session) {create(:session)}
  
  it '有効なファクトリを持つこと' do
    expect(build(:session)).to be_valid
  end
  
  describe 'メソッドの検証' do
    it "登録されていないメールアドレスは無効なこと" do
      session.email = "test1@example.com"
      session.valid?
      expect(session.errors[:email]).to include("は使われていません")
    end
    
    it "登録されていないパスワードは無効なこと" do
      session.email = "test@example.com"
      session.password = "test1"
      session.valid?
      expect(session.errors[:password]).to include("は正しくありません")
    end
  end
end
