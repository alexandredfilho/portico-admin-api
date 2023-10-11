class ChangeDriversTableValidation < ActiveRecord::Migration[7.1]
  def up
    change_column :drivers, :document, :string, null: false
    change_column :drivers, :first_name, :string, null: false
    change_column :drivers, :shipping_company, :string, null: false
  end

  def down
    change_column :drivers, :document, :string, null: true
    change_column :drivers, :first_name, :string, null: true
    change_column :drivers, :shipping_company, :string, null: true
  end
end
