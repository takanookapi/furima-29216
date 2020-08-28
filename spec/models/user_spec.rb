require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    # ユーザー新規登録
    # 新規登録がうまく行く時

    it "全て存在すれば登録できる" do
      expect(@user).to be_valid
    end

    it "passwordが６文字以上で登録できる"do
    @user.password = "123456"
    @user.password_confirmation = "123456"
    expect(@user).to be_valid
    end


    # 新規登録がうまくいかない時

    it "nameが空だと登録できない"do
    @user.name = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it "emailが空だと登録できない"do
    @user.email= ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "passwordが空だと登録できない"do
    @user.password = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "password_confirmationが空だと登録できない"do
@user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "first_nameが空だと登録できない"do
    @user.first_name = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "last_nameが空だと登録できない"do
    @user.last_name = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "first_name_kanaが空だと登録できない"do
    @user.first_name_kana = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "last_name_kanaが空だと登録できない"do
    @user.last_name_kana = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "dateが空だと登録できない"do
    @user.date = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Date can't be blank")
    end

    it "emailが一意性がないと登録できない"do
    @user.save
    another_user = FactoryBot.build(:user, email: @user.email)
    another_user.valid?
    expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "emailが規則に則っていないと登録できない"do
    @user.email = 'user@example,com'
    expect(@user).to_not be_valid
    expect(@user.errors[:email]).to include("is invalid")
    end

    it "passwordとpassword_confirmationが一致しないと登録できない"do
    @user.password = "123456"
    @user.password_confirmation = "1234567"
    @user.valid?
    expect(@user.errors[:password_confirmation]).to be_present
    end

    it "passwordが５文字以下は登録できない"do
    @user.password = "12345"
    @user.password_confirmation = "12345"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

  end
end




# nilと""の違い
# いつでもコピペ用
# bundle exec rspec spec/models/user_spec.rb 