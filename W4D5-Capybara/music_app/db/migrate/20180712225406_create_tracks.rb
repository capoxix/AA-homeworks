class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.integer :album_id, null: false
      t.string :title, null: false
      t.integer :ord, null: false
      t.boolean :bonus, null:false, default: false
      t.text :lyrics
    end

    add_index :tracks, :album_id
  end
end
