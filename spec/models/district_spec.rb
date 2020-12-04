require 'rails_helper'

RSpec.describe District, type: :model do
  let(:district) { create(:district) }

  it '有効なファクトリを持つこと' do
    expect(build(:district)).to be_valid
  end

  it '名前、緯度、経度があれば有効な状態であること' do
    district = District.new(
      name: '南港',
      latitude: 34.6261,
      longitude: 135.419
    )
    expect(district).to be_valid
  end

  describe '存在性の検証' do
    it '名前がない場合は登録できないこと' do
      district.name = nil
      district.valid?
      expect(district.errors[:name]).to include('を入力してください')
    end

    it '緯度がない場合は登録できないこと' do
      district.latitude = nil
      district.valid?
      expect(district.errors[:latitude]).to include('を入力してください')
    end

    it '経度がない場合は登録できないこと' do
      district.longitude = nil
      district.valid?
      expect(district.errors[:longitude]).to include('を入力してください')
    end
  end

  describe 'Googleマップ' do
    it '地区の緯度と経度を取得すること' do
      VCR.use_cassette('南港') do
        district = FactoryBot.create(:district,
                                      name: '南港',
                                      latitude: 34.6261,
                                      longitude: 135.419)
        expect(district.latitude).to eq 34.6261
        expect(district.longitude).to eq 135.419
      end
    end
  end

  describe 'スポットの生成' do
    it '有効なスポットを生成できること' do
      expect(create(:spot)).to be_valid
    end
  end
end
