class ChangeShipmentFieldValidation < ActiveRecord::Migration[7.1]
  def up
    change_column :shipments, :cargo_checker, :string, null: false
    change_column :shipments, :dock, :string, null: false
    change_column :shipments, :invoice_number, :string, null: false
    rename_column :shipments, :internship, :status
  end

  def down
    change_column :shipments, :cargo_checker, :string, null: true
    change_column :shipments, :dock, :string, null: true
    change_column :shipments, :invoice_number, :string, null: true
    rename_column :shipments, :status, :internship
  end
end
