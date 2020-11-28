require 'rails_helper'

RSpec.describe User, :type => :model do
  
  describe "プロフィール" do
    it "有効なファクトリを持つこと" do
      expect(build(:user)).to be_valid
    end
    
    it "名前、メールアドレス、パスワードがあれば有効な状態であること" do
      user = User.new(
        name: "test",
        email: "test@example.com",
        password: "test",
      )
      expect(user).to be_valid
    end
    
    context '存在性の検証' do
      it "名前がない場合は登録できないこと" do
        user = build(:user, name: nil)
        user.valid?
        expect(user.errors[:name]).to include("を入力してください")
      end
      
      it "メールアドレスがない場合は登録できないこと" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end
      
      it "パスワードがない場合は登録できないこと" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
      end
    end
    
    context '文字数の検証' do
      it "名前が21文字以上の場合は登録できない" do
        user = build(:user, name: "a" * 21)
        user.valid?
        expect(user.errors[:name]).to include("は20文字以内で入力してください")
      end
    end
    
    context '独自性の検証' do
      it "重複したメールアドレスなら登録できないこと" do
        User.create(
          name: 'test',
          email: 'test@example.com'
        )
        user = User.new(
          name: 'test',
          email: 'test@example.com'
        )
        expect(user.errors[:email]).not_to include("はすでに存在します")
      end
    end
    
    context '正確性の検証' do
      it "不正なメールアドレスは無効であること" do
        user = build(:user, email: 'aa@com')
        user.valid?
        expect(user.errors[:email]).to include("は不正な値です")
      end
    end
  end
  
  describe 'メソッドの検証' do
    it 'お気に入りしていたらtrueを返すこと' do
      spot1 = build(:spot)
      spot2 = build(:spot)
      user = build(:user)
      create(:favorite, user_id: user.id, spot_id: spot1.id)
      expect(user.already_favorite?(spot1)).to be_truthy
      expect(user.already_favorite?(spot2)).to be_falsy
    end
  end
end
