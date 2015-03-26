class Change < ActiveRecord::Migration
  def change
	change_column :guests, :guest_name, :string
	change_column :guests, :guest_email, :string
  end
end
