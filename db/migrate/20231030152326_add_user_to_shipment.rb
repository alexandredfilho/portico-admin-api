# frozen_string_literal: true

class AddUserToShipment < ActiveRecord::Migration[7.2]
  def up
    add_reference :shipments, :user, null: false, foreign_key: true
  end

  def down
    remove_references :shipments, :user
  end
end
