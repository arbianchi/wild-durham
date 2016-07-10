class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :permission, :string
    add_column :users, :phone, :string
  end
end
