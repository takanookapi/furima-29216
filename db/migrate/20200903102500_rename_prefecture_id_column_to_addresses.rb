class RenamePrefectureIdColumnToAddresses < ActiveRecord::Migration[6.0]
  def change
    rename_column :addresses, :prefecture_id, :shipping_orig_id
  end
end