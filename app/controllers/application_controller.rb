class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def redirect_uri
    uri = URI.parse(request.url)
    uri.path = '/auth/moves/callback'
    uri.query = nil
    uri.to_s
  end

  def client
    MovesClient.new.client
  end

  def access_token
    OAuth2::AccessToken.new(client, session[:access_token], :refresh_token => session[:refresh_token])
  end

  protected

  def after_sign_in_path_for(resource)
    # return the path based on resource
    tracker_path
  end


end
