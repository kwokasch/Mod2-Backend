require 'rest-client'
require 'json'
# require 'pry'
require_relative '../lib/oauth.rb'
# require_relative '../app/models/artist.rb'

def get_artist_id(name)
    rest_client = RestClient.get("https://api.spotify.com/v1/search?q=#{name}&type=artist",
    'Authorization' => "Bearer #{GetData.access_token}")
    response = JSON.parse(rest_client)  

    artist_id = response["artists"]["items"].map do |item|
        item["id"]
    end.first
    artist_id
end

# binding.pry

def find_albums(artist)
    
    artist_id = get_artist_id(artist)

    rest_client = RestClient.get("https://api.spotify.com/v1/artists/#{artist_id}/albums?limit=10",
    'Authorization' => "Bearer #{GetData.access_token}")
    response = JSON.parse(rest_client)  

    albums = response["items"].map do |item|
        name = item["name"]
    end.uniq
    albums  
    
end

# binding.pry
# def get_artist_albums(artist_name)
#     # rest_client = RestClient.get("https://api.spotify.com/v1/search?q=#{input}&type=artist",
#     # 'Authorization' => "Bearer #{GetData.access_token}")
#     # response = JSON.parse(rest_client)  

#     # artist_id = response["artists"]["items"].map do |item|
#     #     item["id"]
#     # end.first
#     artist_id = get_artist_id(artist_name)
#     albums = find_albums(artist_id)
#     # albums.map do |album|
#     #     Album.create
#     # binding.pry
# end

def find_artist(artist_name)
    artist_id = get_artist_id(artist_name)

    rest_client = RestClient.get("https://api.spotify.com/v1/artists/#{artist_id}",
    # rest_client = RestClient.get("https://api.spotify.com/v1/artists/3jOstUTkEu2JkjvRdBA5Gu",
    'Authorization' => "Bearer #{GetData.access_token}")
    response = JSON.parse(rest_client)  

    # response.each do |artist|
    #     Artist.create(
    #         name: artist["name"],
    #         followers: artist["followers"]["total"],
    #         genre: artist["genres"],
    #         spotify_id: artist["id"]
    #     )
    # end
    # binding.pry
end

# binding.pry

get_artist_albums("Weezer")
find_artist("Beatles")
# binding.pry

# binding.pry
