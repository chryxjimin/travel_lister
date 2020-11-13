class UsersController < ApplicationController 

    get '/signup' do
        erb :'/users/signup'
    end

    post '/signup' do
        user = User.new(username: params[:username], password: params[:password])
        if user.save
            session[:user_id] = user.id 
            erb :'/list/new'
        else
            @error = "Invalid data. Please try again."
            erb :'/users/signup'
        end
    end

    get '/login' do
        if current_user
            @lists = List.all
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
            if params[:username].strip == "" ||  params[:password].strip == ""
                @error = "The username and password cannot be blank."
                erb :"/users/login"
            else
                @error = "Incorrect username or password. Please try again."
                erb :"/users/login"
            end
        end
    end


	get "/logout" do
		session.clear
		redirect "/"
	end
            

end