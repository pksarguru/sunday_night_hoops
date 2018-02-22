class EditGameDateColumnForGames < ActiveRecord::Migration[5.0]
  def change
    remove_column :games, :game_date, :string
    add_column :games, :game_date, :date
  end
end
