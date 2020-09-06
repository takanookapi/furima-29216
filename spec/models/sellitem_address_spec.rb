require 'rails_helper'

RSpec.describe SellitemAddress, type: :model do
  describe '#create' do
    before do
      @sellitem_address = FactoryBot.build(:sellitem_address)
    end

    # 支払い登録
    # 支払いが完了できる
    it '全て存在する時に支払いができる' do
      expect(@sellitem_address).to be_valid
    end

    # 支払いが完了できない
    it 'カード情報がないとき' do
      @sellitem_address.token = ''
      @sellitem_address.valid?
      expect(@sellitem_address.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号が空の時' do
      # @address = FactoryBot.build(:address)
      @sellitem_address.postal_code = ''
      @sellitem_address.valid?
      expect(@sellitem_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it '都道府県が空の時' do
      # @address = FactoryBot.build(:address)
      @sellitem_address.shipping_orig_id = '1'
      @sellitem_address.valid?
      expect(@sellitem_address.errors.full_messages).to include('Shipping orig must be other than 1')
    end

    it '市区町村が空の時' do
      # @address = FactoryBot.build(:address)
      @sellitem_address.city = ''
      @sellitem_address.valid?
      expect(@sellitem_address.errors.full_messages).to include("City can't be blank")
    end

    it '番地が空の時' do
      # @address = FactoryBot.build(:address)
      @sellitem_address.address_other = ''
      @sellitem_address.valid?
      expect(@sellitem_address.errors.full_messages).to include("Address other can't be blank")
    end

    it '電話番号が空の時' do
      # @address = FactoryBot.build(:address)
      @sellitem_address.telephone_num = ''
      @sellitem_address.valid?
      expect(@sellitem_address.errors.full_messages).to include("Telephone num can't be blank")
    end

    it '郵便番号が正式ではない型で入れられていない時' do
      # @address = FactoryBot.build(:address)
      @sellitem_address.postal_code = '1111111'
      @sellitem_address.valid?
      expect(@sellitem_address.errors.full_messages).to include('Postal code is invalid')
    end

    it '電話番号が正式ではない型で入れられていない時' do
      # @address = FactoryBot.build(:address)
      @sellitem_address.telephone_num = '0120-111-111'
      @sellitem_address.valid?
      expect(@sellitem_address.errors.full_messages).to include('Telephone num is invalid')
    end
  end
end

# bundle exec rspec spec/models/sellitem_address_spec.rb
# bundle exec rubocop -a
