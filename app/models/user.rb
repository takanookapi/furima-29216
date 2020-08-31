class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :buy_items

  with_options presence: true do
    validates :name
    validates :date
    validates :email, uniqueness: { case_sensitive: false },
                      format: { with: /\A([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+\z/i }

    validates :password, confirmation: true,
                         length: { minimum: 5 },
                         format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
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
