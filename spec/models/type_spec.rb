require 'rails_helper'

RSpec.describe Type, type: :model do
  let(:fishing_type) { create(:fishing_type) }
  let(:spot) { create(:spot) }
  let(:type) { create(:type) }

  it '有効なファクトリを持つこと' do
    expect(build(:type)).to be_valid
  end

  it '釣り方、スポットがあれば有効であること' do
    type = Type.new(
      fishing_type: fishing_type,
      spot: spot
    )
    expect(type).to be_valid
  end

  describe '存在性の検証' do
    it '釣り方がなければ無効であること' do
      type.fishing_type = nil
      type.valid?
      expect(type.errors[:fishing_type]).to include('を入力してください')
    end

    it 'スポットがなければ無効であること' do
      type.spot = nil
      type.valid?
      expect(type.errors[:spot]).to include('を入力してください')
    end
  end
end
