class AddJtiToUsers < ActiveRecord::Migration[7.1]
  def up
    add_column :users, :jti, :string, null: false
    add_index :users, :jti, unique: true
  end

  def down
    remove_column :users, :jti
    remove_index :users, name: :jti
  end
end
