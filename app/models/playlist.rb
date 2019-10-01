class Playlist < ApplicationRecord
    belongs_to :artist
    belongs_to :album
end
