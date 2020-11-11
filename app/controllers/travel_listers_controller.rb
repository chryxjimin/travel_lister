require "pry"
class TravelListersController < ApplicationController 


        get '/list/new' do
            erb :'/list/new'
        end


        post '/list' do
            list = TravelLister.new(params)
            if list.description.strip != "" && list.save
                redirect to '/list'
            else 
                @error = "Error: Please enter in a valid description."
                erb :'/list/new'
            end
        end

 
        
        get '/list' do
            if is_logged_in?
                @lists = TravelLister.all.reverse
                erb :'/list/index'
            else
                redirect "/login"
            end
        end

     

        get '/list/:id' do
            if is_logged_in?
                @lists = TravelLister.find_by_id(params[:id])
                erb :'/list/show'
            else
                redirect "/login"
            end
        end

    

        get '/list/:id/edit' do
            @list = TravelLister.find_by_id(params[:id])
            erb :'/list/edit'
        end

   
     
        patch '/list/:id' do
            #   binding.pry
            @list = TravelLister.find_by_id(params[:id])
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
            @list = TravelLister.find_by_id(params[:id])
            @list.delete
            @list.save
            redirect "/list"
        end
end