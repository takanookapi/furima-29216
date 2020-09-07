class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string    :postal_code,                  null:false
      t.integer   :shipping_orig_id,                null:false
      t.string    :city,                         null:false
      t.string    :address_other,                null:false
      t.string    :building_name,                null:true
      t.string    :telephone_num,                null:false
      t.integer   :sell_item_id,                 null:false, foreign_key: true
      
      t.timestamps
    end
  end
end
