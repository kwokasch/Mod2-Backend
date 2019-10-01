require_relative '../../config/key.rb'

class ArtistsController < ApplicationController
    def index
        @artists = Artist.all 

        render json: @artists 
        # include: :album
    end

    def show 
        @artist = Artist.find(params[:id])

        # spotify_artist_id = get_artist_id(params[:name])
        # find_artist(spotify_artist_id)

        render json: @artist
    end

    def create    
        
        spot_id = get_spotify_id(params[:name])

        rest_client = RestClient.get("https://api.spotify.com/v1/artists/#{spot_id}",
        'Authorization' => "Bearer #{get_token}")
        response = JSON.parse(rest_client)  

        # byebug

        @artist = Artist.create({
            name: response["name"], 
            followers: response["followers"]["total"],
            genre: response["genres"],
            spotify_id: response["id"]
        })
    end

    def get_spotify_id(name)
        rest_client = RestClient.get("https://api.spotify.com/v1/search?q=#{name}&type=artist",
        'Authorization' => "Bearer #{get_token}")
        response = JSON.parse(rest_client)  

        artist_id = response["artists"]["items"].map do |item|
            item["id"]
        end.first
        artist_id
    end

    def get_token
        base_url = "https://api.spotify.com/v1"
        # attr_accessor :access_token
        # def self.access_token
        token = RestClient.post('https://accounts.spotify.com/api/token',
            {'grant_type': 'client_credentials'},
            {'Authorization': "Basic #{SpotifyKey::KEY}"})
        JSON.parse(token)['access_token']
        # end
    end
    
end
