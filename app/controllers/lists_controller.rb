require "pry"
class ListsController < ApplicationController 

        before do
            require_login
        end

        get '/list/new' do
            erb :'/list/new'
        end


        post '/list' do
            @lists = current_user.lists.build(params)
            if @lists.save
                redirect to '/list'
            else 
                @error = "Error: Please enter in a valid description."
                erb :'/list/new'
            end
        end


        get '/list' do
            @lists = current_user.lists.reverse
            erb :'/list/index'
        end
    

        get '/list/:id' do
            @lists = List.find_by_id(params[:id])
            if current_user.id == @lists.user_id
                erb :'/list/show'
            else
                @error = "That list item does not exist. Please try again."
                @lists = current_user.lists.reverse
                erb :'/list/index'
            end
        end

    
        get '/list/:id/edit' do
            # binding.pry
            @list = List.find_by_id(params[:id])
            if current_user.id == @list.user_id
                erb :'/list/edit'
            else
                @error = "That list item does not exist. Please try again."
                @lists = current_user.lists.reverse
                erb :'/list/index'
            end
        end

     
        patch '/list/:id' do
            @list = List.find_by_id(params[:id])
            if current_user.id == @list.user_id && !params[:description].strip.empty?
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
