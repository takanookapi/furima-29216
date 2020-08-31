class RemoveImageFromBuyItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :buy_items, :image, :text
  end
end
