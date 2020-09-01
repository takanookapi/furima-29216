class RenameShippingDaysIdColumnToShippingDays < ActiveRecord::Migration[6.0]
  def change
    rename_column :buy_items, :shipping_days_id, :shipping_day_id
  end
end
