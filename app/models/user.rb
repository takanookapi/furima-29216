class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :buy_items

  with_options presence: true do
    validates :name
    validates :date
    validates :email, uniqueness: { case_sensitive: false }

    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

    validates :password, confirmation: true,
                         length: { minimum: 5 }
  end

  with_options presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[一-龠々])+\z/ } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /[\p{katakana}ー－&&[^ -~｡-ﾟ]]+/ } do
    validates :first_name_kana
    validates :last_name_kana
  end
end
