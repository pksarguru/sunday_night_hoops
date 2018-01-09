class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.integer :person_id
      t.integer :game_id
      t.integer :guests

      t.timestamps

    end
  end
end
