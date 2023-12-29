class CreateNotifications < ActiveRecord::Migration[7.2]
  def change
    create_table :notifications do |t|
      t.string :action
      t.string :icon
      t.string :message
      t.string :priority
      t.boolean :read
      t.string :type
      t.integer :user_id, null: false

      t.index [:user_id, :read]

      t.timestamps
    end
  end
end