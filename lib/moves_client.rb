require 'oauth2'
require 'json'
require 'date'

class MovesClient

  def client
    OAuth2::Client.new(
      ENV['MOVES_CLIENT_ID'],
      ENV['MOVES_CLIENT_SECRET'],
      :site => 'https://api.moves-app.com',
      :authorize_url => 'moves://app/authorize',
      :token_url => 'https://api.moves-app.com/oauth/v1/access_token')
  end

  def access_token
    OAuth2::AccessToken.new(client, session[:access_token], :refresh_token => session[:refresh_token])
  end

end

