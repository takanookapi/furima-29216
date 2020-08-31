class BuyItem < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_orig

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :content
    validates :image
    validates :category_id,      numericality: { other_than: 1 }
    validates :item_status_id,   numericality: { other_than: 1 }
    validates :shipping_days_id, numericality: { other_than: 1 }
    validates :shipping_fee_id,  numericality: { other_than: 1 }
    validates :shipping_orig_id, numericality: { other_than: 1 }
    validates_inclusion_of :price, in: 300..9_999_999, message: 'out of range'
  end
end
