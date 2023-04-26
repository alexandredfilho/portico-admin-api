class CreateFullNameForDrivers < ActiveRecord::Migration[7.1]
  def change
    Driver.find_each(batch_size: 1000) { |driver| driver.save }
  end
end
