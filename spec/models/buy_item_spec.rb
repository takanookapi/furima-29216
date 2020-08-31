require 'rails_helper'

RSpec.describe BuyItem, type: :model do
  describe '#create' do
    before do
      @buy_item = FactoryBot.build(:buy_item)
      @buy_item.image = fixture_file_upload('app/assets/images/aiueo.png')
    end
    # 出品
    # 出品がうまくいく時

    it "全て存在すれば出品できる" do
      expect(@buy_item).to be_valid
    end

    # 出品がうまくいく時

    it "画像が空だと登録できない" do
      @buy_item.image = nil
      @buy_item.valid?
      expect(@buy_item.errors.full_messages).to include("Image can't be blank")
    end

    it "商品名が空だと登録できない" do
      @buy_item.title = ""
      @buy_item.valid?
      expect(@buy_item.errors.full_messages).to include("Title can't be blank")
      
    end

    it "商品説明が空だと登録できない" do
      @buy_item.content = ""
      @buy_item.valid?
      expect(@buy_item.errors.full_messages).to include("Content can't be blank")
      
    end

    it "カテゴリーが空だと登録できない" do
      @buy_item.category_id = "1"
      @buy_item.valid?
      expect(@buy_item.errors.full_messages).to include("Category must be other than 1")
    end

    it  "商品の状態が空だと登録できない" do
      @buy_item.item_status_id = "1"
      @buy_item.valid?
      expect(@buy_item.errors.full_messages).to include("Item status must be other than 1")
    end

    it "配送料の負担が空だと登録できない" do
      @buy_item.shipping_fee_id = "1"
      @buy_item.valid?
      expect(@buy_item.errors.full_messages).to include("Shipping fee must be other than 1")
    end

    it "発送元の地域が空だと登録できない" do
      @buy_item.shipping_orig_id = "1"
      @buy_item.valid?
      expect(@buy_item.errors.full_messages).to include("Shipping orig must be other than 1")
    end

    it "発送までの日数が空だと登録できない" do
      @buy_item.shipping_days_id = "1"
      @buy_item.valid?
      expect(@buy_item.errors.full_messages).to include("Shipping days must be other than 1")
    end

    it "価格が空だと登録できない" do
      @buy_item.price = "0"
      @buy_item.valid?
      expect(@buy_item.errors.full_messages).to include("Price out of range")
    end
  end
end

# nilと""の違い
# いつでもテストコード起動のコピペ用
# bundle exec rspec spec/models/buy_item_spec.rb