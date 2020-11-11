class UsersController < ApplicationController 

    get '/signup' do
        erb :'/users/signup'
    end

    post '/signup' do
        #  binding.pry
        if params[:username] != "" && params[:password] != ""
            @user = User.create(username: params[:username], password: params[:password])
            @user.save
            session[:user_id] = @user.id 
            erb :'/list/new'
        else 
            @error = "Username and password cannot be blank."
            erb :'/users/signup'
        end
    end

    get '/login' do
        @current_user = User.find_by_id(session[:user_id])
        if @current_user
            # session[:user.id] = user.id
            redirect "/list"
        else
            erb :"/users/login"
        end
    end

    post '/login' do
        user = User.find_by_id(params[:id])
        if user && user.authenticate(params[:password])
            session[:user.id] = user.id
            erb :"/list/index"
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