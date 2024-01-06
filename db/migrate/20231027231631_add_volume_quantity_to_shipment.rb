# frozen_string_literal: true

class AddVolumeQuantityToShipment < ActiveRecord::Migration[7.0]
  def up
    add_column :shipments, :volume_quantity, :integer, null: false
  end

  def down
    remove_column :shipments, :volume_quantity
  end
end
