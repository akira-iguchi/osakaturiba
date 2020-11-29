require 'rails_helper'

RSpec.describe District, type: :model do
  describe 'googlemap' do
    it "地区の緯度と経度を取得すること" do
      VCR.use_cassette('南港') do
        district = FactoryGirl.create(:district,
          name: "南港",
          latitude: 34.6261,
          longitude: 135.419
        )
        expect(district.latitude).to eq 34.6261
        expect(district.longitude).to eq 135.419
      end
    end
  end
end
