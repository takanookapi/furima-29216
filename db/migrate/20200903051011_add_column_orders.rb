class AddColumnOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :user_id,    :integer,  null: false, foreign_key: true

    add_column :orders, :custmor_id, :string,   null: false

    add_column :orders, :card_id,    :string,   null: false

  end
end