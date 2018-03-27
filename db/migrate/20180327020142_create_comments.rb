class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :game, foreign_key: true
      t.references :person, foreign_key: true
      t.text :text

      t.timestamps
    end
  end
end
