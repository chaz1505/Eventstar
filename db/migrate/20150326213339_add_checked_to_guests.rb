class AddCheckedToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :checked, :boolean
  end
end
