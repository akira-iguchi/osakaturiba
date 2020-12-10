require 'rails_helper'

RSpec.feature 'Districts', type: :feature do
  before do
    @district = create(:district,
                       name: '南港',
                       latitude: 34.6261,
                       longitude: 135.419
                      )
  end

  scenario '地区詳細ページへ行く' do
    # トップページを開く
    visit root_path

    # 地区詳細ページへ
    click_link @district.name.to_s
  end
end

