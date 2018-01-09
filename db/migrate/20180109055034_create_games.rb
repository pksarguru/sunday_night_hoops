class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :game_date
      t.boolean :cancelled

      t.timestamps

    end
  end
end
