class AddUniqueTrackAndOrd < ActiveRecord::Migration[5.1]
  def change
    add_index :tracks, [:album_id, :ord], unique: true
  end
end
