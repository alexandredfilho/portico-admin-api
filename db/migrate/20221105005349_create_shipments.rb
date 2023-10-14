class CreateShipments < ActiveRecord::Migration[7.1]
  def change
    create_table :shipments do |t|
      create_enum :kind, %w[delivery dispatch]
      create_enum :warehouse, %w[high-tech healthcare]
      create_enum :internship, %w[processing finished]

      t.references :driver, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.string :invoice_number
      t.string :cargo_checker
      t.string :dock
      t.enum(:kind, enum_type: 'kind', null: false)
      t.enum(:warehouse, enum_type: 'warehouse', null: false)
      t.enum(:internship, enum_type: 'internship', null: false)

      t.timestamps
    end
  end
end
