class AddNameColumnsToPeople < ActiveRecord::Migration[5.0]
  def change
    remove_column :people, :name, :string
    add_column :people, :first_name, :string
    add_column :people, :last_name, :string
  end
end
