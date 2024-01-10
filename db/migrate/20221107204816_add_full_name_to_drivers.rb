class AddFullNameToDrivers < ActiveRecord::Migration[7.0]
  def change
    add_column :drivers, :full_name, :string
  end
end
