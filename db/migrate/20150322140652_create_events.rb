class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :event_name
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
