class CreateVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles do |t|
      create_enum :bodywork, %w[motorcycle car van truck]
      t.string :manufacturer
      t.string :sample
      t.string :license_plate
      t.enum(:bodywork, enum_type: 'bodywork', null: false)

      t.timestamps
    end
  end
end
