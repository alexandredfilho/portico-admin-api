class AddRolesToUsers < ActiveRecord::Migration[7.1]
  def up
    add_column :users, :role, :integer, default: 0
  end

  def down
    remove_column :users, :role
  end
end
