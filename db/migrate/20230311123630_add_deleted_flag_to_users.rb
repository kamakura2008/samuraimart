class AddDeletedFlagToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :deleted_flag, :boolean, default: false, null: false
    # rename_column :users, :deleted_flag, :deleted_flg
  end
end
