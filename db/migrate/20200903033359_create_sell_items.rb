class CreateSellItems < ActiveRecord::Migration[6.0]
  def change
    create_table :sell_items do |t|
      t.integer   :user_id,             null:false, foreign_key: true
      t.integer   :buy_item_id,             null:false, foreign_key: true
      
      t.timestamps
    end
  end
end
