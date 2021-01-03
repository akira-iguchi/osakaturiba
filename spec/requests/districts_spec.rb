require 'rails_helper'

RSpec.describe 'Districts', type: :request do
  let(:district) { create(:district) }

  describe 'GET #show' do
    describe '地区が存在する場合' do
      before do
        get district_url district.id
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 200
      end

      it '地区名が表示されていること' do
        expect(response.body).to include '南港'
      end
    end
  end
end
