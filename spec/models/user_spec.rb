require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーションテスト" do
    it "name, email, area, password, profile,に値があれば有効" do
      expect(build(:taiki)).to be_valid
    end

    it "nameがなければ無効" do
      expect(build(:taiki, name: nil)).to_not be_valid
    end

    it "emailがなければ無効" do
      expect(build(:taiki, email: nil)).to_not be_valid
    end

    it "areaがなければ無効" do
      expect(build(:taiki, area: nil)).to_not be_valid
    end

    it "profileがなければ無効" do
      expect(build(:taiki, profile: nil)).to_not be_valid
    end

    it "passwordがなければ無効" do
      expect(build(:taiki, password: nil)).to_not be_valid
    end
  end

  describe "インスタンスメソッドテスト" do
    before do
      @nattu = create(:nattu)
      @taiki = create(:taiki)
    end

    context "followメソッド" do
      it "ユーザーをフォローできる" do
        @taiki.follow(@nattu)
        @follow = Follow.first
        expect(@follow.user).to eq @nattu
        expect(@follow.follow).to eq @taiki
      end

      it "同じユーザーをフォローできない" do
        create(:follow, user_id: @nattu.id, follow_id: @taiki.id)
        @taiki.follow(@nattu)
        expect(Follow.count).to eq 1
      end
    end

    context "unfollowメソッド" do
      it "フォロー解除できる" do
        create(:follow, user_id: @nattu.id, follow_id: @taiki.id)
        expect(Follow.count).to eq 1

        @taiki.unfollow(@nattu)
        expect(Follow.count).to eq 0
      end
    end
  end
end
