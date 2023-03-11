class AddDeletedFlagToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :deleted_flag, :boolean, default: false, null: false
  end
end
