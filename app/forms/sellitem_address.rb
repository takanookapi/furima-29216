class SellitemAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_orig_id, :city, :address_other, :building_name, :telephone_num, :sell_item_id, :user_id, :buy_item_id, :token

  
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :shipping_orig_id
    validates :telephone_num, format: { with: /\A(0{1}\d{9,10})\z/}
    validates :city
    validates :address_other
    validates :token
  end

  def save
    sell_item = SellItem.create(user_id: user_id, buy_item_id: buy_item_id)
    Address.create(postal_code: postal_code, shipping_orig_id: shipping_orig_id, city: city, address_other: address_other, building_name: building_name,telephone_num: telephone_num, sell_item_id: sell_item.id )
  end

end