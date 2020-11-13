require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views' 
    enable :sessions
    set :session_secret,  ENV['SESSION_SECRET']
  end

  get "/" do
    erb :home
  end

  helpers do
    # binding.pry
    def current_user
        User.find_by_id(session[:user_id])
    end

    def is_logged_in?
        !!current_user
    end

    def require_login
      unless is_logged_in?
        redirect '/login'
      end
    end

  end
  
end
