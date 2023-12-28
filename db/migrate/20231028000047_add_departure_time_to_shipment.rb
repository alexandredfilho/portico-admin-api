# frozen_string_literal: true

class AddDepartureTimeToShipment < ActiveRecord::Migration[7.2]
  def up
    add_column :shipments, :departure_time, :string
  end

  def down
    remove_column :shipments, :departure_time
  end
end
