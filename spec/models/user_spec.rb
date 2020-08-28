require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    # ユーザー新規登録
    # 新規登録がうまく行く時
    it "ニックネームが"



    # 新規登録がうまくいかない時
  end
end





# いつでもコピペ用
# bundle exec rspec spec/models/user_spec.rb 