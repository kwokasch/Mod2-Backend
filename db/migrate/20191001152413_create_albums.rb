class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :musicians
      t.string :songs
      t.string :spotify_id
      t.string :image

      t.timestamps
    end
  end
end
