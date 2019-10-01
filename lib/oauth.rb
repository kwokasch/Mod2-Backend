require 'rest-client'
# require 'pry'
require 'json'


class GetData
    @@base_url = "https://api.spotify.com/v1"
    attr_accessor :access_token
    def self.access_token
        token = RestClient.post('https://accounts.spotify.com/api/token',
            {'grant_type': 'client_credentials'},
            {'Authorization': "Basic NDg4OTdhZWZiYjc1NGUzOTk0ODczYzgxYzQyZmJkY2Y6ZjZhNGU0NzBkMTFiNDZjNGIxZjE2NzE3NzdkNmRlMmQ="})
        JSON.parse(token)['access_token']
    end
 end
