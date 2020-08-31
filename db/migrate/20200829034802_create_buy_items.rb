class CreateBuyItems < ActiveRecord::Migration[6.0]
  def change
    create_table :buy_items do |t|
      t.string           :title,               null:false
      t.string           :content,             null:false
      t.integer          :category_id,         null:false
      t.integer          :item_status_id,      null:false
      t.integer          :shipping_fee_id,     null:false
      t.integer          :shipping_orig_id,    null:false
      t.integer          :shipping_days_id,    null:false
      t.integer          :price,               null:false
      t.integer          :user_id,             null:false, foreign_key: true
      t.timestamps
    end
  end
end
