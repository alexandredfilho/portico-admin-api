class ChangeCustomerColumnName < ActiveRecord::Migration[7.0]
  def up
    rename_column :customers, :description, :title
  end

  def down
    rename_column :customers, :title, :description
  end
end
