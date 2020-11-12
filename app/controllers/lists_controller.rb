require "pry"
class ListsController < ApplicationController 


        get '/list/new' do
            if current_user
                erb :'/list/new'
            else
                redirect '/login'
            end
        end



        post '/list' do
            # binding.pry
            #cannot get the user_id to be created and associated witht the list.user_id
            if current_user
                list = List.create(params)
                if list.description.strip != "" && list.save
                redirect to '/list'
                end
            else 
                @error = "Error: Please enter in a valid description."
                erb :'/list/new'
            end
        end


        get '/list' do
            if current_user
                #   binding.pry
                @lists = List.all.reverse
                erb :'/list/index'
            else
                redirect "/login"
            end
        end
    

        get '/list/:id' do
            if current_user
                @lists = List.find_by_id(params[:id])
                erb :'/list/show'
            else
                redirect "/login"
            end
        end

    

        get '/list/:id/edit' do
            @list = List.find_by_id(params[:id])
            erb :'/list/edit'
        end

   
     
        patch '/list/:id' do
            #   binding.pry
            @list = List.find_by_id(params[:id])
            if !params[:description].strip.empty?
                @list.update(description: params[:description])
                @list.save
                redirect "/list/#{params[:id]}"
            else
                @error = "Error: Please enter in a valid description."
                erb :'/list/edit'
            end
        end


        delete '/list/:id' do
            @list = List.find_by_id(params[:id])
            @list.delete
            @list.save
            redirect "/list"
        end
end
