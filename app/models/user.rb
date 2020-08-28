class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  


      with_options presence: true do
        validates :name
        validates :email, uniqueness: true,
                          format: { with: /\A([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+\z/i}
        
        validates :password, confirmation: true,
                              length: { minimum: 5 },
                              format: { with: /\A[a-z\d]+\z/i}                   
      end
      
      with_options presence: true, format: { with: /\A[ぁ-んァ-ヶー一-龠]+\z/i} do
        validates :first_name
        validates :last_name
      end

      with_options presence: true, format: { with: /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/i} do
        validates :first_name_kana
        validates :last_name_kana
      end

      with_options presence: true do
        validates :date
      end
end
