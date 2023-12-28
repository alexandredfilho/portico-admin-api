class CreateShipments < ActiveRecord::Migration[7.2]
  def change
    create_table :shipments do |t|
      t.references :driver, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.string :invoice_number
      t.string :cargo_checker
      t.string :dock
      t.string :kind
      t.string :warehouse
      t.string :status

      t.timestamps
    end
  end
end
