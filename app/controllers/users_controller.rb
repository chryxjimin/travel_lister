class UsersController < ApplicationController 

    get '/signup' do
        erb :'/users/signup'
    end

    post '/signup' do
        #  binding.pry
        if params[:username].strip != "" && params[:password].strip != ""
            @user = User.create(username: params[:username], password: params[:password])
            session[:user_id] = @user.id 
            erb :'/list/new'
        else 
            @error = "Error: Username and password cannot be blank."
            erb :'/users/signup'
        end
    end

    get '/login' do
        if current_user
            @lists = TravelLister.all
            @message = "You are already logged in, #{current_user.username}"
            erb :'/list/index'
        else
            erb :"/users/login"
        end
    end

    post '/login' do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/list"
        else
            @error = "Incorrect username or password. Please try again."
            erb :"/users/login"
        end
    end


	get "/logout" do
		session.clear
		redirect "/"
	end
            

end