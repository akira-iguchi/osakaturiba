require 'rails_helper'

RSpec.describe "FishingTypes", type: :request do
  let(:fishing_type) { create(:fishing_type) }

  describe "GET #index" do
    describe '釣り方が存在する場合' do
      before do
        @fishing_type = create(:fishing_type)
        get fishing_types_path
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 200
      end

      it '釣り方名が表示されていること' do
        expect(response.body).to include 'サビキ釣り'
      end

      it '釣り方の内容が表示されていること' do
        expect(response.body).to include 'サビキを使う釣り方。'
      end
    end
  end

end
