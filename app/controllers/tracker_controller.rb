class TrackerController < ApplicationController
  def index
    unless session[:access_token]
      @moves_authorize_uri = client.auth_code.authorize_url(:redirect_uri => redirect_uri, :scope => 'activity')
    end
  end

  def logout
    session[:access_token]  = nil
    redirect_to root_path
  end

  def profile
    @json = access_token.get("/api/1.1/user/profile").parsed
  end

  def recent
    @json = access_token.get("/api/1.1/user/summary/daily?pastDays=7").parsed
    @steps = @json.map { |day|
      unless day["summary"].nil?
        (day["summary"].find { |a| a["group"] == "walking"})["steps"]
      else
        0
      end
    }
  end
end
