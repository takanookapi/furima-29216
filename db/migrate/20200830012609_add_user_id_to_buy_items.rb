class AddUserIdToBuyItems < ActiveRecord::Migration[6.0]
  def change
    add_column :buy_items, :image, :text
  end
end
