class AddNameToPeople < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :name, :string
  end
end
