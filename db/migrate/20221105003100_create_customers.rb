class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      create_enum :status, %w[active inactive]
      t.string :description
      t.enum(:status, enum_type: "status", default: "active", null: false)

      t.timestamps
    end
  end
end
