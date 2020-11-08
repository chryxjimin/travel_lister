class UsersController < ApplicationController 

    get '/signup' do
        erb :'/users/signup'
    end

    post '/signup' do
        user = User.create(username: params[:username], password: params[:password])
        if user.username != "" && user.password != ""
            session[:user_id] = user.id 
            erb :'/list/index'
        else 
            redirect to '/signup'
        end
    end

    get '/login' do
        
        redirect to '/users/login'
    end

    post '/login' do

    end

end