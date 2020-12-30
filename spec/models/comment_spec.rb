require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create(:user) }
  let(:spot) { create(:spot) }
  let(:comment) { create(:comment) }

  it '有効なファクトリを持つこと' do
    expect(build(:comment)).to be_valid
  end

  it '内容、ユーザー、スポットがあれば有効であること' do
    comment = Comment.new(
      content: 'test',
      user: user,
      spot: spot
    )
    expect(comment).to be_valid
  end

  describe '存在性の検証' do
    it '内容がなければ無効であること' do
      comment.content = nil
      comment.valid?
      expect(comment.errors[:content]).to include('を入力してください')
    end

    it 'ユーザーがなければ無効であること' do
      comment.user = nil
      comment.valid?
      expect(comment.errors[:user]).to include('を入力してください')
    end

    it 'スポットがなければ無効であること' do
      comment.spot = nil
      comment.valid?
      expect(comment.errors[:spot]).to include('を入力してください')
    end

    it '画像がある場合でも有効できること' do
      comment.image
      comment.valid?
      expect(comment).to be_valid
    end

    it '画像がない場合でも有効できること' do
      comment.image = nil
      comment.valid?
      expect(comment).to be_valid
    end
  end

  describe '文字数の検証' do
    it '内容が150文字以内の場合は登録できること' do
      comment.content = 'a' * 150
      comment.valid?
      expect(comment).to be_valid
    end

    it '内容が151文字以上の場合は登録できないこと' do
      comment.content = 'a' * 151
      comment.valid?
      expect(comment.errors[:content]).to include('は150文字以内で入力してください')
    end
  end
end
