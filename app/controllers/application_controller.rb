require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, SESSION_SECRET
    register Sinatra::Flash
    set :public_folder, 'public'
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
  end

  get "/" do
    erb :index
  end

  def logged_in?
    !!current_user
  end

  def current_user 
    User.find(session[:user_id]) unless session[:user_id].nil?
  end


end
