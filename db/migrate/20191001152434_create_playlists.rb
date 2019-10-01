class CreatePlaylists < ActiveRecord::Migration[6.0]
  def change
    create_table :playlists do |t|
      t.belongs_to :artist, index: true
      t.belongs_to :album, index: true

      t.timestamps
    end
  end
end
