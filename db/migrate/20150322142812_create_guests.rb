class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.text :guest_name
      t.text :guest_email
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
