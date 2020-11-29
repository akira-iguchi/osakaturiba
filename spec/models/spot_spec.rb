require 'rails_helper'

RSpec.describe Spot, type: :model do
  let(:spot) { create(:spot) }
  let(:district) { create(:district) }
  
  it "有効なファクトリを持つこと" do
    expect(build(:spot)).to be_valid
  end
  
  it "名前、緯度、経度、地区があれば有効な状態であること" do
    spot = Spot.new(
      name: "かもめ大橋",
      explanation: "かもめ大橋の下に位置する波止が釣り場である。内側はアジやクロダイ、外側はハマチなどの青物が狙える。
                    秋になると、外側から内側の順にタチウオが釣れ始める。",
      address: "〒559-0032 大阪府大阪市住之江区南港南５丁目",
      latitude: 34.6114,
      longitude: 135.419,
      district: district
    )
    expect(spot).to be_valid
  end
  
  describe '存在性の検証' do
    it "名前がない場合は登録できないこと" do
      spot.name = nil
      spot.valid?
      expect(spot.errors[:name]).to include("を入力してください")
    end
    
    it "説明がない場合は登録できないこと" do
      spot.explanation = nil
      spot.valid?
      expect(spot.errors[:explanation]).to include("を入力してください")
    end
    
    it "住所がない場合は登録できないこと" do
      spot.address = nil
      spot.valid?
      expect(spot.errors[:address]).to include("を入力してください")
    end
    
    it "緯度がない場合は登録できないこと" do
      spot.latitude = nil
      spot.valid?
      expect(spot.errors[:latitude]).to include("を入力してください")
    end
    
    it "経度がない場合は登録できないこと" do
      spot.longitude = nil
      spot.valid?
      expect(spot.errors[:longitude]).to include("を入力してください")
    end
    
    it "地区がない場合は登録できないこと" do
      spot.district = nil
      spot.valid?
      expect(spot.errors[:district]).to include("を入力してください")
    end
  end
  
  describe 'コメントの生成' do
    it '有効なコメントを生成できること' do
      expect(create(:comment)).to be_valid
    end
  end
  
  describe '削除依存性の検証' do
    it '削除すると紐づくコメントも削除されること' do
      create(:comment, spot: spot)
      expect { spot.destroy }.to change(spot.comments, :count).by(-1)
    end
    
    it '削除すると紐づくお気に入りも削除されること' do
      create(:favorite, spot: spot)
      expect { spot.destroy }.to change(spot.favorites, :count).by(-1)
    end
  end
  
  describe 'Googleマップ' do
    it "スポットの緯度と経度を取得すること" do
      VCR.use_cassette('南港') do
        district = FactoryGirl.create(:spot,
          name: "かもめ大橋",
          explanation: "かもめ大橋の下に位置する波止が釣り場である。内側はアジやクロダイ、
                        外側はハマチなどの青物が狙える。秋になると、外側から内側の順にタチウオが釣れ始める。",
          address: "〒559-0032 大阪府大阪市住之江区南港南５丁目",
          latitude: 34.6114,
          longitude: 135.419,
        )
        expect(district.latitude).to eq 34.6114
        expect(district.longitude).to eq 135.419
      end
    end
  end
end
