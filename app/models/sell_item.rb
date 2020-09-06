class SellItem < ApplicationRecord
  belongs_to :user
  belongs_to :buy_item
  has_one    :address
end
