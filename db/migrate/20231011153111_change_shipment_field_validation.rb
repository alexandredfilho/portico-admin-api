class ChangeShipmentFieldValidation < ActiveRecord::Migration[7.2]
  def up
    change_column :shipments, :cargo_checker, :string, null: false
    change_column :shipments, :dock, :string, null: false
    change_column :shipments, :invoice_number, :string, null: false
  end

  def down
    change_column :shipments, :cargo_checker, :string, null: true
    change_column :shipments, :dock, :string, null: true
    change_column :shipments, :invoice_number, :string, null: true
  end
end
