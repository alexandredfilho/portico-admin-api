class CreateDrivers < ActiveRecord::Migration[7.0]
  def change
    create_table :drivers do |t|
      t.string :first_name
      t.string :last_name
      t.string :document
      t.string :shipping_company

      t.timestamps
    end
  end
end
