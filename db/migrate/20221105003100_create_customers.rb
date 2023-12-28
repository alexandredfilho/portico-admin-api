class CreateCustomers < ActiveRecord::Migration[7.2]
  def change
    create_table :customers do |t|
      create_enum :status, %w[active inactive]
      t.string :description
      t.string :status, null: false

      t.timestamps
    end
  end
end
