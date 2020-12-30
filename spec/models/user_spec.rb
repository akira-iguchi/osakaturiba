require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:spot) { create(:spot) }
  let(:comment) { create(:comment) }

  it '有効なファクトリを持つこと' do
    expect(build(:user)).to be_valid
  end

  it '名前、メールアドレス、パスワード、パスワード確認があれば有効な状態であること' do
    user = User.new(
      name: 'test',
      email: 'test@example.com',
      password: 'testtest',
      password_confirmation: 'testtest'
    )
    expect(user).to be_valid
  end

  describe '存在性の検証' do
    it '名前がない場合は登録できないこと' do
      user.name = nil
      user.valid?
      expect(user.errors[:name]).to include('を入力してください')
    end

    it 'メールアドレスがない場合は登録できないこと' do
      user.email = nil
      user.valid?
      expect(user.errors[:email]).to include('を入力してください')
    end

    it 'パスワードがない場合は登録できないこと' do
      user.password = nil
      user.valid?
      expect(user.errors[:password]).to include('を入力してください')
    end

    it '画像がある場合でも登録できること' do
      user.image
      user.valid?
      expect(user).to be_valid
    end

    it '画像がない場合でも登録できること' do
      user.image = nil
      user.valid?
      expect(user).to be_valid
    end
  end

  describe '一致性の検証' do
    it 'パスワードが確認用と一致していない場合は無効であること' do
      user.password_confirmation = 'bbbbbbbb'
      user.valid?
      expect(user.errors[:password_confirmation]).to include('とパスワードの入力が一致しません')
    end
  end

  describe '文字数の検証' do
    it '名前が10文字以内の場合は登録できること' do
      user.name = 'a' * 10
      user.valid?
      expect(user).to be_valid
    end

    it '名前が11文字以上の場合は登録できないこと' do
      user.name = 'a' * 11
      user.valid?
      expect(user.errors[:name]).to include('は10文字以内で入力してください')
    end

    it 'パスワードが128文字以内の場合は登録できること' do
      user.password = 'a' * 128
      user.password_confirmation = 'a' * 128
      user.valid?
      expect(user).to be_valid
    end

    it 'パスワードが33文字以上の場合は登録できないこと' do
      user.password = 'a' * 129
      user.valid?
      expect(user.errors[:password]).to include('は128文字以内で入力してください')
    end

    it 'パスワードが5文字以内であれば登録できないこと' do
      user.password = 'a' * 5
      user.password_confirmation = 'a' * 5
      user.valid?
      expect(user.errors[:password]).to include('は6文字以上で入力してください')
    end

    it 'パスワードが6文字以上であれば登録できること' do
      user.password = 'test123'
      user.password_confirmation = 'test123'
      user.valid?
      expect(user).to be_valid
    end
  end

  describe '一意性の検証' do
    it '重複したメールアドレスなら登録できないこと' do
      user.save
      User.create(
        name: 'test',
        email: 'test@example.com'
      )
      expect(user.errors[:email]).not_to include('はすでに存在します')
    end

    it 'メールアドレスは大文字でも小文字に変換されること' do
      user.email = 'Test@example.com'
      user.save
      expect(user.reload.email).to eq 'test@example.com'
    end
  end

  describe '正確性の検証' do
    it '不正なメールアドレスは無効であること' do
      user.email = 'aa@com'
      user.valid?
      expect(user.errors[:email]).to include('は不正な値です')
    end

    it 'パスワードは半角英数字混合でも有効であること' do
      build(:user, password: 'test123')
      user.valid?
      expect(user).to be_valid
    end
  end

  describe 'コメントの生成' do
    it '有効なコメントを生成できること' do
      expect(create(:comment)).to be_valid
    end
  end

  describe '削除依存性の検証' do
    it '削除すると紐づくコメントも削除されること' do
      create(:comment, user: user)
      expect { user.destroy }.to change(user.comments, :count).by(-1)
    end

    it '削除すると紐づくお気に入りも削除されること' do
      create(:favorite, user: user)
      expect { user.destroy }.to change(user.favorites, :count).by(-1)
    end
  end

  describe 'メソッドの検証' do
    it 'お気に入りすることができること' do
      expect { user.favorite(spot) }.to change(spot.favorites, :count).by(1)
    end

    it 'お気に入りを解除することができること' do
      user.favorite(spot)
      expect { user.unfavorite(spot) }.to change(spot.favorites, :count).by(-1)
    end

    it 'お気に入りしていたらtrueを返すこと' do
      create(:favorite, user_id: user.id, spot_id: spot.id)
      user.favorite(spot)
      expect(user.favorite(spot)).to be_truthy
    end

    it 'ゲストユーザーの作成ができる' do
      expect do
        @guest_user = User.guest
      end.to change(User.all, :count).by(1)
      expect(@guest_user.name).to eq 'ゲストユーザー'
      expect(@guest_user.email).to eq 'guest@example.com'
    end

    it 'ゲストユーザーがいた場合、ゲストユーザーをfindできる' do
      user = User.create(
        email: 'guest@example.com',
        name: 'ゲストユーザー',
        password: 'password'
      )
      guest_user = User.guest
      expect(guest_user.name).to eq user.name
      expect(guest_user.email).to eq user.email
    end
  end
end
