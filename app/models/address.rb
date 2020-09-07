class Address < ApplicationRecord
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :shipping_orig_id, numericality: { other_than: 1 }
    validates :telephone_num, format: { with: /\A(0{1}\d{9,10})\z/ }
    validates :city
    validates :address_other
  end

  belongs_to :sell_item
  
end
