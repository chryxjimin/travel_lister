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
        if is_logged_in?
            redirect "/list"
        else
            erb :"/users/login"
        end
    end

    post '/login' do
        user = User.find_by_id(params[:id])
        if user && user.authenticate(params[:password])
            session[:user.id] = user.id
        end
            redirect "/list"
    end

    helpers do
        def current_user
            User.find(session[:user_id])
        end

        def is_logged_in?
            !!current_user
        end
    end
            

end