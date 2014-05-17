class AuthController < ApplicationController

  def callback
    puts "callback: #{params.inspect}"
    puts client.inspect
    puts redirect_uri.inspect
    new_token = client.auth_code.get_token(params[:code], :redirect_uri => redirect_uri)
    session[:access_token]  = new_token.token
    redirect root_path

  end
end
