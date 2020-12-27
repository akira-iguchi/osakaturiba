require 'rails_helper'

RSpec.describe 'Spots', type: :request do
  let(:spot) { create(:spot) }

  describe 'GET #show' do
    describe 'スポットが存在する場合' do
      before do
        get spot_url spot.id
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 200
      end

      it 'スポット名が表示されていること' do
        expect(response.body).to include 'かもめ大橋'
      end
    end
  end

  describe 'GET #search' do
    describe 'スポットが存在しない場合' do
      before do
        get spot_search_url
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 200
      end

      it 'スポット名が表示されていないこと' do
        expect(response.body).to include '該当なし'
      end
    end
  end
end