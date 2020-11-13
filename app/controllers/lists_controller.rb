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
            if @lists.description.strip != "" && @lists.save
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
            erb :'/list/show'
        end

    

        get '/list/:id/edit' do
            @list = List.find_by_id(params[:id])
            erb :'/list/edit'
        end

   
     
        patch '/list/:id' do
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
            @list.saveå
            redirect "/list"
        end
end
