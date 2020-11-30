require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:user) { create(:user) }
  let(:spot) {create(:spot)}
  let(:favorite) { create(:favorite) }
  
  it '有効なファクトリを持つこと' do
    expect { create(:favorite) }.to change(Favorite.all, :count).by(1)
  end
  
  it 'ユーザー、スポットがあれば有効であること' do
    favorite = Favorite.new(
      user: user,
      spot: spot
    )
    expect(favorite).to be_valid
  end

  describe '存在性の検証' do
    it 'ユーザーがなければ無効であること' do
      favorite.user = nil
      favorite.valid?
      expect(favorite.errors[:user]).to include('を入力してください')
    end
    
    it 'スポットがなければ無効であること' do
      favorite.spot = nil
      favorite.valid?
      expect(favorite.errors[:spot]).to include('を入力してください')
    end
  end
end
