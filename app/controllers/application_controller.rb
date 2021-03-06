require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, SESSION_SECRET # Set for later
    register Sinatra::Flash
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :index
  end

  def current_user 
    User.find(session[:user_id]) unless session[:user_id].nil?
  end

end
