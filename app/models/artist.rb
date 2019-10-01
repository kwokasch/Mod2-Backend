class Artist < ApplicationRecord
    has_many :playlists
    has_many :albums, through: :playlists
end
