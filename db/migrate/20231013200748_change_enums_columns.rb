class ChangeEnumsColumns < ActiveRecord::Migration[7.1]
  def change
    remove_column :shipments, :kind
    remove_column :shipments, :warehouse
    remove_column :shipments, :status

    add_column :shipments, :kind, :text, null: false
    add_column :shipments, :warehouse, :text, null: false
    add_column :shipments, :status, :text, null: false
  end
end
