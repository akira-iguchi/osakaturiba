require 'rails_helper'

RSpec.describe Record, type: :model do
  let(:user) { create(:user) }
  let(:record) { create(:record) }

  it '有効なファクトリを持つこと' do
    expect(build(:record)).to be_valid
  end

  it '釣り場、釣り方、start_time、ユーザーがあれば有効な状態であること' do
    record = Record.new(
      spot: 'かもめ大橋',
      fishingtype: 'サビキ釣り',
      start_time: '2020-12-26 00:00:00',
      user: user
    )
    expect(record).to be_valid
  end

  describe '存在性の検証' do
    it '釣り場がなければ無効な状態であること' do
      record.spot = nil
      record.valid?
      expect(record.errors[:spot]).to include('を入力してください')
    end

    it '釣り方がなければ無効な状態であること' do
      record.fishingtype = nil
      record.valid?
      expect(record.errors[:fishingtype]).to include('を入力してください')
    end

    it 'start_timeがなければ無効な状態であること' do
      record.start_time = nil
      record.valid?
      expect(record.errors[:start_time]).to include('を入力してください')
    end

    it 'ユーザーがなければ無効な状態であること' do
      record.user = nil
      record.valid?
      expect(record.errors[:user]).to include('を入力してください')
    end

    it 'エサがなくても有効な状態であること' do
      record.bait = nil
      record.valid?
      expect(record).to be_valid
    end

    it '天気がなくても有効な状態であること' do
      record.weather = nil
      record.valid?
      expect(record).to be_valid
    end

    it '開始時刻がなくても有効な状態であること' do
      record.fishing_start_time = nil
      record.valid?
      expect(record).to be_valid
    end

    it '終了時刻がなくても有効な状態であること' do
      record.fishing_end_time = nil
      record.valid?
      expect(record).to be_valid
    end
  end

  describe '文字数の検証' do
    it '釣り場が30文字以内の場合は登録できること' do
      record.spot= 'a' * 30
      record.valid?
      expect(record).to be_valid
    end

    it '釣り場が31文字以上の場合は登録できないこと' do
      record.spot = 'a' * 31
      record.valid?
      expect(record.errors[:spot]).to include('は30文字以内で入力してください')
    end

    it '釣り方が30文字以内の場合は登録できること' do
      record.fishingtype= 'a' * 30
      record.valid?
      expect(record).to be_valid
    end

    it '釣り方が31文字以上の場合は登録できないこと' do
      record.fishingtype = 'a' * 31
      record.valid?
      expect(record.errors[:fishingtype]).to include('は30文字以内で入力してください')
    end

    it 'エサが30文字以内の場合は登録できること' do
      record.bait = 'a' * 30
      record.valid?
      expect(record).to be_valid
    end

    it 'エサが31文字以上の場合は登録できないこと' do
      record.bait = 'a' * 31
      record.valid?
      expect(record.errors[:bait]).to include('は30文字以内で入力してください')
    end

    it '天気が30文字以内の場合は登録できること' do
      record.weather = 'a' * 30
      record.valid?
      expect(record).to be_valid
    end

    it '天気が31文字以上の場合は登録できないこと' do
      record.weather = 'a' * 31
      record.valid?
      expect(record.errors[:weather]).to include('は30文字以内で入力してください')
    end

    it '詳細が150文字以内の場合は登録できること' do
      record.detail = 'a' * 150
      record.valid?
      expect(record).to be_valid
    end

    it '詳細が151文字以上の場合は登録できないこと' do
      record.detail = 'a' * 151
      record.valid?
      expect(record.errors[:detail]).to include('は150文字以内で入力してください')
    end
  end
end
