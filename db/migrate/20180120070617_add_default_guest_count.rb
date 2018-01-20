class AddDefaultGuestCount < ActiveRecord::Migration[5.0]
  def change
    change_column :players, :guests, :integer, default: 0
  end
end
