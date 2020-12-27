require 'rails_helper'

RSpec.describe FishingType, type: :model do
  let(:fishing_type) { create(:fishing_type) }

  it '有効なファクトリを持つこと' do
    expect(build(:spot)).to be_valid
  end

  it '名前、内容があれば有効な状態であること' do
    fishing_type = FishingType.new(
      name: 'サビキ釣り',
      content: 'サビキを使った釣り方。'
    )
    expect(fishing_type).to be_valid
  end

  describe '存在性の検証' do
    it '名前がある場合は登録できること' do
      fishing_type.name
      fishing_type.valid?
      expect(fishing_type).to be_valid
    end

    it '名前がない場合でも登録できないこと' do
      fishing_type.name = nil
      fishing_type.valid?
      expect(fishing_type.errors[:name]).to include('を入力してください')
    end

    it '内容がある場合は登録できること' do
      fishing_type.content
      fishing_type.valid?
      expect(fishing_type).to be_valid
    end

    it '内容がない場合でも登録できないこと' do
      fishing_type.content = nil
      fishing_type.valid?
      expect(fishing_type.errors[:content]).to include('を入力してください')
    end
  end
end
