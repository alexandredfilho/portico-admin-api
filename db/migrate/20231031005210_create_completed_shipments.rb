class CreateCompletedShipments < ActiveRecord::Migration[7.1]
  def change
    create_table :completed_shipments do |t|
      t.integer :user_id, null: false
      t.integer :shipment_id, null: false

      t.timestamps
    end
  end
end
